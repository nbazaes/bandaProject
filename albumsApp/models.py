from django.db import models
from bandasApp.models import Banda

class Album(models.Model):
    banda = models.ForeignKey(Banda, on_delete=models.CASCADE)
    titulo = models.CharField(max_length=50)
    fecha_lanzamiento = models.DateField()
    portada = models.FileField(upload_to='albums')
    video_url = models.URLField(max_length=200, null=True)


    class Meta:
        db_table = 'album'

    def __str__(self):
        return f'{self.titulo}'

