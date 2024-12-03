from django import forms
from albumsApp.models import Album
from bandasApp.models import Banda

class AlbumForm(forms.ModelForm):
    class Meta:
        model = Album
        fields = ['banda','titulo','fecha_lanzamiento','portada','video_url']
        widgets = {
            'banda':forms.Select(attrs={'class':'form-select'}),
            'titulo':forms.TextInput(attrs={'class':'form-control'}),
            'fecha_lanzamiento':forms.TextInput(attrs={'class':'form-control','type':'date'}),
            'portada':forms.FileInput(attrs={'class':'form-control'}),
            'video_url':forms.URLInput(attrs={'class':'form-control'})
        }
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['video_url'].required = False

class AlbumFiltro(forms.Form):
    bandas = forms.ModelChoiceField(queryset=Banda.objects.all(),
                                    empty_label='Todas las bandas',
                                    required=False,
                                    widget=forms.Select(attrs={'class':'form-select'}))
    #filtro para texto
    texto = forms.CharField(required=False,widget=forms.TextInput(attrs={'class':'form-control'}))
    
