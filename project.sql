create database project;
CREATE TABLE SaleTable (SalesID  integer,
						OrderID  integer,
                        Customer varchar(4),
                        Product  varchar(4),
                        Date_of_order datetime,
                        Quantity  integer,
                        UnitPrice decimal,
                        primary key (SalesID));
CREATE TABLE SalesProfit (Product varchar(4),
                         ProfitRatio decimal(5,4) );                         

INSERT INTO saletable 
values (1, 1, "C1", "P1", 1, 2, 100),
 (2, 1, "C1", "P2", 1, 4, 150 ),
(3, 1, "C2", "P2", 1, 5, 150),
(4, 2, "C3", "P4", 1, 3, 550),
(5, 3, "C4", "P3", 1, 1, 300),
(6, 4, "C4", "P6", 1, 6, 150),
(7, 4, "C4", "P4", 1, 6, 550),
(8, 4, "C5", "P2", 1, 3, 150),
(9, 5, "C5", "P1", 1, 6, 100),
(10, 5, "C1", "P6", 1, 3, 150),
(11, 6, "C1", "P3", 1, 2, 300),
(12, 6, "C3", "P5", 1, 4, 400),
(13, 7, "C3", "P1", 1, 6, 100),
(14, 7, "C3", "P3", 1, 1, 300),
(15, 7, "C5", "P2", 1, 3, 150),
(16, 8, "C5", "P5", 1, 4, 400),
(17, 8, "C5", "P1", 1, 2, 100),
(18, 8, "C2", "P3", 2, 1, 300),
(19, 9, "C2", "P4", 2, 3, 550),
(20, 9, "C2", "P5", 2, 6, 400),
(21, 9, "C2", "P1", 2, 4, 100),
(22, 9, "C4", "P6", 2, 3, 150),
(23, 10, "C6", "P3", 2, 2, 300),
(24, 11, "C6", "P4", 2, 3, 550),
(25, 11, "C7", "P1", 2, 5, 100),
(26, 12, "C7", "P2", 2, 3, 150),
(27, 12, "C7", "P3", 2, 1, 300),
(28, 12, "C2", "P1", 2, 4, 100),
(29, 13, "C2", "P3", 2, 2, 300),
(30, 13, "C6", "P2", 2, 6, 150),
(31, 14, "C4", "P6", 2, 1, 150),
(32, 15, "C1", "P4", 3, 6, 550),
(33, 16, "C2", "P5", 3, 3, 400),
(34, 17, "C8", "P1", 3, 6, 100),
(35, 18, "C8", "P3", 3, 3, 300),
(36, 18, "C8", "P5", 3, 5, 400),
(37, 19, "C9", "P2", 3, 2, 150),
(38, 20, "C2", "P3", 3, 4, 100),
(40, 20, "C2", "P2", 3, 1,150);

INSERT INTO salesprofit 
values("P1", 0.05),
("P2", 0.25),
("P3", 0.1),
("P4", 0.2),
("P5", 0.1),
("P6", 0.1);

SELECT
sum(Quantity * UnitPrice) As "total_sale"
from saletable;

select count(distinct Customer) as "customers" from saletable;

select product,
  count(Product)
from saletable
group by Product;

select customer, OrderID, Qauntity, Quantity*UnitPrice
from saletable 
where (Quantity * unitprice)> 1500 ;

select count(distinct customer) as "customers" from saletable
group by dayname(date_of_order)

 /*create database project2;
 create table department ( id integer,
						firstname character(20),
                          manager character(20),
                          manager_id integer);
insert into department
values (1, "ken", null, 1),
(2, "hugo", null, 1),
( 3,"james", "carol", 5),
( 4,"mark", "morgan", 13),   
( 5,"carol", "alex", 12),   
( 6,"david", "rose", 21),   
( 7,"michael", "markos", 11),   
( 8,"brad", "alex", 12),   
( 9,"rab", "matt", 15),   
( 10,"dylan", "alex", 12),   
( 11,"markos", "carol", 5),
( 12,"alex", "ken", 1),      
( 13,"morgan", "matt", 15),   
( 14,"jennifer", "morgan", 13),   
( 15,"matt", "hugo", 2),   
( 16,"tom", "brad", 8),   
( 17,"oliver", "dylan", 10),   
( 18,"daniel", "rob", 9),   
( 19,"amanda", "markos", 11),   
( 20,"ana", "dylan", 10),       
( 21,"rose", "rob", 9),   
( 22,"robert", "rob", 9),   
( 23,"fill", "morgan", 13),   
( 24,"antoan", "david", 6),   
(25 ,"eddie", "mark", 4);

alter table department
add level varchar(10);

with recursive empdata As (
(select id, firstname, manager, manager_id, 1 as level
from department
where id = 1 and 2)
union all
(select this.id, this.firstname, this.manager, this.manager_id, prior.level +1
from empdata prior
inner join department this on this.manager_id = prior.id)
)
select e.id, e.firstname, e.manager, e.manager_id, e.level
from department e
order by e.level;*/
                         