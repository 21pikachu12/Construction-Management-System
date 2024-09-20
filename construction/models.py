from django.db import models
from django.utils import timezone
from datetime import datetime,time


class workertable(models.Model):
    name=models.CharField(max_length=150)  	 	
    email=models.CharField(max_length=150) 
    password=models.CharField(max_length=150)
    number=models.CharField(max_length=150)    
    address=models.CharField(max_length=150) 
    status=models.CharField(max_length=150) 
   
class subconttable(models.Model):
    name=models.CharField(max_length=150)  	 	
    email=models.CharField(max_length=150) 
    password=models.CharField(max_length=150)
    number=models.CharField(max_length=150)    
    address=models.CharField(max_length=150) 

class prottable(models.Model):
    project=models.CharField(max_length=150)  	 	
    location=models.CharField(max_length=150) 
    address=models.CharField(max_length=150)
    description=models.CharField(max_length=150)
    start_date=models.DateField(max_length=150)    
    pdf_file=models.CharField(max_length=120)
    status=models.CharField(max_length=120)
    estimated_price=models.DecimalField(max_digits=10, decimal_places=2)

class pro_assign_sub(models.Model):
    project = models.ForeignKey(prottable, on_delete=models.CASCADE)  	 	
    sub_con = models.ForeignKey(subconttable, on_delete=models.CASCADE)  	

class pro_assign_worker(models.Model):
    project = models.ForeignKey(prottable, on_delete=models.CASCADE)
    worker = models.ForeignKey(workertable, on_delete=models.CASCADE)

class expenses_tbl(models.Model):
    project = models.ForeignKey(prottable, on_delete=models.CASCADE)  	 	
    details=models.CharField(max_length=500) 
    date=models.DateField(max_length=150)    
    amount=models.DecimalField(max_digits=10, decimal_places=2)

class documents_tbl(models.Model):
    project = models.ForeignKey(prottable, on_delete=models.CASCADE)  	 	
    contract_file=models.FileField(max_length=500) 
    permit_file=models.FileField(max_length=500) 
    design_file=models.FileField(max_length=500) 
    other=models.FileField(max_length=500) 

class worker_wages(models.Model):
    project = models.ForeignKey(prottable, on_delete=models.CASCADE)  	 	
    worker = models.ForeignKey(workertable, on_delete=models.CASCADE)  	 	
    date=models.DateField(max_length=500) 
    amount=models.DecimalField(max_digits=10, decimal_places=2)
    hour=models.CharField(max_length=500) 
