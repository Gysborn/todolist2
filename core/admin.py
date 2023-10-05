from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import Group

from core.models import User


@admin.register(User)
class CustomUserAdmin(UserAdmin):
    list_display = ('username', 'first_name', 'last_name', 'email')  # Отоброжаемые поля
    search_fields = ('username', 'first_name', 'last_name', 'email')  # Поиск по полям
    readonly_fields = ('last_login', 'date_joined')  # Отключить редактирование полей в админке
    fieldsets = ( # Отображение блоков внутри выбранного пользователя
        (None, {'fields': ('username', 'password')}),
        ('Персональная информация', {'fields': ('first_name', 'last_name', 'email')}),
        ('Разрешения', {'fields': ('is_active', 'is_superuser', 'is_staff')}),
        ('Даты', {'fields': ('last_login', 'date_joined')}),
    )


admin.site.unregister(Group)  # Исключаем группы из админки
