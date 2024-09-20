from django.http import HttpResponse,HttpResponseRedirect
from django.shortcuts import render
from django.shortcuts import redirect,get_object_or_404
from django.urls import reverse
from  django.core.files.storage import FileSystemStorage
from urllib.parse import urlencode
from .models import *
from django.db.models import Q
import pandas as pd


def construction(request):
    return render(request,'index.html')

def index(request):
    return render(request,'index.html')

def adduser(request):
    return render(request,'adduser.html')

def adduse(request):
    if request.method=="POST":
        name=request.POST.get('name')  
        email=request.POST.get('email') 
        number=request.POST.get('number') 
        password=request.POST.get('password')
        address=request.POST.get('address')
        if workertable.objects.filter(email=email).exists() | subconttable.objects.filter(email=email).exists():
            return render(request,'adduser.html',{'result':'Email Already Exist'})
        ins=workertable(email=email,password=password,number=number,name=name,address=address,status='Available')
        ins.save()
    return render(request,'adduser.html')

def login(request):
    return render(request,'login.html')

def addlog(request):
    email=request.POST.get('email')
    password=request.POST.get('password')
    if email=='contractor@gmail.com' and password=='123':
        request.session['contractor@gmail.com']='contractor@gmail.com'
        request.session['contractor']='contractor'
        return render(request,'index.html')

    elif subconttable.objects.filter(email=email,password=password).exists():
        detail=subconttable.objects.get(email=email,password=password)
        if detail.password==request.POST['password']:
            request.session['cid']=detail.id
            request.session['usertype']='SUB-CONTRACTOR'
            return render(request,'index.html')
            

    elif workertable.objects.filter(email=email,password=password).exists():
        detail=workertable.objects.get(email=email,password=password)
        if detail.password==request.POST['password']:
            request.session['uid']=detail.id
            request.session['usertype']='USER'

            return render(request,'index.html')

    else:
        return render(request,'index.html')

def logout(request):
    session_keys=list(request.session.keys())
    for key in session_keys:
        del request.session[key]
    return redirect(index)  

def viewuser(request):
    x=workertable.objects.all()
    return render(request,'viewuser.html',{'result':x})

def edit(request,id):
    x=workertable.objects.get(id=id)
    return render(request,'edit.html',{'result':x})

def addedit(request,id):
    if request.method=="POST":
        name=request.POST.get('name')  
        email=request.POST.get('email') 
        number=request.POST.get('number') 
        password=request.POST.get('password')
        address=request.POST.get('address')
        status=request.POST.get('status')

        x=workertable(email=email,password=password,number=number,name=name,address=address,status=status,id=id)
        x.save()
    return redirect(viewuser)

def delete(request,id):
    x=workertable.objects.get(id=id)
    x.delete()
    return redirect(viewuser)


def viewprofile(request):
    q=request.session['uid']
    x=workertable.objects.filter(id=q)
    return render(request,'viewprofile.html',{'result':x})

def change(request,id):
    x=workertable.objects.get(id=id)
    return render(request,'changes.html',{'result':x})

def addchanges(request,id):
    if request.method=="POST":
        name=request.POST.get('name')  
        email=request.POST.get('email') 
        number=request.POST.get('number') 
        password=request.POST.get('password')
        address=request.POST.get('address')

        x=workertable(email=email,password=password,number=number,name=name,address=address,id=id)
        x.save()
    return redirect(viewprofile)

def addsubcontractor(request):
    if request.method=="POST":
        name=request.POST.get('name')  
        email=request.POST.get('email') 
        number=request.POST.get('number') 
        password=request.POST.get('password')
        address=request.POST.get('address')
        if workertable.objects.filter(email=email).exists() | subconttable.objects.filter(email=email).exists():
            return render(request,'addsubcontractor.html',{'result':'Email Already Exist'})
        x=subconttable(email=email,password=password,number=number,name=name,address=address,)
        x.save()
    return render(request,'addsubcontractor.html')

def viewsubcontractor(request):
    x=subconttable.objects.all()
    return render(request,'viewsubcontractor.html',{'result':x})

def delete_c(request,id):
    x=subconttable.objects.get(id=id)
    x.delete()
    return redirect(viewsubcontractor)

def delete_p(request,id):
    x=prottable.objects.get(id=id)
    x.delete()
    return redirect(viewproject)

def edit_c(request,id):
    x=subconttable.objects.get(id=id)
    return render(request,'edit_c.html',{'result':x})

def addedit_c(request,id):
    if request.method=="POST":
        name=request.POST.get('name')  
        email=request.POST.get('email') 
        number=request.POST.get('number') 
        password=request.POST.get('password')
        address=request.POST.get('address')

        x=subconttable(email=email,password=password,number=number,name=name,address=address,id=id)
        x.save()
    return redirect(viewsubcontractor)

def viewsubcontprofile(request):
    q=request.session['cid']
    x=subconttable.objects.filter(id=q)
    return render(request,'viewsubcontprofile.html',{'result':x})

def change_c(request,id):
    x=subconttable.objects.get(id=id)
    return render(request,'changes_c.html',{'result':x})

def addchanges_c(request,id):
    if request.method=="POST":
        name=request.POST.get('name')  
        email=request.POST.get('email') 
        number=request.POST.get('number') 
        password=request.POST.get('password')
        address=request.POST.get('address')

        x=subconttable(email=email,password=password,number=number,name=name,address=address,id=id)
        x.save()
    return redirect(viewsubcontprofile)

def addproject(request):
    if request.method=="POST":
        project=request.POST.get('project')  
        location=request.POST.get('location') 
        address=request.POST.get('address')
        description=request.POST.get('description')
        start_date=request.POST.get('start_date') 
        estimated_price=request.POST.get('estimated_price') 
        myfile=request.FILES['pdf_file']
        fs=FileSystemStorage()
        filename=fs.save(myfile.name,myfile)
        x=prottable(project=project,estimated_price=estimated_price,location=location,start_date=start_date,pdf_file=filename,address=address,description=description,status='pending')
        x.save()
    return render(request,'addproject.html')

def viewproject(request):
    x=prottable.objects.all()
    return render(request,'viewproject.html',{'result':x})

def assign_sub(request,id):
    x=prottable.objects.get(id=id)
    u=subconttable.objects.all()
    return render(request,'assign_sub.html',{'result':x,'res':u})

def add_assign_sub(request):
    if request.method == "POST":
        project_id = request.POST.get('pro_id')  
        sub_con_id = request.POST.get('sub_id') 
        
        project = get_object_or_404(prottable, id=project_id)

        sub_con = get_object_or_404(subconttable, id=sub_con_id)

        x = pro_assign_sub(project=project, sub_con=sub_con)
        x.save()

        project.status = 'Assigned'
        project.save()

        return render(request, 'index.html', {'msg': 'Assigned Success'})
    
def viewproject_sub(request):
    pro_assignments = pro_assign_sub.objects.filter(sub_con=request.session['cid'])
    
    project_ids = pro_assignments.values_list('project_id', flat=True)
    
    projects = prottable.objects.filter(id__in=project_ids)
    
    return render(request, 'viewproject_subb.html', {'result': projects})

def assign_workers(request,id):
    x=prottable.objects.get(id=id)
    u=workertable.objects.filter(status='Available')
    return render(request,'assign_workers.html',{'result':x,'res':u})

def add_assign_workers(request):
    if request.method == "POST":
        project_id = request.POST.get('pro_id')  
        worker_id = request.POST.get('wrkr_id')  # Use getlist to get multiple values
        
        project = get_object_or_404(prottable, id=project_id)


        worker = get_object_or_404(workertable, id=worker_id)

        x = pro_assign_worker(project=project, worker=worker)
        x.save()
                # Update worker status
        worker.status = 'not_available'
        worker.save()

        return render(request, 'index.html', {'msg': 'Assigned Success'})
    
def viewproject_wrkr(request):
    wrk = request.session['uid']
    
    assigned_projects = pro_assign_worker.objects.filter(worker=wrk)
    
    assigned_project_ids = [assignment.project_id for assignment in assigned_projects]
    
    projects_for_worker = prottable.objects.filter(id__in=assigned_project_ids)
    
    return render(request, 'viewproject_wrkr.html', {'result': projects_for_worker})

def add_expenses(request,id):
    project = pro_assign_worker.objects.get(id=id)
    return render(request, 'add_expenses.html', {'result': project})

def addproject_expense(request):
    if request.method == "POST":
        details = request.POST.get('details')  
        date = request.POST.get('date') 
        pro_id = request.POST.get('pro_id')
        amount = request.POST.get('amount')
       
        # Retrieve the prottable instance corresponding to the pro_id
        project_instance = prottable.objects.get(id=pro_id)
        
        # Create and save the expenses_tbl instance
        expense = expenses_tbl(details=details, date=date, project=project_instance, amount=amount)
        expense.save()
        
        return render(request, 'index.html', {'msg': 'Added Success'})
from django.db.models import Sum
def view_exp_admin(request, id):
    project = prottable.objects.get(id=id)
    
    # Fetch expense details for the corresponding project
    expense_details = expenses_tbl.objects.filter(project=project)
    total_expense_amount = expense_details.aggregate(Sum('amount'))['amount__sum'] or 0
    
    # Fetch wage details for the corresponding project
    wage_details = worker_wages.objects.filter(project=project)
    total_wage_amount = wage_details.aggregate(Sum('amount'))['amount__sum'] or 0
    
    # Calculate grand total
    grand_total = total_expense_amount + total_wage_amount
    
    return render(request, 'view_exp_admin.html', {'project': project, 
                                                    'expense_details': expense_details, 
                                                    'total_expense_amount': total_expense_amount,
                                                    'wage_details': wage_details,
                                                    'total_wage_amount': total_wage_amount,
                                                    'grand_total': grand_total})
from datetime import date
def invoice_view(request, id):
    project = prottable.objects.get(id=id)
    expense_details = expenses_tbl.objects.filter(project=project)
    total_expense_amount = expense_details.aggregate(Sum('amount'))['amount__sum'] or 0
    
    # Fetch wage details for the corresponding project
    wage_details = worker_wages.objects.filter(project=project)
    total_wage_amount = wage_details.aggregate(Sum('amount'))['amount__sum'] or 0
    
    # Calculate grand total
    grand_total = total_expense_amount + total_wage_amount
    
    current_date = timezone.now().date()
    
    return render(request, 'invoice.html', {'project': project, 
                                            'expense_details': expense_details, 
                                            'total_expense_amount': total_expense_amount, 
                                            'wage_details': wage_details, 
                                            'total_wage_amount': total_wage_amount, 
                                            'grand_total': grand_total, 
                                            'current_date': current_date})



def add_doc(request,id):
    project = prottable.objects.get(id=id)  
    return render(request,'add_doc.html', {'project': project})

def add_doc_ins(request):
    if request.method == "POST": 
        pro_id = request.POST.get('pro_id')
        myfile1=request.FILES['contract_file']
        fs=FileSystemStorage()
        contract_file=fs.save(myfile1.name,myfile1) 
        myfile2=request.FILES['permit_file']
        fs=FileSystemStorage()
        permit_file=fs.save(myfile2.name,myfile2)
        myfile3=request.FILES['design_file']
        fs=FileSystemStorage()
        design_file=fs.save(myfile3.name,myfile3)
        myfile3=request.FILES['other']
        fs=FileSystemStorage()
        other=fs.save(myfile3.name,myfile3)         
        # Retrieve the prottable instance corresponding to the pro_id
        project_instance = prottable.objects.get(id=pro_id)
        
        # Create and save the expenses_tbl instance
        expense = documents_tbl(contract_file=contract_file, permit_file=permit_file, project=project_instance, design_file=design_file,other=other)
        expense.save()
        
        return render(request, 'index.html', {'msg': 'Added Success'})
    
def view_doc(request, id):
    project = prottable.objects.get(id=id)
    docs = documents_tbl.objects.filter(project=project)
    return render(request, 'view_doc.html', {'docs': docs})

def add_wage(request, id):
    worker = workertable.objects.get(id=id)
    
    assigned_projects = pro_assign_worker.objects.filter(worker=worker)
    print("pro=",assigned_projects)
    return render(request, 'add_wage.html', {'worker': worker, 'assigned_projects': assigned_projects})

def add_wage_ins(request, id):
    if request.method == "POST":
        wrkr_id = request.POST.get('wrkr_id')  
        date = request.POST.get('date') 
        pro_id = request.POST.get('pro_id')
        amount = request.POST.get('amount')
        hour = request.POST.get('hour')
 
        project_instance = prottable.objects.get(id=pro_id)
        worker_instance = workertable.objects.get(id=wrkr_id)
        if worker_wages.objects.filter(worker=worker_instance, date=date).exists():
            return render(request, 'index.html', {'msg': 'Wage for the worker on the same date already Given'})
        expense = worker_wages(worker=worker_instance, date=date, project=project_instance, amount=amount, hour=hour)
        expense.save()
        
        return render(request, 'index.html', {'msg': 'Added Success'})
    
def view_wagewrkr(request):
    wr = request.session['uid']
    
    wage_details = worker_wages.objects.filter(worker=wr).select_related('project')
    
    return render(request, 'view_wagewrkr.html', {'result': wage_details})