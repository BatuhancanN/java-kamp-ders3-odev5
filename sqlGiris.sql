-- ANSII

Select * from Customers -- Customers tablosunu çeker.
Select ContactName, CompanyName, City from Customers -- * yerine yazılan kolonları çeker.
Select ContactName Adi, CompanyName Sirket, City Sehir from Customers -- üstteki kod ile aynı veriyi çeker ama isimlerini değiştirir.
Select * from Customers where City = 'london' -- Customers tablosunda, şehri "London" olanları getirir. Where burada sorgu için kullanılır.

Select * from products where categoryID = 1 or categoryid = 3 -- Products tablosunda kategorisi 1 ya da 3 olan ürünler getirilir.
Select * from products where categoryID = 1 and UnitPrice >= 10 -- Products tablosunda kategorisi 1 ve 3 olan ürünler ve aynı zamanda fiyatı 10 ve üzeri olan ürünler getirilir.
SELECT * FROM Products order by productname -- Products tablosundaki tüm elemanları productname'de var olan isimlerin alfabetik sırasıyla getirir.
SELECT * FROM Products order by categoryid
SELECT * FROM Products order by unitprice asc -- default olarak asc gelir yani artar sırayla. "ASCENDING"
SELECT * FROM Products order by unitprice desc -- azalan sırayla. "DECENDING"

select count(*) Adet from products -- Products tablosundaki ürünlerin sayısı.
select count(*) Adet from products where categoryid = 2 -- kategorisi 2 olan ürünlerin sayısı.

select categoryid from products group by categoryid -- Tüm kayıtlı kategorileri tekrar etmeden sırala.
select categoryid, count(*) adet from products group by categoryid --Hangi kategoride kaç tane ürün var?
select categoryid kategori, count(*) adet from products group by categoryid having count(*)<10 --10'dan az ürün olan kategorileri verir.

select *
from products inner join Categories              -- products tablosundaki her şeyi alır ve tablodaki kategori id ile kategoriler tablosunda eşleşen kategori bilgilerini çağırır.
on Products.categoryID = Categories.CategoryID

select Products.productid, products.productname, products.unitprice, categories.categoryname
from products inner join Categories              -- products tablosundaki ürünlerin id, ismini ve fiyatını alır ve tablodaki kategori id ile kategoriler tablosunda eşleşen kategori ismini çağırır.
on Products.categoryID = Categories.CategoryID

-- inner join sadece iki tabloda eşleşen datayı getitir.

select * from products p left join [Order Details] od -- left --> solda olup sağda olmayanları da getirir. ürünlerde olup satışı olmayanları getitir.
on p.productid = od.productid                         -- listelenen ürün sayısında değişim yoksa demek oluyor ki sipariş listesinde satılmayan ürün yok.

select * from customers c left join orders o          -- burada inner olursa sipariş vermiş olan müşteriler gelir. left olursa sipariş vermeyenler de gelir.
on c.customerid = o.customerid
where o.customerid is null --Bu satır eklendiğinde sadece sipariş vermemiş olanlar yani solda olup sağfa olmayan id'ler gelir.

