from django.db import models
from bandasApp.models import Banda

class Miembro(models.Model):
    banda = models.ForeignKey(Banda, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(null=True, max_length=50)
    instrumento = models.CharField(max_length=50)
    foto = models.FileField(upload_to='miembros')

    class Meta:
        db_table = 'miembro'

    def __str__(self):
        return f'{self.nombre}'

