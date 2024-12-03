from django.shortcuts import render,redirect
from bandasApp.forms import BandaForm, GeneroForm, BandFiltro
from django.contrib import messages
from bandasApp.models import Banda, Genero
#Q permite hacer consultas
from django.db.models import Q
from django.http import HttpResponse
#exportar excel
import xlwt
import datetime
#utilizar docaradores para autenticación
from django.contrib.auth.decorators import login_required, permission_required

#definimos para ingresar al sistema debe estar logeado
@login_required(login_url='/accounts/login/')
def inicio(request):
    return render(request,'index.html')

#permission_required sirve para verificar si el usuario tine permisos.
#add es crear , delete eliminar, change modificar y view listar
@permission_required('bandasApp.add_genero',login_url='/')
def crearGenero(request):
    form = GeneroForm()               
    data = {
        'titulo':'Crear género',
        'formulario':form
    }
    #verificar si la petición viene por post
    if request.method == 'POST':
        #cargar los datos que trae el formulario
        form = GeneroForm(request.POST)
        #verificar si los datos del formulario son válidos, ORM DJANGO  is_valid
        if form.is_valid():
            #guardar en la base de datos 
            form.save()
            messages.success(request,'Género creado con éxito!')
    return  render(request,'bandas/create.html',data)

@permission_required('bandasApp.view_genero',login_url='/')
def listarGeneros(request):
    #obects.all es simiar a un select * from 
    generos = Genero.objects.all()
    data = {'lista':generos}

    return render(request,'bandas/generos.html',data)

@permission_required('bandasApp.change_genero',login_url='/')
def editarGenero(request,id):
    genero = Genero.objects.get(pk=id)
    form = GeneroForm(instance=genero)
    if request.method == 'POST':
        form = GeneroForm(request.POST,instance=genero)
        if form.is_valid():
            form.save()
            messages.success(request,'Género modificado con éxito!')
    data = {
        'titulo':'Editar géneros',
        'formulario':form
    }
    return render(request,'bandas/create.html',data)

@permission_required('bandasApp.delete_genero',login_url='/')
def eliminarGenero(request,id):
    genero = Genero.objects.get(pk=id)
    genero.delete()
    return redirect('/bandas/generos/')

@permission_required('bandasApp.add_banda',login_url='/')
def crearBanda(request):
    form = BandaForm()               
    data = {
        'titulo':'Crear banda',
        'formulario':form
    }
    if request.method == 'POST':
        form = BandaForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,'Banda creada con éxito!')
    return  render(request,'bandas/create.html',data)

@permission_required('bandasApp.view_banda',login_url='/')
def listarBandas(request):
    #cargamos el formulario con filtro
    form = BandFiltro()
    bandas = Banda.objects.all()
    #verificamos si el formulario trae datos
    if request.method == 'POST':
        form = BandFiltro(request.POST)
        #capturamos el valor seleccionado en el select de cargos
        genero = request.POST.get('generos')
        texto = request.POST.get('texto')
        #preguntamos si es diferente del inicial
        if genero != '':
            #luego filtramos según la opción seleccionada
            bandas = bandas.filter(genero__id = genero)
        if texto != '':
            #icontains indica que contiene la palabra
            bandas = bandas.filter(Q(nombre__icontains=texto))
    #pasamos el formulario al data
    data = {'lista': bandas,'form':form}
    return render(request,'bandas/bandas.html',data)

@permission_required('bandasApp.delete_banda',login_url='/')
def eliminarBanda(request,id):
    banda = Banda.objects.get(pk=id)
    banda.delete()
    return redirect('/bandas/bandas')

@permission_required('bandasApp.change_banda',login_url='/')
def editarBanda(request,id):
    banda = Banda.objects.get(pk=id)
    form = BandaForm(instance=banda)
    if request.method == 'POST':
        #capturamos el post pero sin olvidar los datos traidos en banda
        form = BandaForm(request.POST,instance=banda)
        if form.is_valid():
            form.save()
            messages.success(request,'Banda editada con éxito.')
    
    data = {
        'titulo':'Editar banda',
        'formulario':form
    }        
    return render(request,'bandas/create.html',data)

def exportarExcel(request, genero):
    #indicamos el tipo de archivo a exportar
    response = HttpResponse(content_type='application/ms-excel')
    #asignar un nombre al archivo
    response['Content-Disposition'] = 'attachment; filename=bandas.xls'
    #instalar la librería que permite exportar a excel xlwt
    archivo = xlwt.Workbook(encoding='utf-8')
    #nombre a la hoja donde se encontrarán los registros
    hoja = archivo.add_sheet('Bandas')
    #donde queremos comenzar con los registros... es decir la fila
    row_num = 0
    font_style = xlwt.XFStyle()
    #dejar los encabezados en negrita
    font_style.font.bold = True
    #encabezados del excel
    columnas = ['ID','Nombre','Género','Fecha formación','Fecha separación','Biografía']
    #recorrer las columnas para asignar los encabezados
    for i in range(len(columnas)):
        #agregamos cada encabezado en una celda
        hoja.write(row_num,i,columnas[i],font_style)

    font_style = xlwt.XFStyle()

    date_style = xlwt.XFStyle() 
    date_style.num_format_str = 'DD-MM-YYYY'
    #creamos la consulta para pasar los datos al archivo excel
    filas = Banda.objects.all().values_list('id','nombre','genero__nombre','fecha_formacion','fecha_separacion','biografia')
    #realizamos el filtro necesario
    if genero != 0:
        filas = filas.filter(genero__id = genero)
    #llenar las celdas con los registros de la base de datos
    for f in filas:
        row_num += 1
        for col_num, cell in enumerate(f):
            if isinstance(cell, datetime.date):
                hoja.write(row_num, col_num, cell, date_style)
            else:
                hoja.write(row_num, col_num, cell, font_style)
    #guardar el archivo
    archivo.save(response)
    return response