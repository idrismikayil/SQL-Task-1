create database SQL_Task_1

use SQL_Task_1

--Task1--

create table Departments(
Id int primary key identity,
[Name] nvarchar(25) not null constraint Check_Name check(LEN([Name])>2)
)

create table Employees(
Id int primary key identity,
FullName nvarchar(25) not null constraint Check_FullName check(LEN(FullName)>3),
Salary int constraint Check_Salary check(Salary>=0),
DepartmentId int constraint FK_Employees_DepartmentId foreign key references Departments(Id)
)

insert into Departments([Name])
values('Programming'),
('Graphic Design'),
('Marketing'),
('Accountant'),
('Human Resource'),
('Finance'),
('System Administrator'),
('CEO'),
('CFO'),
('CTO')

insert into Employees
values('Elon Musk',3500,1),
('Mark Zuckerberg',4500,1),
('Jeff bezos',3590,2),
('Steve Jobs',1000,2),
('Tim Cook',7500,2),
('Bill Gates',3000,3),
('Jay Z',2500,3),
('Slim Shady',1500,4),
('Dr. Dre',8500,5),
('2pac',1500,5),
('Notorius B.I.G',1500,6),
('Eazy E',1200,7),
('Snoop Dogg',1500,8),
('50 Cent',1030,9),
('Eminem',2000,10)

select e.FullName, e.Salary, d.Name as 'Department Name' from Employees as e
join Departments as d
on e.DepartmentId = d.Id

select d.Name as 'Department Name', COUNT(e.FullName) as 'Employee Count' from Employees as e
join Departments as d
on e.DepartmentId = d.Id
group by d.Name

--Task2--

create table Pricing(
Id int primary key identity,
[Name] nvarchar(15) not null,
Price int not null constraint Check_Price check(Price>=0) 
)

create table Feature(
Id int primary key identity,
[Desc] nvarchar(50) not null
)

create table PricingFeature (
Id int primary key identity,
PricingId int constraint FK_PricingFeature_PricingId foreign key references Pricing(Id),
FeatureId int constraint FK_PricingFeature_FeatureId foreign key references Feature(Id)
)

insert into Pricing
values('Free', 0),
('Business', 29),
('Developer', 49)

insert into Feature
values('Quam adipiscing vitae proin'),
('Nec feugiat nisl pretium'),
('Nulla at volutpat diam uteera'),
('Pharetra massa massa ultricies'),
('Massa ultricies mi quis hendrerit')

insert into PricingFeature
values(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,1),
(2,2),
(2,3),
(2,4),
(2,5),
(3,1),
(3,2),
(3,3),
(3,4),
(3,5)

select p.[Name], f.[Desc] as 'Feature' from PricingFeature pf
join Pricing p
on pf.PricingId = p.Id
join Feature f
on pf.FeatureId = f.Id

--Task3--

create table PortfolioImages(
Id int primary key identity,
[Image] nvarchar(25) not null,
PortfolioId int constraint FK_Images_PortfolioId foreign key references Portfolios(Id)  
)

create table Portfolios(
Id int primary key identity,
[Name] nvarchar(25) not null,
CategoryId int constraint FK_Portfolios_CategoryId foreign key references Categories(Id)  
)

create table Categories(
Id int primary key identity,
[Name] nvarchar(25) not null,  
)

insert into PortfolioImages
values ('basket',1),
('tea',3),
('toothpaste',1),
('honest-beauty',2),
('aerin',3),
('cocooil',1),
('water',2),
('desk',2),
('food',3)

insert into Portfolios
values ('app',1),
('card',2),
('web',3)

insert into Categories
values ('category-#1'),
('category-#2'),
('category-#3')

update Categories
set [Name]='category - 1' where [Name]='category-1'
update Categories
set [Name]='category - 2' where [Name]='category #2'
update Categories
set [Name]='category - 3' where [Name]='category #3'

--select [pi].Id, [pi].[Image], p.[Name] as 'Portfolio Name' from PortfolioImages as [pi]
--join Portfolios as p
--on [pi].PortfolioId = p.Id

--select p.Id, p.[Name] as 'Portfolio Name',c.[Name] as 'Category Name' from Portfolios as p
--join Categories as c
--on p.CategoryId = c.Id

select p.[Name] as 'Portfolio Name', [pi].[Image] as 'Image Name', c.[Name] as 'Category Name' from Categories as c
join Portfolios as p
on p.CategoryId = c.Id
join PortfolioImages as [pi]
on [pi].PortfolioId = p.Id