from pyexpat.errors import messages
from django.shortcuts import render,redirect,get_object_or_404

from ownerapp.models import OwnerModel,UploadDocumentsModel
from userapp.models import DownloadsModel, UserModel,DownloadRequestModel
import datetime
from django.contrib import messages


# Create your views here.
def cloud_login(request):
    if request.method == "POST":
        name= request.POST.get("name")
        pwd = request.POST.get("pwd")
        if name =='cloud' and pwd =='cloud':
            messages.info(request,"login success")
            return redirect('cloud-index')
        else:
            messages.warning(request,"wrong details")
    return render(request,'cloud/cloud-login.html')

def cloud_index(request):
    # current time and date
    # datetime object
    date = datetime.date.today()
    print(date)  
    # formating date using strftime
    # print("After formating:", time.strftime("%b %d, %Y"))
    users_count = UserModel.objects.all().count()
    owners_count = OwnerModel.objects.filter(status="accepted").count()
    doc_count = UploadDocumentsModel.objects.filter(status="Accepted").count()
    doc_req_count = UploadDocumentsModel.objects.filter(status="pending").count()
    total_downloads  = DownloadsModel.objects.all().count()
    m_downloads = DownloadsModel.objects.filter(downloaded_date=date).count()
    down_req_count = DownloadRequestModel.objects.filter(download_status='pending').count()
    return render(request,'cloud/index.html',{
        'u_count':users_count,
        'o_count':owners_count,
        'd_count':doc_count,
        'd_r_count':down_req_count,
        'doc_req_count':doc_req_count,
        'tot_doc_count':total_downloads,
        'month_downloads':m_downloads,
    })

def data_owner(request):
    owner = OwnerModel.objects.all()
    return render(request,'cloud/cloud-data-owner.html',{'owner':owner})

def accept_status(request,id):
    accept = get_object_or_404(OwnerModel,owner_id =id)
    accept.status = "Accepted"
    accept.save(update_fields=['status'])
    accept.save()
    return redirect("data-owner")

def reject_status(request,id):
    accept = get_object_or_404(OwnerModel,owner_id =id)
    accept.status = "Rejected"
    accept.save(update_fields=['status'])
    accept.save()
    return redirect("data-owner")

def data_user(request):
    user = UserModel.objects.all()
    return render(request,'cloud/cloud-data-user.html',{'user':user})

def view_documents(request):
    docs = UploadDocumentsModel.objects.all()
    return render(request,'cloud/cloud-view-documents.html',{'docs':docs})

def accept_document(request,id):
    accept = get_object_or_404(UploadDocumentsModel,doc_id =id)
    accept.status = "Accepted"
    accept.save(update_fields=['status'])
    accept.save()
    return redirect("view-documents")

def reject_document(request,id):
    accept = get_object_or_404(UploadDocumentsModel,doc_id =id)
    accept.status = "Rejected"
    accept.save(update_fields=['status'])
    accept.save()
    return redirect("view-documents")

def view_downloads(request):
    downloads = DownloadsModel.objects.all()
    user = UserModel.objects.all()
    owner = UploadDocumentsModel.objects.all()
    return render(request,'cloud/cloud-view-downloads.html',{'d':downloads,'owner':owner,'u':user})
    