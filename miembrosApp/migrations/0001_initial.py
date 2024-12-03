# Generated by Django 5.1.2 on 2024-11-30 21:46

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('bandasApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Miembro',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('apellido', models.CharField(max_length=50, null=True)),
                ('instrumento', models.CharField(max_length=50)),
                ('foto', models.FileField(upload_to='miembros')),
                ('banda', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bandasApp.banda')),
            ],
            options={
                'db_table': 'miembro',
            },
        ),
    ]
