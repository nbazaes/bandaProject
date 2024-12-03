from django import forms
from bandasApp.models import Genero, Banda

class GeneroForm(forms.ModelForm):
    class Meta:
        model = Genero
        fields = ['nombre']
        widgets = {
            'nombre':forms.TextInput(attrs={'class':'form-control'})
        }

class BandaForm(forms.ModelForm):
    class Meta:
        model = Banda
        fields = ['nombre','genero','fecha_formacion','fecha_separacion','biografia']
        widgets = {
            'nombre':forms.TextInput(attrs={'class':'form-control'}),
            'genero':forms.Select(attrs={'class':'form-select'}),
            'fecha_formacion': forms.TextInput(attrs={'class':'form-control','type':'date'}),
            'fecha_separacion': forms.TextInput(attrs={'class': 'form-control','type':'date'}),
            'biografia':forms.TextInput(attrs={'class':'form-control'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['fecha_separacion'].required = False


class BandFiltro(forms.Form):
    generos = forms.ModelChoiceField(queryset=Genero.objects.all(),
                                    empty_label='Todos los generos',
                                    required=False,
                                    widget=forms.Select(attrs={'class':'form-select'}))
    #filtro para texto
    texto = forms.CharField(required=False,widget=forms.TextInput(attrs={'class':'form-control'}))