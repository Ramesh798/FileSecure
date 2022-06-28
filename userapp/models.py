from django.db import models

from ownerapp.models import OwnerModel, UploadDocumentsModel

# Create your models here.

class UserModel(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.TextField(max_length=200,default=True)
    mobile = models.BigIntegerField(default=True)
    email = models.EmailField(default=True)
    profile = models.ImageField(upload_to='user/',null=True)
    pwd = models.CharField(max_length=20,null=True)
    cpwd = models.CharField(max_length=20,null=True)
    reg_date = models.DateField(auto_now_add=True)
    otp = models.TextField(null=True)
    status = models.CharField(default="pending",max_length=20)

    class Meta:
        db_table = 'user_details'


class DownloadRequestModel(models.Model):
    request_id=models.AutoField(primary_key=True)
    owner_id=models.IntegerField(null=True)
    user_id=models.IntegerField(null=True)
    doc_id=models.IntegerField(null=True)
    document=models.FileField(upload_to='files/')
    doc_name=models.CharField(max_length=200)
    description=models.CharField(max_length=250, null=True)
    doc_size=models.BigIntegerField(null=True)
    doc_type=models.CharField(max_length=300)
    # search_rank = models.CharField(default="0",null=True, max_length=200)
    # download_rank = models.CharField(default="0",null=True, max_length=250)
    # otp=models.IntegerField(null=True)
    file_enc_key = models.TextField(null=True)
    secure_key = models.CharField(max_length=100,null=True)
    request_status=models.CharField(max_length=50,default='pending',null="True")
    download_status = models.CharField(max_length=200,default='pending',null=True)
    requested_date=models.DateField(auto_now_add=True, null=True)


    class Meta:
        db_table = "user_download_requests"

class DownloadsModel(models.Model):
    download_id = models.AutoField(primary_key=True)
    user_id = models.IntegerField(null=True)
    doc_id = models.IntegerField(null=True)
    req_id = models.IntegerField(null=True)
    status = models.CharField(default="pending",null=True,max_length=200)
    # download_rank = models.IntegerField(null=True)
    downloaded_date=models.DateField(auto_now_add=True, null=True)

    class Meta:
        db_table = "document_downloads"
    

