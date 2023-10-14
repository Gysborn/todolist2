FROM python:3.10.9-slim as base_image

ENV PIP_DISABLE_PIP_VERSION_CHECK=on \
    POETRY_VERSION=1.6.1
# Отключаем pip присваеваем версию poetry
RUN pip install "poetry==$POETRY_VERSION"
# устанавливаем poetry
WORKDIR /tmp
# создаем временную директорию для requirements prod и dev
COPY poetry.lock pyproject.toml ./
# копируем необходимые файлы в нее
RUN poetry export --without dev -f requirements.txt -o /tmp/requirements.prod.txt &&\
    poetry export --with dev -f requirements.txt -o /tmp/requirements.dev.txt &&\
    rm poetry.lock pyproject.toml &&\
    pip uninstall poetry -y
# создаем два requirements
WORKDIR /apt
# создаем рабочую директорию
COPY . .
# копируем файлы проекта
EXPOSE 8000

ENTRYPOINT ["bash", "entrypoint.sh"]

FROM base_image as prod_image
# запускаем с параметрами для прода
RUN pip install -r /tmp/requirements.prod.txt

CMD ["gunicorn", "todolist2.wsgi", "-w", "4", "-b", "0.0.0.0:8000"]
# 1 многопоточный сервер, 2 сервер джанго, 3 воркер, 4 их колич. 5 биндинг адреса и порта

FROM base_image as dev_image
# С параметрами для дебага
RUN pip install -r /tmp/requirements.dev.txt

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
