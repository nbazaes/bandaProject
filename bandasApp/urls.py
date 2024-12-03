from django.urls import path
from bandasApp.views import crearGenero, editarGenero, listarGeneros, eliminarGenero, crearBanda, listarBandas, editarBanda, eliminarBanda, exportarExcel
urlpatterns = [
    path("creargenero/", crearGenero, name="creargenero"),
    path("editargenero/<int:id>", editarGenero, name="editargenero"),
    path("eliminargenero/<int:id>", eliminarGenero, name="eliminargenero"),
    path("generos/", listarGeneros, name="listargeneros"),
    path("crearbanda/", crearBanda, name="crearbanda"),
    path("editarbanda/<int:id>", editarBanda, name="editarbanda"),
    path("eliminarbanda/<int:id>", eliminarBanda, name="eliminarbanda"),
    path("bandas/", listarBandas, name="listarbandas"),
    path('exportexcel/<int:genero>',exportarExcel, name='exportexcel')
]
