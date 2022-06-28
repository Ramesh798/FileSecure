"""FileSecure URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as mainviews
from userapp import views as userviews
from ownerapp import views as ownerviews
from cloudapp import views as cloudviews
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    # main page url's
    path('',mainviews.main_index,name="index"),
    path('about',mainviews.about,name="about"),

    # user page url's
    path('user-register',userviews.user_register,name="user-register"),
    path('user-otp-verify',userviews.otp_verify,name="user-otp-verify"),

    path('user-login',userviews.user_login,name="user-login"),
    path('user-home',userviews.user_home,name="user-home"),
    path('download-requests/<int:id>/',userviews.download_requests,name="download-requests"),

    path('user-view-docs',userviews.user_search_docs,name="user-view-docs"),
    path('user-mydownloads',userviews.user_mydownloads,name="user-mydownloads"),
    path('user-profile',userviews.user_profile,name="user-profile"),
    path('user-response-docs',userviews.user_response_docs,name="user-response-docs"),
    path('user-download-document/<int:id>/',userviews.download_doc,name="user-download-document"),
    path('user-decrypt-document/<int:id>/',userviews.decrypt_document,name="user-decrypt-document"),
    path('user-aboutus',userviews.user_about,name="user-aboutus"),


    # owner page url's
    path('owner-register',ownerviews.owner_register,name="owner-register"),
    path('owner-otp-verify',ownerviews.owner_otp_verify,name="owner-otp-verify"),
    path('owner-encrypt-file',ownerviews.owner_encrypt_file,name="owner-encrypt-file"),
    path('owner-login',ownerviews.owner_login,name="owner-login"),
    path('owner-home',ownerviews.owner_home,name="owner-home"),
    path('upload-docs',ownerviews.owner_upload_docs,name="upload-docs"),
    path('owner-download-requests',ownerviews.owner_download_requests,name="owner-download-requests"),
    path('key-generator/<int:id>/',ownerviews.key_generator,name="key-generator"),
    path('reject-request/<int:id>/',ownerviews.reject_request,name="reject-request"),

    path('top-kdownloads',ownerviews.owner_topk_downloads,name="top-kdownloads"),
    path('owner-profile',ownerviews.owner_profile,name="owner-profile"),
    path('owner-aboutus',ownerviews.owner_about,name="owner-aboutus"),

    #cloud page url's
    path('clod-login',cloudviews.cloud_login,name="cloud-login"),
    path('cloud-index',cloudviews.cloud_index,name="cloud-index"),
    path('data-owner',cloudviews.data_owner,name="data-owner"),
    path('data-user',cloudviews.data_user,name="data-user"),
    path('view-documents',cloudviews.view_documents,name="view-documents"),
    path('accept-document/<int:id>/',cloudviews.accept_document,name="accept-document"),
    path('reject-document/<int:id>/',cloudviews.reject_document,name="reject-document"),

    path('view-downloads',cloudviews.view_downloads,name="view-downloads"),
    path('accept-owner/<int:id>/',cloudviews.accept_status,name="accept-owner"),
    path('reject-owner/<int:id>/',cloudviews.reject_status,name="reject-owner"),

]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

