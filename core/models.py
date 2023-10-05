from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    REQUIRED_FIELDS = []# При создании  юзера не запрашивает email
    class Meta:
        verbose_name = 'Пользователь'
        verbose_name_plural = 'Пользователи'
