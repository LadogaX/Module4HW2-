--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer 
-------------------------------------------------------------
Select * from Sales.Customer 
GO

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
-------------------------------------------------------------
Select * from Sales.Store order by Name
GO

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
-------------------------------------------------------------
Select Top(10) * 
from HumanResources.Employee 
where BirthDate>'1989-09-28'
GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
-------------------------------------------------------------
Select NationalIDNumber, LoginID, JobTitle 
from HumanResources.Employee 
where RIGHT(LoginId,1)='0'
order by JobTitle
GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------
Select * from Person.Person
where Year(ModifiedDate)='2008' and MiddleName is not null and Title is null

GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------
Select Distinct Depart.Name
from HumanResources.Department as Depart 
inner join HumanResources.EmployeeDepartmentHistory as EmplDepart 
on Depart.DepartmentID=EmplDepart.DepartmentID 

GO
--проверка
Select EmpDepHis.DepartmentID,Count(EmpDepHis.DepartmentID) as CountEmployee
from HumanResources.EmployeeDepartmentHistory as EmpDepHis
group by EmpDepHis.DepartmentID
----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------
Select Sum(CommissionPct) as SumCommissionPct
from Sales.SalesPerson
group by TerritoryID
Having Sum(CommissionPct)>0
GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
Select * 
from HumanResources.Employee 
where VacationHours in 
(Select Max(VacationHours) from HumanResources.Employee)
GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------
Select * 
from HumanResources.Employee 
where JobTitle in 
('Sales Representative', 'Network Administrator', 'Network Manager')
GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------
Select Employees.*, Orders.* 
from HumanResources.Employee as Employees
left outer join Purchasing.PurchaseOrderHeader as Orders
on Orders.EmployeeID =Employees.BusinessEntityID 
order by Employees.BusinessEntityID 

GO
