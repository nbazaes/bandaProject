# Generated by Django 5.1.2 on 2024-11-30 21:46

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Genero',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20)),
            ],
            options={
                'db_table': 'genero',
            },
        ),
        migrations.CreateModel(
            name='Banda',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('fecha_formacion', models.DateField()),
                ('fecha_separacion', models.DateField(null=True)),
                ('biografia', models.TextField(max_length=300)),
                ('genero', models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='bandasApp.genero')),
            ],
            options={
                'db_table': 'banda',
            },
        ),
    ]
