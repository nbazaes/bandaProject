from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from cuentasApp.forms import RegistroForm
from django.contrib.auth.models import User, Group
from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib import messages

def registrar_usuario(request):
    form = RegistroForm()
    data = {
        'titulo':'Registro',
        'formulario':form
    }
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data['username']
            password = form.cleaned_data['password1']
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                usuarios_group = Group.objects.get(name='Usuarios')
                user.groups.add(usuarios_group)
                messages.success(request, 'Registrado con éxito')
                return redirect('inicio')
            else:
                messages.error(request, 'Error de autenticación')
        else: 
            messages.error(request, 'Hubo un problema, intente otra vez') 
            return redirect('register')
    else:
        return render(request, 'accounts/register.html', data)
