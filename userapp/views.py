from asyncio.windows_events import NULL
from distutils.command.upload import upload
from xml.dom.minidom import Document
from pyexpat.errors import messages
from django.shortcuts import get_object_or_404, render,redirect
import random
import requests
from django.contrib import messages
from userapp.models import UserModel,DownloadRequestModel,DownloadsModel
from ownerapp.models import UploadDocumentsModel,OwnerModel
from django.db.models import Q,F
from cryptography.fernet import Fernet
import base64
import csv
from FileSecure.settings import DEFAULT_FROM_EMAIL
from django.core.mail import EmailMultiAlternatives
import urllib.request
from django.core.files.storage import FileSystemStorage
from FileSecure import check_internet

# Create your views here.
def user_register(request):
    if request.method =='POST' and request.FILES["profile"]:
        print("post method")
        name = request.POST.get('name')
        mobile = request.POST.get('mobile')
        email = request.POST.get('email')
        profile = request.FILES['profile']
        pwd = request.POST.get('pwd')
        cpwd = request.POST.get('cpwd')

        if UserModel.objects.filter(email=email,status="verified").exists():
            print("email already exists")
            messages.error(request,"already taken")
            return redirect('user-register') 
        
        elif UserModel.objects.filter(email=email,status="pending").exists():
                messages.warning(request,"Already Registered, Just verify your account!")
                if pwd == cpwd:
                    otp=random.randint(2222,4444)
                    UserModel.objects.filter(email=email,status='pending').update(otp=otp)
                    
                    if check_internet.connect():
                        html_content = "<br/> WellCome To Data User, <br/> <p> This Message Sent From FileSecure  You Have Recieved a OTP <strong> " +str(otp)+ " </strong> on FileSecure Cloud Based File Services. </strong> <b> You Can Use online services 24/7 <strong> Thank You For Your Registration.</p>"
                        from_mail = DEFAULT_FROM_EMAIL
                        to_mail = [email]
                        # if send_mail(subject,message,from_mail,to_mail):
                        msg = EmailMultiAlternatives("Account Registration Status", html_content, from_mail, to_mail)
                        msg.attach_alternative(html_content, "text/html")
                        print(email)
                        if msg.send():
                            print("Sent")
                        print('your success')
                        # url = "https://www.fast2sms.com/dev/bulkV2"
                        # # create a dictionary
                        # my_data = {
                        # # Your default Sender ID
                        # 'sender_id': 'FSTSMS',            
                        # # Put your message here!
                        # 'message': 'Welcome to AgroMart, Your OTP Verification Code is '+ str(otp) + ' Thanks for register here.',
                        # 'route': 'p',            
                        # # You can send sms to multiple numbers
                        # # separated by comma.
                        # 'numbers': mobile,   
                        # }
                        # # create a dictionary
                        # headers = {
                        # 'authorization': 'dj4i8WDyNGRfSxCV0Hz7FKtIOA29hPLXTUpE5quwZ6snlrYeoQv7zVYsdDJrbQAS5PW0IujioMXO3xUC',
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
                    return redirect('user-otp-verify')
                else:
                    messages.warning(request,"invalid password")
                    return redirect('user-register') 

        else:
            otp = random.randint(1111,9999)
            print(otp)

            # url = "https://www.fast2sms.com/dev/bulkV2"
            # # create a dictionary
            # my_data = {
            #     # Your default Sender ID
            #     'sender_id': 'FSTSMS',            
            #     # Put your message here!
            #     'message': 'Welcome to AgroMart, Your OTP Verification Code is '+ str(otp) + ' Thanks for register here.',
            #     'route': 'p',            
            #     # You can send sms to multiple numbers
            #     # separated by comma.
            #     'numbers': mobile,   
            # }
            # # create a dictionary
            # headers = {
            #     'authorization': 'dj4i8WDyNGRfSxCV0Hz7FKtIOA29hPLXTUpE5quwZ6snlrYeoQv7zVYsdDJrbQAS5PW0IujioMXO3xUC',
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
                customer_register = UserModel.objects.create(name=name,email=email,mobile=mobile,pwd=pwd,cpwd=cpwd,otp=otp,profile=profile)
                user_data = customer_register.user_id
                request.session['use'] = user_data
                print(user_data)
                
                if check_internet.connect():
                    html_content = "<br/> WellCome To Data User, <br/> <p> This Message Sent From FileSecure  You Have Recieved a OTP <strong> " +str(otp)+ " </strong> on FileSecure Cloud Based File Services. </strong> <b> You Can Use online services 24/7 <strong> Thank You For Your Registration.</p>"
                    from_mail = DEFAULT_FROM_EMAIL
                    to_mail = [customer_register.email]
                    # if send_mail(subject,message,from_mail,to_mail):
                    msg = EmailMultiAlternatives("Account Registered Status", html_content, from_mail, to_mail)
                    msg.attach_alternative(html_content, "text/html")
                    print(email)
                    if msg.send():
                        print("Sent")
                    print('your success')
                    # messages.info(request,"successfully registered")
                    return redirect('user-otp-verify')

            else:
                messages.warning(request,"invalid password")
                return redirect('user-register')
    return render(request,'user/user-register.html')

def otp_verify(request):
    user_id = request.session['use']
    print("user_id",user_id)
    data = UserModel.objects.get(user_id=user_id)

    if request.method == 'POST':
        otp = request.POST.get('otp')
        print(otp)
        try:
            check = UserModel.objects.get(otp=otp)
            print(check)
            u_id = request.session["user_id"]=check.user_id
            otp = check.otp
            if otp == otp:
                print("c")
                UserModel.objects.filter(user_id=u_id).update(status="verified")
                print("record")
                messages.info(request,"otp-verify")
                return redirect('user-login')
            else:
                print("d")
                messages.error(request,"wrong-otp")
                return redirect('user-otp-verify')
                
        except:
            pass
    return render(request,'user/user-otp-verify.html',{'d':data})

def user_login(request):
    if request.method == 'POST':
        email = request.POST.get('email')   
        pwd = request.POST.get('pwd')
        try:
            check = UserModel.objects.get(email=email,pwd=pwd)
            print("check")
            request.session["user_id"]=check.user_id
            status = check.status
            if status == "verified":
                messages.info(request,"log in successfull!")
                print("message....")
                return redirect('user-home')
            else:
                messages.error(request,"something went wrong!")
                return redirect('user-login')

        except:
            print('invalid.......')
            messages.error(request,"Invalid Credentials")
            return redirect("user-login")        
  
    return render(request,'user/user-login.html')

    
def user_home(request):
    
    document = UploadDocumentsModel.objects.filter(status="Accepted")
    if request.method == "POST" and 'btn1' in request.POST or 'btn2' in request.POST:
        search = request.POST.get("search")
        document = UploadDocumentsModel.objects.filter(Q(doc_name__icontains=search)|Q(doc_type__icontains=search)|Q(random_keys__icontains=search),status='Accepted')
    else:
        pass
    return render(request,'user/user-home.html',{'docs':document})

def user_search_docs(request):
    documents = UploadDocumentsModel.objects.filter(status="Accepted").all()
    if request.method == "POST" and 'searchbtn' in request.POST or 'btn2' in request.POST :
        search = request.POST.get("search")
        documents = UploadDocumentsModel.objects.filter(Q(doc_name__icontains=search)|Q(doc_type__icontains=search)|Q(random_keys__icontains=search),status="Accepted")
    return render(request,'user/user-view-docs.html',{'docs':documents})

def user_mydownloads(request):
    user_id = request.session["user_id"]
    downloads = DownloadsModel.objects.filter(user_id=user_id)
    document = DownloadRequestModel.objects.all()
    return render(request,'user/user-my-downloads.html',{'down':downloads,'docs':document})

def download_requests(request,id):
    user_id=request.session["user_id"]
    docdetails = UploadDocumentsModel.objects.get(doc_id= id)
    if not DownloadRequestModel.objects.filter(user_id=user_id).filter(doc_id=id):
        
        owner_id=docdetails.owner_id
        doc_id=docdetails.doc_id 
        doc_name = docdetails.doc_name
        document=docdetails.document
        doc_size = docdetails.doc_size
        doc_type=docdetails.doc_type
        description=docdetails.description
        file_enc_key = docdetails.file_enc_key
        status = "requested"
        # file_uploaded_date=docdetails.file_uploaded_date
        DownloadRequestModel.objects.create(doc_name=doc_name,document=document,doc_size=doc_size,user_id=user_id,owner_id=owner_id,description=description,doc_type=doc_type,doc_id=doc_id,request_status=status,file_enc_key=file_enc_key)
        print('ddddddddddddddddddddd') 
        return redirect('user-view-docs')
    else:
        messages.warning(request,"already your requested")
        return redirect('user-view-docs')
    
def user_profile(request):

    user_id = request.session["user_id"]
    profile = UserModel.objects.get(user_id=user_id)
    # owner_data = OwnerModel.objects.filter(owner_id=owner).exclude(status="paid").exclude(status='Delivered').count()
    
    obj = get_object_or_404(UserModel,user_id=user_id)
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
        return redirect("user-profile")

    return render(request,'user/user-profile.html',{'profile':profile})

def user_response_docs(request):
    user_id = request.session["user_id"]
    # search = request.POST.get("search")
   
    documents = DownloadRequestModel.objects.filter( user_id=user_id,request_status="request_accepted").all()

    # documents = DownloadRequestModel.objects.filter(Q(doc_name__icontains=search)|Q(doc_type__icontains=search)|Q(request_status__icontains=search),request_status="request_accepted")
    
        
    return render(request,'user/user-response-docs.html',{'docs':documents})

def download_doc(request,id):
    user = request.session['user_id']
    user1 = UserModel.objects.get(user_id=user)
    print(user1.email)
    data = DownloadRequestModel.objects.get(request_id=id)
    b = data.doc_id
    req_id = data.request_id
    print("document id:.... ",b)
    user2 = UploadDocumentsModel.objects.get(doc_id=b)
    enc_file_path = user2.enc_doc_name
    print("enc_file_path------:",enc_file_path)
    id1 = user1.user_id
    file_download = user2.enc_doc_name
    print(file_download)
    doc_name = data.doc_name
    download_rank = NULL
    if request.method == "POST" and 'download' in request.POST :
        print("request method........")
        downloads = DownloadsModel.objects.create(doc_id=b,user_id=id1,req_id=req_id)
        download_rank = UploadDocumentsModel.objects.filter(doc_id=b).update(download_rank=F('download_rank')+1)
        downloads.status = "downloaded"
        downloads.save(update_fields = ["status"])
        data.download_status = "Downloaded"
        print("status update")
        DownloadRequestModel.objects.filter(doc_id=id,download_status="decrypted").update(download_status="Downloaded")
        
        html_content = "<br/> WellCome To Data Owner, <br/> <p> This Message Sent From FileSecure  You Have Downloaded <strong> " +str(doc_name)+ " </strong> on FileSecure Cloud Based File Services. </strong> <b> You Can Use online services 24/7 <strong> Thank You For Your Registration.</p>"
        from_mail = DEFAULT_FROM_EMAIL
        to_mail = [user1.email]
        # if send_mail(subject,message,from_mail,to_mail):
        msg = EmailMultiAlternatives("Document Downloaded From FIleSecure", html_content, from_mail, to_mail)
        msg.attach_alternative(html_content, "text/html")
        print(user1.email)
        # if msg.send():
        #     print("Sent")
        # print('your success')
        # fs = FileSystemStorage()
        # filename = fs.save(enc_file_path, str(enc_file_path))

        # uploaded_file_path = fs.path(filename)
        # fs.delete(uploaded_file_path)
        print("deleted..")
        return redirect("user-view-docs")
        

    return render(request,'user/user-doc-download.html',{"u":data,'i':user2})

def decrypt_document(request,id):
    user_id = request.session["user_id"]
    print("decrypt function.....")
    request.session["doc_id"]=id
    # s = DownloadRequestModel.objects.filter(doc_id=id,user_id=user_id)
    s = get_object_or_404(DownloadRequestModel,request_id=id)
    s_key =s.secure_key
    req_id = s.request_id
    do_id = s.doc_id
    print(do_id)
    key=get_object_or_404(UploadDocumentsModel,doc_id=do_id)
    data1 = key.file_data
    doc_name = str(key.doc_name)
    # b = doc_name.replace(' ','_')
    a = doc_name.index(".")
    print(a)
    b = len(doc_name)
    print(b)
    x=  doc_name[a:b]
    print(x)
    path3 = doc_name[0:a] + str(req_id) + str(x)
    print(path3)
    
    path = 'media/files/'+ doc_name
    path2 = 'media/files/'+ path3
    print(path)
    file_key = key.file_enc_key

    if request.method == "POST":
        secure_key = request.POST.get("secure_key")
        print("ggggggggggggggggggggggggggggggggggg")
        print(file_key,type(file_key))
        if secure_key == s_key:
            f= Fernet(file_key)
            print("eeeeeeeeeee")
            # enc_data = bytes(data1,'UTF-8')
            # # print(enc_data)
            # file = open(data1,'rb')
            # data = file.read()
            code = bytes(data1, 'utf-8')
            print(code)
            print(type(code),"sss")
            dec_data = f.decrypt(code)
            decrept_data = dec_data.decode()
            messages.info(request,'')
            print(decrept_data)
            with open(path2,'wb') as f:
                f.write(dec_data)
        
            # s.download_status = "decrypted"
            # # return redirect('user-download-document') 
            # s.save(update_fields=['download_status'])

            key.enc_doc_name = path3
            key.save(update_fields=['enc_doc_name'])

            messages.info(request,"document decrypted ")

            return redirect('user-download-document', id=id) 
        else:
            return redirect('user-response-docs') 
    return redirect('user-response-docs') 
        


def download_document(request,id):

    
    return redirect('user-response-docs')



def user_about(request):
    return render(request,'user/user-about.html')