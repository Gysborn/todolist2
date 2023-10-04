1. pip install poetry
2. poetry init
3. poetry add Django
4. django-admin startproject todolist2 .
5. добавлен файл .gitignore
6. создан файл README
7. сделан push в GitHub
8. poetry add python-dotenv (в settings добавлено dotenv.load_dotenv())
9. создан файл .env
10. python manage.py startapp core и добавлен в INSTALLED_APPS
11. создана модель User на основе AbstractUser, в settings: AUTH_USER_MODEL = 'core.User'
12. установлен Postgres путем: docker run --name todolist2_pg -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
13. poetry add psycopg2-binary (драйвер для работы с psql)
14. добавлена переменная в .env DATABASE_URL=psql://:@:/
15. python manage.py makemigrations и python manage.py migratе
16. python manage.py createsuperuser (admin)
17. зарегистрирована админка в файле core.admin путем @register.admin(User) от UserAdmin
18. добавлено поле в core.models REQUIRED_FIELDS = [] (При создании  юзера не запрашивает email)
19. Настроена админка в файле core.admin
