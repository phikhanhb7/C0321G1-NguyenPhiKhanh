use quanlybanhang;
insert into customer(cid,cNAME,cAGE)
values (1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);

insert into oder
values (3,"2006-03-21",5000),
	(2,"2006-03-23",2000),
    (3,"2006-03-16",100000);
    
insert into product(pid,pName,pPrice)
values (1,"May Giat",3),
	 (2,"Tu Lanh",5),
      (3,"Dieu Hoa",7),
       (4,"Quat",1),
        (5,"Bep Dien",2);
        
insert into orderdetail(oID,pID,odQTY)
values (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select o.oID, o.oDate, p.pPrice 
from orders o join orderdetail od on o.oID = od.oID join product p on od.pID = p.pID;

select c.cName,  p.pName
from customer c join orders o on c.cID = o.cID
join orderdetail od on o.oID = od.oID 
join product p on od.pID = p.pID;


select  c.cName 
from  customer c
left join  orders o on c.cID =o.cID
where o.oID is null;


select o.oID,  o.oDate, sum(od.odQTY * p.pPrice) as oTotalPrice
from  orders o 
join orderdetail od on  o.oID = od.oID
join product p on od.pID = p.pID 
group by o.oID;