# from asyncore import file_wrapper
import imp
from operator import indexOf
import os
from tabnanny import filename_only
from xml.dom.minidom import Document
from django.conf import settings
from django.shortcuts import render,redirect,get_object_or_404
from ownerapp.models import *
from userapp.models import *
from django.contrib import messages
import random
import requests
import string
import random
from userapp import practice as p
from cryptography.fernet import Fernet
import pathlib
from django.db.models import Q
from FileSecure.settings import DEFAULT_FROM_EMAIL
from django.core.mail import EmailMultiAlternatives
from FileSecure import check_internet
from FileSecure.check_internet import *
from django.core.files.storage import FileSystemStorage
# Create your views here.
def owner_register(request):
    if request.method =='POST' and request.FILES["profile"]:
        print("post method")
        name = request.POST.get('name')
        mobile = request.POST.get('mobile')
        email = request.POST.get('email')
        profile = request.FILES['profile']
        pwd = request.POST.get('pwd')
        cpwd = request.POST.get('cpwd')

        if OwnerModel.objects.filter(email=email).filter(verification="verified").exists():
            print("email already exists")
            messages.error(request,"already taken")
            return redirect('owner-register') 
        
        elif OwnerModel.objects.filter(email=email).filter(verification = "pending").exists():
                # messages.error(request,"Already Registered, Just verify your account!")
                if pwd == cpwd:

                    otp=random.randint(2222,4444)
                    OwnerModel.objects.filter(email=email,status='pending').update(otp=otp)
                    # url = "https://www.freebulksmsonline.com/api/v1/index.php"
                    # # create a dictionary
                    # my_data = {
                    # # Your default Sender ID
                    # 'sender_id': '1,2,3',            
                    # # Put your message here!
                    # 'message': 'Dear '+ str(name) +' Welcome to FileSecure, Your OTP Verification Code is '+ str(otp) + ' Do not share with anyone.',
                    # 'route': 'p',            
                    # # You can send sms to multiple numbers
                    # # separated by comma.
                    # 'numbers': mobile,   
                    # }
                    # # create a dictionary
                    # headers = {
                    # 'authorization': 'db5f2c868ef89125b1b5f0adbae5d7bb',
                    # 'Content-Type': "application/x-www-form-urlencoded",
                    # 'Cache-Control': "no-cache"
                    # }
                    # # make a post request
                    # response = requests.request("POST",
                    #                         url,
                    #                         data = my_data,
                    #                         headers = headers)
                    # # print the send message
                    # print(response.text)
                    if connect():
                        html_content = "<br/> WellCome To Data Owner, <br/> <p> This Message Sent From FileSecure  You Have Recieved a OTP <strong> " +str(otp)+ " </strong> on FileSecure Cloud Based File Services. </strong> <b> You Can Use online services 24/7 <strong> Thank You For Your Registration.</p>"
                        from_mail = DEFAULT_FROM_EMAIL
                        to_mail = [email]
                        # if send_mail(subject,message,from_mail,to_mail):
                        msg = EmailMultiAlternatives("Account Registration Status", html_content, from_mail, to_mail)
                        msg.attach_alternative(html_content, "text/html")
                        print(email,"email ")
                        return redirect('owner-otp-verify') 
                else:
                    messages.warning(request,"password does't match")
                    return redirect('owner-register')


        else:
            otp = random.randint(1111,9999)
            print(otp)
            # url = "https://www.freebulksmsonline.com/api/v1/index.php"

            # # create a dictionary
            # my_data = {
            #     # Your default Sender ID
            #     'sender_id': 'SBSMS',            
            #     # Put your message here!
            #     'message': 'Dear '+ str(name) +', Welcome to FileSecure, Your OTP Verification Code is '+ str(otp) + ' Please Do not share with anyone.',
            #     'route': 'p',            
            #     # You can send sms to multiple numbers
            #     # separated by comma.
            #     'numbers': mobile,   
            # }
            # # create a dictionary
            # headers = {
            #     'authorization': 'db5f2c868ef89125d1b5f0adbae5d7bb',
            #     'Content-Type': "application/x-www-form-urlencoded",
            #     'Cache-Control': "no-cache"
            # }
            # # make a post request
            # response = requests.request("POST",
            #                             url,
            #                             data = my_data,
            #                             headers = headers)
            # # print the send message
            # print(response.text) 
            if pwd == cpwd:
                # owner_register = OwnerModel.objects.create(name=name,email=email,mobile=mobile,pwd=pwd,cpwd=cpwd,otp=otp,profile=profile)
                # owner_register.save()
                # otp_data = owner_register.owner_id
                # request.session['demo'] = otp_data
                # print(otp_data)

                if connect():
                    html_content = "<br/> WellCome To Data Owner, <br/> <p> This Message Sent From FileSecure  You Have Recieved a OTP <strong> " +str(otp)+ " </strong> on FileSecure Cloud Based File Services. </strong> <b> You Can Use online services 24/7 <strong> Thank You For Your Registration.</p>"
                    from_mail = DEFAULT_FROM_EMAIL
                    to_mail = [owner_register.email]
                    # if send_mail(subject,message,from_mail,to_mail):
                    msg = EmailMultiAlternatives("Account Registered Status", html_content, from_mail, to_mail)
                    msg.attach_alternative(html_content, "text/html")
                    print(email)
                    if msg.send():
                        print("Sent")
                    print('your success')
                return redirect('owner-otp-verify') 
            else:
                messages.warning(request,"password does't match")
                return redirect('owner-register')

            # messages.info(request,"successfully registered")
   
    return render(request,'owner/owner-register.html')

def owner_otp_verify(request):
   
    owner_id = request.session['demo']
    print("owner_id",owner_id)
    data = OwnerModel.objects.get(owner_id=owner_id)

    if request.method == 'POST':
        otp = request.POST.get('otp')
        print(otp)
        try:
            check = OwnerModel.objects.get(otp=otp)
            print(check)
            o_id = request.session["owner_id"]=check.owner_id
            otp = check.otp
            if otp == otp:
                print("c")
                OwnerModel.objects.filter(owner_id=o_id).update(verification="verified")
                print("record")
                messages.info(request,"otp-verify")
                return redirect('owner-login')
            else:
                print("d")
                messages.error(request,"wrong-otp")
                return redirect('owner-otp-verify')
                
        except:
            pass
    return render(request,'owner/owner-otp-verify.html',{'d':data})

def owner_login(request):
    if request.method == 'POST':
        email = request.POST.get('email')   
        pwd = request.POST.get('pwd')
        
        try:
            check = OwnerModel.objects.get(email=email,pwd=pwd)
            print("check")
            id = request.session["owner_id"]=check.owner_id
            status = check.status
            if status == "Accepted" and check.verification == "verified" :
                messages.info(request,"log in successfull!")
                print("message....")
                return redirect('owner-home')
            elif status == "Rejected" or status=="pending":
                messages.warning(request,"admin not accepted")

            else:
                messages.error(request,"something went wrong!")
                return redirect('owner-login')

        except:
            print('invalid.......')
            messages.error(request,"Invalid Credentials")
            return redirect("owner-login")        
  
    return render(request,'owner/owner-login.html')

def owner_home(request):
    owner_id = request.session["owner_id"]

    document = UploadDocumentsModel.objects.filter(owner_id=owner_id,status="Accepted")
    if request.method == "POST" and 'btn1' in request.POST or 'btn2' in request.POST:
        search = request.POST.get("search")
        document = UploadDocumentsModel.objects.filter(owner_id=owner_id,status="Accepted").filter(Q(doc_name__icontains=search)|Q(doc_type__icontains=search)|Q(random_keys__icontains=search))

    return render(request,'owner/owner-home.html',{'docs':document})

def owner_upload_docs(request):
    owner_id = request.session['owner_id']
    supported_files = "html,java,py,txt,css,js"
    # print("support",supported_files)
    if request.method =='POST' and request.FILES['file']:
        print("post method")
        # key = str(Fernet.generate_key(), 'utf-8') 
        # crypter = Fernet(key)
        # document = request.FILES['file'].encode()
        # latt = str(crypter.encrypt(document), 'utf-8')
        
        document=request.FILES['file']
        description = request.POST.get('description')
        doc_name = document.name
        doc_type = document.content_type
        file_extension = doc_name
        fs = FileSystemStorage()
        name = fs.save('files/' + doc_name,document)
        print("111111")
        print(name)
        a = file_extension.index(".")
        b = len(file_extension)
        x =  file_extension[a+1:b]
        print(x)
        
        if x in supported_files:
            print("File is supporteddd")
            
            doc_size = document.size
            
            owner = OwnerModel.objects.get(owner_id = owner_id)
            files = UploadDocumentsModel.objects.create(doc_name=doc_name,doc_size=doc_size,doc_type=doc_type,description=description,document=name,owner=owner)
            files.save()
            messages.info(request,"document uploaded")
            doc_id = request.session["doc_id"] = files.doc_id
            print(doc_id)
            return redirect('owner-encrypt-file')
            
        else:
            messages.error(request,"The " + x + " file format is not supported by the cloud")
            return redirect("upload-docs")
    return render(request,'owner/owner-upload-docs.html')

def owner_encrypt_file(request):        
    owner_id = request.session['owner_id']
    data = ''
    document = request.session["doc_id"]
    file = UploadDocumentsModel.objects.get(doc_id=document)
    filename = str(file.doc_name)
    # f = filename.replace(' ','_')
    path = 'media/files/' + filename
    if request.method=="GET":        
        print(path)
        try:
            f = open(path,'r')
            print('f')
            data = f.read()
            f.close()
            print(data)
        except Exception as e:
            print(e)

    elif request.method=="POST" and 'encrypt' in request.POST:
        print("keywords")
        data1 = request.POST.get("description")
        keywords = request.POST.get('keywords')
        print(keywords)
        # #File Encryption
        

        # file_enc_key = Fernet.generate_key()
        # print(file_enc_key,"keykeykey")
        # print("aaaa")
        # print(file_enc_key,"dddd")
        # print("aaaa")
        # data_encode = data1.encode()
        # fernet = Fernet(file_enc_key)
        # enc_data_1 = fernet.encrypt(data_encode).decode()
        # print(enc_data_1)

        # #File Encryption
        file_enc_key = Fernet.generate_key()
        #Read File         
        print(path)
        file = open(path,'rb')
        data = file.read()
        print(data)

        fernet = Fernet(file_enc_key)
        data = fernet.encrypt(data)
        print(data)

        UploadDocumentsModel.objects.filter(owner_id=owner_id,doc_name=filename).update(file_enc_key=file_enc_key.decode(),file_data=data.decode(),random_keys=keywords)
        
        with open(path,'wb') as f:
            f.write(data)

        messages.warning(request,"encrypted file uploaded")
        return redirect("owner-home")
        
       
    return render(request,"owner/owner-encrypt-file.html",{'file': data,'filename': filename})

def owner_download_requests(request):
    owner_id = request.session["owner_id"]
    # docs = UploadDocumentsModel.objects.filter(status="Accepted")
    user_data = UserModel.objects.all()
    document = DownloadRequestModel.objects.filter(owner_id=owner_id).all()
    if request.method == "POST" and 'btn1' in request.POST:
        search = request.POST.get("search")
        document = DownloadRequestModel.objects.filter(Q(doc_name__icontains=search)|Q(doc_type__icontains=search))

    return render(request,'owner/owner-download-requests.html',{'req':document,'user':user_data})

# key or captcha generator, we can mention any size in size argument
def generate_key(size=10, chars=string.ascii_uppercase + string.ascii_lowercase + string.digits + '!@#$%^&*()_+?~'):
    return ''.join(random.choice(chars) for _ in range(size))

def key_generator(request,id):
    key = generate_key()
    print(key)
    accept = get_object_or_404(DownloadRequestModel,request_id =id)
    accept.request_status = "request_accepted"
    accept.secure_key=key
    accept.save(update_fields=['request_status','secure_key'])
    accept.save()
    # DownloadRequestModel.objects.filter(request_id=id).update(secure_key=key,request_status="accepted")
    return redirect('owner-download-requests')
def reject_request(request,id):
    reject = get_object_or_404(DownloadRequestModel,request_id =id)
    reject.request_status = "Rejected"
    reject.save(update_fields=['request_status'])
    reject.save()
    return redirect('owner-download-requests')
def owner_topk_downloads(request):
    owner_id = request.session["owner_id"]
    # owner = UploadDocumentsModel.objects.get(owner_id = owner_id)
    # doc_id = owner.doc_id
    Document = UploadDocumentsModel.objects.filter(owner_id=owner_id).order_by("-download_rank")
    
    # downloads = DownloadsModel.objects.all()
    # request_id = downloads.req_id
    # downloads = DownloadsModel.objects.filter(Q(doc_name__icontains=search)|Q(doc_type__icontains=search))
    # user = UserModel.objects.all()
    # ddd = DownloadRequestModel.objects.filter(owner_id = owner_id)
    return render(request,'owner/owner-topk-downloads.html',{'downloads':Document,})

def owner_profile(request):
    owner = request.session["owner_id"]
    data = OwnerModel.objects.get(owner_id=owner)
    # owner_data = OwnerModel.objects.filter(owner_id=owner).exclude(status="paid").exclude(status='Delivered').count()
    
    obj = get_object_or_404(OwnerModel,owner_id=owner)
    if request.method == "POST" and request.FILES["profile"]:
        name = request.POST.get('username')
        mobile = request.POST.get('phone')
        email = request.POST.get('email')
        # address = request.POST.get('address')
        profile = request.FILES['profile']
        # pincode = request.POST.get('pincode')

        obj.name = name
        obj.mobile = mobile
        obj.profile = profile
        obj.email = email

        
        obj.save(update_fields=['name','profile','mobile','email'])
        obj.save()
        messages.info(request,"profile Updated successfully..")

        if obj.save():
            messages.info(request,"profile Updated successfully..")
        else:
            messages.error(request,"something went wrong!")
        return redirect("owner-profile")
    return render(request,'owner/owner-profile.html',{'owner':data})

def owner_about(request):
    return render(request,'owner/owner-about.html')