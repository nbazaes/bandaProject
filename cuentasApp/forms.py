from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

class RegistroForm(UserCreationForm):

	class Meta:
		model = User
		fields = ('username', 'password1', 'password2')

	def __init__(self, *args, **kwargs):
		super(RegistroForm, self).__init__(*args, **kwargs)

		self.fields['username'].widget.attrs['class'] = 'form-control mb-4'
		self.fields['username'].widget.attrs['placeholder'] = 'Nombre de usuario'
		self.fields['username'].label = ''
		self.fields['username'].help_text = ''

		self.fields['password1'].widget.attrs['class'] = 'form-control mb-2'
		self.fields['password1'].widget.attrs['placeholder'] = 'Contraseña'
		self.fields['password1'].label = ''
		self.fields['password1'].help_text = ''

		self.fields['password2'].widget.attrs['class'] = 'form-control mb-2'
		self.fields['password2'].widget.attrs['placeholder'] = 'Confirmar contraseña'
		self.fields['password2'].label = ''
		self.fields['password2'].help_text = ''