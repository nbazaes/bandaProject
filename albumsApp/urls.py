from django.urls import path
from albumsApp.views import crearAlbum, editarAlbum, listarAlbums, eliminarAlbum

urlpatterns = [
    path("crearalbum/", crearAlbum, name="crearalbum"),
    path("editaralbum/<int:id>", editarAlbum, name="editaralbum"),
    path("eliminaralbum/<int:id>", eliminarAlbum, name="eliminaralbum"),
    path("albums/", listarAlbums, name="listaralbums")
]
