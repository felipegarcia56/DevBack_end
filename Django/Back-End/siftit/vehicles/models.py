# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from users.models import UsersLi

class Trademark(models.Model):
    #id = models.BigAutoField(primary_key=True)
    description = models.TextField()

    class Meta:
        managed = False
        db_table = 'trademark'


class TypeBodywork(models.Model):
    #id = models.BigAutoField(primary_key=True)
    description = models.TextField()

    class Meta:
        managed = False
        db_table = 'type_bodywork'


class TypeVehicle(models.Model):
    #id = models.BigAutoField(primary_key=True)
    description = models.TextField()

    class Meta:
        managed = False
        db_table = 'type_vehicle'



class VehicleLi(models.Model):

    plate = models.CharField(max_length=6)
    type_vehicle = models.ForeignKey(TypeVehicle, models.DO_NOTHING, db_column='type_vehicle')
    type_bodywork = models.ForeignKey(TypeBodywork, models.DO_NOTHING, db_column='type_bodywork')
    trademark = models.ForeignKey(Trademark, models.DO_NOTHING, db_column='trademark')
    id_user = models.ForeignKey(UsersLi, models.DO_NOTHING, db_column='id_user')

    class Meta:
        managed = False
        db_table = 'vehicle_li'