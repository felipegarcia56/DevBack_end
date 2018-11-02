from django.db import models


class TypeUser(models.Model):
    description = models.TextField()

    class Meta:
        managed = False
        db_table = 'type_user'


class UsersLi(models.Model):
    id = models.BigAutoField(primary_key=True)
    last_name = models.TextField()
    full_name = models.TextField()
    identification = models.TextField()
    ident_file = models.BinaryField(blank=True, null=True)
    type_user = models.ForeignKey(TypeUser, models.DO_NOTHING, db_column='type_user')

    class Meta:
        managed = False
        db_table = 'users_li'
