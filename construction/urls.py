"""construction URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
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
from . import views
from django.conf.urls import url
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.construction),
    path('index',views.index),
    path('adduser',views.adduser),
    path('adduse',views.adduse),
    path('login/',views.login),
    path('login/addlog',views.addlog),
    path('logout/',views.logout),
    path('viewuser',views.viewuser),
    path('edit/<int:id>',views.edit),
    path('edit/addedit/<int:id>',views.addedit),
    path('delete/<int:id>',views.delete),
    path('viewprofile',views.viewprofile),
    path('change/<int:id>',views.change),
    path('change/addchanges/<int:id>',views.addchanges),
    path('addsubcontractor',views.addsubcontractor),
    path('viewsubcontractor',views.viewsubcontractor),
    path('edit_c/<int:id>',views.edit_c),
    path('delete_c/<int:id>',views.delete_c),
    path('delete_p/<int:id>',views.delete_p),
    path('edit_c/addedit_c/<int:id>',views.addedit_c),
    path('viewsubcontprofile',views.viewsubcontprofile),
    path('change_c/<int:id>',views.change_c),
    path('change_c/addchanges_c/<int:id>',views.addchanges_c),
    path('addproject',views.addproject),
    path('viewproject',views.viewproject),

    path('assign_sub/<int:id>',views.assign_sub),
    path('assign_sub/add_assign_sub',views.add_assign_sub),
    path('viewproject_sub',views.viewproject_sub),
    path('viewproject_wrkr',views.viewproject_wrkr),

    path('assign_workers/<int:id>',views.assign_workers),
    path('assign_workers/add_assign_workers',views.add_assign_workers),


    path('add_expenses/<int:id>',views.add_expenses),
    path('add_expenses/addproject_expense',views.addproject_expense),
    path('view_exp_admin/<int:id>',views.view_exp_admin),
    path('view_exp_admin/invoice_view/<int:id>',views.invoice_view),

    path('add_doc/<int:id>',views.add_doc),
    path('add_doc/add_doc_ins',views.add_doc_ins),
    path('view_doc/<int:id>',views.view_doc),
    path('add_wage/<int:id>',views.add_wage),
    path('add_wage/add_wage_ins/<int:id>',views.add_wage_ins),
    path('view_wagewrkr',views.view_wagewrkr),






]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
