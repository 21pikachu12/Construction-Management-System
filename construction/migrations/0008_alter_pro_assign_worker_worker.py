# Generated by Django 3.2.7 on 2024-03-05 16:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('construction', '0007_auto_20240305_1755'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pro_assign_worker',
            name='worker',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='construction.workertable'),
        ),
    ]
