from django.db import models

# Create your models here.
class Genero(models.Model):
    nombre = models.CharField(max_length=20)

    def __str__(self):
        return f'{self.nombre}'
    class Meta:
        db_table = 'genero'

class Banda(models.Model):
    nombre = models.CharField(max_length=50)
    genero = models.ForeignKey(Genero, on_delete=models.RESTRICT)
    fecha_formacion = models.DateField()
    fecha_separacion = models.DateField(null=True)
    biografia = models.TextField(max_length=300)

    def __str__(self):
        return f'{self.nombre}'
    class Meta:
        db_table = 'banda'


