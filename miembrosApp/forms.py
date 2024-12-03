from django import forms
from miembrosApp.models import Miembro
from bandasApp.models import Banda

class MiembroForm(forms.ModelForm):
    class Meta:
        model = Miembro
        fields = ['banda','nombre','apellido','instrumento','foto']
        widgets = {
            'banda': forms.Select(attrs={'class':'form-control'}),
            'nombre': forms.TextInput(attrs={'class':'form-control'}),
            'apellido': forms.TextInput(attrs={'class':'form-control', 'required':False}),
            'instrumento': forms.TextInput(attrs={'class':'form-control'}),
            'foto': forms.FileInput(attrs={'class':'form-control'})
        }
    
