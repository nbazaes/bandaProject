import os
from django.shortcuts import redirect, render
from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from albumsApp.forms import AlbumForm, AlbumFiltro
from albumsApp.models import Album
from django.db.models import Q
from django.contrib.auth.decorators import permission_required

@permission_required('albumsApp.add_album',login_url='/')
def crearAlbum(request):
    form = AlbumForm()
    if request.method == 'POST':
        form = AlbumForm(request.POST, request.FILES)
        if form.is_valid():
            album = form.save(commit=False)  # Guardar sin commitear todavía
            video_url = form.cleaned_data.get('video_url')  # Obtener el valor desde cleaned_data
            if video_url:
                if "watch?v=" in video_url:
                    video_id = video_url.split('watch?v=')[-1]
                else:
                    video_id = video_url.split('/')[-1]
                album.video_url = f"https://www.youtube.com/embed/{video_id}"
            album.save()  # Ahora guardar con la URL de embed
            messages.success(request, 'Álbum creado con éxito!')
            return redirect('listaralbums')
    data = {
        'titulo': 'Crear álbum',
        'formulario': form
    }
    return render(request, 'albums/create.html', data)


""" def crearAlbum(request):
    form = AlbumForm()
    if request.method == 'POST':
        form = AlbumForm(request.POST, request.FILES)
        if form.is_valid():
            if form.video_url:
                if "watch?v=" in form.video_url:
                    video_id = form.video_url.split('watch?v=')[-1]
                else:
                    video_id = form.video.url.split('/')[-1]
                album.video_url = f"https://www.youtube.com/embed/{video_id}"
            form.save()
            messages.success(request, 'Álbum creado con éxito!')
            return redirect('listaralbums')
    data = {
        'titulo': 'Crear álbum',
        'formulario': form
    }
    return render(request, 'albums/create.html', data) """

""" def crearAlbum(request):
    form = AlbumForm()               
    data = {
        'titulo':'Crear álbum',
        'formulario':form
    }
    #verificar si la petición viene por post
    if request.method == 'POST':
        #cargar los datos que trae el formulario
        form = AlbumForm(request.POST)
        #verificar si los datos del formulario son válidos, ORM DJANGO  is_valid
        if form.is_valid():
            #guardar en la base de datos 
            form.save()
            messages.success(request,'Género creado con éxito!')
    return  render(request,'albums/create.html',data) """

@permission_required('albumsApp.view_album',login_url='/')
def listarAlbums(request):
    form = AlbumFiltro()
    albums = Album.objects.all()
    if request.method == 'POST':
        form = AlbumFiltro(request.POST)
        banda = request.POST.get('bandas')
        texto = request.POST.get('texto')
        if banda != '':
            albums = albums.filter(banda__id = banda)      
        if texto != '':
            #icontains indica que contiene la palabra
            albums = albums.filter(Q(titulo__icontains=texto) | Q(banda__nombre__icontains=texto))
    data = {'lista':albums,'form':form}
    return render(request,'albums/albums.html',data)

@permission_required('albumsApp.delete_album',login_url='/')
def eliminarAlbum(request, id):
    album = Album.objects.get(pk=id)
    #verifica si existe foto
    if album.foto:
        #elimina la foto
        album.foto.delete()
    album.delete()
    return redirect('/albums/albums/')

@permission_required('albumsApp.change_album',login_url='/')
def editarAlbum(request, id):
    album = Album.objects.get(pk=id)
    form = AlbumForm(instance=album)
    if request.method == 'POST':
        form = AlbumForm(request.POST, request.FILES, instance=album)
        if form.is_valid():
            # Manejar la portada
            if request.FILES['portada']:
                if album.portada:
                    albumAnt = Album.objects.get(pk=id)
                    albumAnt.portada.delete()
            # Transformar la URL del video de YouTube
            video_url = form.cleaned_data.get('video_url')
            if video_url:
                if "watch?v=" in video_url:
                    video_id = video_url.split('watch?v=')[-1]
                else:
                    video_id = video_url.split('/')[-1]
                album.video_url = f"https://www.youtube.com/embed/{video_id}"
            form.save()  # Guardar el formulario con la nueva URL de embed y la portada
            messages.success(request, 'Álbum editado con éxito!')
            return redirect('listaralbums')
    data = {
        'titulo': 'Editar álbum',
        'formulario': form
    }
    return render(request, 'albums/create.html', data)


""" def editarAlbum(request, id):
    album = Album.objects.get(pk=id)
    form = AlbumForm(instance=album)
    if request.method == 'POST':
        form = AlbumForm(request.POST,request.FILES,instance=album)
        if form.is_valid():
            if request.FILES['portada']:
                if album.portada:
                    albumAnt = Album.objects.get(pk=id)
                    album.portada.delete()
            form.save()
            messages.success(request,'Álbum editado')
            return redirect('listaralbums')
    data = {
        'titulo':'Editar álbum',
        'formulario':form
    }
    return render(request,'albums/create.html',data) """