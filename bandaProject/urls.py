"""
URL configuration for bandaProject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from bandasApp import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls, name='admin'),
    path('',views.inicio, name='inicio'),
    path('accounts/', include('django.contrib.auth.urls')),
    path('accounts/', include('cuentasApp.urls')),
    path("bandas/", include('bandasApp.urls')),
    path("albums/", include('albumsApp.urls')),
    path("miembros/", include('miembrosApp.urls')),
    path('accounts/', include('cuentasApp.urls'))
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
