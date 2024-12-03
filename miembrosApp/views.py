import os
from django.shortcuts import redirect, render
from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from miembrosApp.forms import MiembroForm
from miembrosApp.models import Miembro
from django.contrib.auth.decorators import permission_required

@permission_required('miembrosApp.add_miembro',login_url='/')
def crearMiembro(request):
    form = MiembroForm()
    if request.method == 'POST' and request.FILES['foto']:
        form = MiembroForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Miembro creado con éxito!')
            return redirect('listarmiembros')
    data = {
        'titulo': 'Crear miembro',
        'formulario': form
    }
    return render(request, 'miembros/create.html', data)

@permission_required('miembrosApp.view_miembro',login_url='/')
def listarMiembros(request):
    lista = Miembro.objects.all()
    data = {'lista': lista }
    return render(request,'miembros/miembros.html',data)

@permission_required('miembrosApp.delete_miembro',login_url='/')
def eliminarMiembro(request, id):
    miembro = Miembro.objects.get(pk=id)
    #verifica si existe foto
    if miembro.foto and miembro.foto.path:
        #elimina la foto
        miembro.foto.delete(save=False)
    miembro.delete()
    messages.success(request, 'Miembro eliminado exitósamente')
    return redirect('/miembros/miembros/')

@permission_required('miembrosApp.change_miembro',login_url='/')
def editarMiembro(request, id):
    miembro = Miembro.objects.get(pk=id)
    form = MiembroForm(instance=miembro)
    if request.method == 'POST':
        form = MiembroForm(request.POST,request.FILES,instance=miembro)
        if form.is_valid():
            if request.FILES['foto']:
                if miembro.foto:
                    #capturamos la foto antigua
                    miembroAnt = Miembro.objects.get(pk=id)
                    miembroAnt.foto.delete()          
            form.save()
            messages.success(request,'Miembro editado')
    data = {
        'titulo':'Editar miembro',
        'formulario':form
    }
    return render(request,'miembros/create.html',data)