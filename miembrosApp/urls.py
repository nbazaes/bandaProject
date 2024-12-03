from django.urls import path
from miembrosApp.views import crearMiembro, listarMiembros, editarMiembro, eliminarMiembro

urlpatterns = [
    path("crearmiembro/", crearMiembro, name="crearmiembro"),
    path("miembros/", listarMiembros, name="listarmiembros"),
    path("editarmiembro/<int:id>", editarMiembro, name="editarmiembro"),
    path("eliminarmiembro/<int:id>", eliminarMiembro, name="eliminarmiembro")
]
