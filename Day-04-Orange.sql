-- ORANGE PAGES

--CONSTRAINTS/ KISITLAMALAR/BELİRLEYİCİLER
-- UNIQUE and NOT NULL

CREATE TABLE ogrenciler2 (
	ogrenci_no char (7) UNIQUE,
	isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL,
	not_ort REAL,
	kayit_tarihi DATE
);

INSERT INTO ogrenciler2 VALUES ('1234567','Ali','Yilmaz',80,now())


INSERT INTO ogrenciler2 VALUES ('2345678','Ali','Veli',90,now())

INSERT INTO ogrenciler2 VALUES ('2345679',' ','Ece',50,now()) -- boşluk NULL değildir

INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('Bilal','Ece')

INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('John','Steve')

--not: NULL larin hepsi UNIQUE kabul edilir. 
--Her field da birden fazla null olabilir.

SELECT * 
FROM ogrenciler2

----------------------------------
-- PRIMARY KEY

-- Primary Key: Eger bir field "primary key" olarak deklare edilmisse, field datalari "unique", "not null" olmali.
--Bir tabloda sadece 1 tane "primary key" olabilir.


--Primary Key atamasi icin 1.yol:
CREATE TABLE ogrenciler3 (
	ogrenci_no char (7) PRIMARY KEY, --NOT NULL ve UNIQUE şartlarını sağlar
	isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL,
	not_ort REAL,
	kayit_tarihi DATE
);

SELECT * 
FROM ogrenciler3

-- Primary Key ataması için 2.yol:

CREATE TABLE ogrenciler4( 
ogrenci_no char(7),
isim varchar(20) NOT NULL,
soyisim varchar (30) NOT NULL,
not_ort REAL,
kayit_tarihi date,
CONSTRAINT ogr_no_pk PRIMARY KEY(ogrenci_no)
);

--NOT: 2.metotta PK için,istediğimiz özel ismi (custom) verebiliriz

SELECT * 
FROM ogrenciler4 

INSERT INTO ogrenciler4 VALUES ('1234567','Ali','Yilmaz',80,now())

INSERT INTO ogrenciler4 (isim,soyisim) VALUES ('John','Steve')--hatalı giriş:Primary KEY olan ogrenci_no hücresini boş geçemeyiz

/*
 * Parent Tablo: Birincil anahtarı (Primary Key) veya Unique Key içeren ve referans verilen tablodur. Diğer bir deyişle, parent tablo, child tablonun foreign key tarafından referans alınan tablodur.

Child Tablo: Foreign Key içeren ve parent tabloya referansla bağlanan tablodur. Child tablo, parent tablonun primary key veya UNİQUE anahtarını foreign key olarak kendi içinde barındırır ve bu foreign key üzerinden parent tabloyla ilişkilendirilir.

  */

---------------------------------
---------------------------
-- Foreign Key:Tablolar arasında ilişki oluşturmak içindir.
-- Değer olarak "null" kabul eder
-- Tekrarlanan verileri kabul eder
-- Bir tablo birden çok "Foreign Key" alanına sahip olabilir.

CREATE TABLE sirketler(
sirket_id INTEGER, 
sirket varchar(50)PRIMARY KEY,
personel_sayisi INTEGER
);

---
CREATE TABLE personel(
	id INTEGER,
	isim varchar(50),
	sehir varchar(50),
	maas REAL,
	sirket varchar(50),
FOREIGN KEY(sirket) REFERENCES sirketler(sirket)
);

-- CONSTRAINT per_fk FOREIGN KEY(sirket) REFERENCES sirketler(sirket));  bu yazım şeklinde custom foreign key bağlantı ismi verilmiş olur

--------------------------------------------------------------
-- CHECK Constraints
-- Age ve salary için veri giriş şartı oluşturalım:
-- salary 5000 den büyük olmalı, age 0 dan küçük olmamalı

CREATE TABLE person(
id INTEGER,
name varchar(50),
salary REAL PRIMARY KEY CHECK(salary>5000), --5000 den fazla giriş olmalı
age INTEGER CHECK(age>=0)  -- negatif değer olmayacak
);

SELECT * FROM person p 

INSERT INTO person VALUES (11,'Ali Can',6000,35)

INSERT INTO person VALUES (12,'Faruk Yücel',53000,30)

INSERT INTO person VALUES (12,'Rusen Ece',5500,-3) --Hatalı giriş: Age degeri şartı sağlamıyor

INSERT INTO person VALUES (13,'Ali Can',4000,45) -- Hatalı giriş: Salary şartı sağlanmıyor (>5000)


CREATE TABLE salaryType(
 salary REAL,
 sType varchar(50),
 FOREIGN KEY(salary) REFERENCES person(salary)

)

INSERT INTO salarytype VALUES (53000,'medium')

INSERT INTO salarytype VALUES (6000,'junior')


SELECT p.id, p.name, p.salary, p.age, s.sType
FROM person p
JOIN salaryType s ON p.salary = s.salary
WHERE s.sType = 'junior';









