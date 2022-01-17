--------------------------�������----------------------------

----------------------������� �1-----------------------------
--������� ��� ���������� �� ������� Sales.Customer 
-------------------------------------------------------------
Select * from Sales.Customer 
GO

----------------------������� �2-----------------------------
--������� ��� ���������� �� ������� Sales.Store ��������������� 
--�� Name � ���������� �������
-------------------------------------------------------------
Select * from Sales.Store order by Name
GO

----------------------������� �3-----------------------------
--������� �� ������� HumanResources.Employee ��� ����������
--� ������ �����������, ������� �������� ����� 1989-09-28
-------------------------------------------------------------
Select Top(10) * 
from HumanResources.Employee 
where BirthDate>'1989-09-28'
GO

----------------------������� �4-----------------------------
--������� �� ������� HumanResources.Employee �����������
--� ������� ��������� ������ LoginID �������� 0.
--������� ������ NationalIDNumber, LoginID, JobTitle.
--������ ������ ���� ������������� �� JobTitle �� ��������
-------------------------------------------------------------
Select NationalIDNumber, LoginID, JobTitle 
from HumanResources.Employee 
where RIGHT(LoginId,1)='0'
order by JobTitle
GO

----------------------������� �5-----------------------------
--������� �� ������� Person.Person ��� ���������� � �������, ������� ���� 
--��������� � 2008 ���� (ModifiedDate) � MiddleName ��������
--�������� � Title �� �������� �������� 
-------------------------------------------------------------
Select * from Person.Person
where Year(ModifiedDate)='2008' and MiddleName is not null and Title is null

GO

----------------------������� �6-----------------------------
--������� �������� ������ (HumanResources.Department.Name) ��� ����������
--� ������� ���� ����������
--������������ ������� HumanResources.EmployeeDepartmentHistory � HumanResources.Department
-------------------------------------------------------------
Select Distinct Depart.Name
from HumanResources.Department as Depart 
inner join HumanResources.EmployeeDepartmentHistory as EmplDepart 
on Depart.DepartmentID=EmplDepart.DepartmentID 

GO
--��������
Select EmpDepHis.DepartmentID,Count(EmpDepHis.DepartmentID) as CountEmployee
from HumanResources.EmployeeDepartmentHistory as EmpDepHis
group by EmpDepHis.DepartmentID
----------------------������� �7-----------------------------
--������������ ������ �� ������� Sales.SalesPerson �� TerritoryID
--� ������� ����� CommissionPct, ���� ��� ������ 0
-------------------------------------------------------------
Select Sum(CommissionPct) as SumCommissionPct
from Sales.SalesPerson
group by TerritoryID
Having Sum(CommissionPct)>0
GO

----------------------������� �8-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ����� ������� ���-�� 
--������� (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
Select * 
from HumanResources.Employee 
where VacationHours in 
(Select Max(VacationHours) from HumanResources.Employee)
GO

----------------------������� �9-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ������� (HumanResources.Employee.JobTitle)
--'Sales Representative' ��� 'Network Administrator' ��� 'Network Manager'
-------------------------------------------------------------
Select * 
from HumanResources.Employee 
where JobTitle in 
('Sales Representative', 'Network Administrator', 'Network Manager')
GO

----------------------������� �10-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) � 
--�� ������� (Purchasing.PurchaseOrderHeader). ���� � ���������� ���
--������� �� ������ ���� ������� ����!!!
-------------------------------------------------------------
Select Employees.*, Orders.* 
from HumanResources.Employee as Employees
left outer join Purchasing.PurchaseOrderHeader as Orders
on Orders.EmployeeID =Employees.BusinessEntityID 
order by Employees.BusinessEntityID 

GO
