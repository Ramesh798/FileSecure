from pyexpat import model
from django.db import models

# Create your models here.
class OwnerModel(models.Model):
    owner_id = models.AutoField(primary_key=True)
    name = models.TextField(max_length=200,default=True)
    mobile = models.BigIntegerField(default=True)
    email = models.EmailField(default=True)
    profile = models.ImageField(upload_to='owner/',null=True)
    pwd = models.CharField(max_length=20,null=True)
    cpwd = models.CharField(max_length=20,null=True)
    reg_date = models.DateField(auto_now_add=True)
    otp = models.TextField(null=True)
    status = models.CharField(default="pending",max_length=20)
    verification = models.CharField(default="pending",max_length=20)


    class Meta:
        db_table = 'owner_details'

class UploadDocumentsModel(models.Model):
    doc_id = models.AutoField(primary_key=True)
    owner = models.ForeignKey(OwnerModel,on_delete=models.CASCADE,null=True)
    document = models.ImageField(upload_to='files/',null=True)
    doc_type = models.TextField(null=True)
    doc_size = models.BigIntegerField(null=True)
    description = models.TextField(null=True)
    doc_name = models.TextField(null=True)
    enc_doc_name = models.TextField(null=True)
    random_keys = models.TextField(null=True)
    file_enc_key = models.TextField(null=True)
    file_data = models.TextField(null=True)
    download_rank = models.IntegerField(null=True)

    upload_date = models.DateField(auto_now_add=True)
    status = models.TextField(default="pending")

    class Meta:
        db_table='upload_documents'


