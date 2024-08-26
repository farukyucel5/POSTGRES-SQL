-- ORANGE Database

CREATE DATABASE "OrangePage"
----------------------------------------
/* 
 
 * çoklu
 * yorum
 * satırı için /* .......*/   arasında yazabiliriz
 
 
 */

-----------------------------

-- SORU: students isimli bir table oluştrurun. bu table da student_id,first_name,
--last_name, birth_date ve department olsun.


DROP TABLE IF EXISTS students;
CREATE TABLE students (
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birth_date DATE,
	department VARCHAR(100)
);

-- 15 Mayıs 2000 doğumlu  John Doe isimli ve Computer Science departmanında çalışan kişiyi ekleyelim..

INSERT INTO students (first_name,last_name,birth_date,department) VALUES
('John','Doe','2000-05-15','Computer Science');

SELECT *
FROM students s 

/*
alttaki girişleri students tablosuna yapınız:
Jane Smith, '1999-07-22', Mathematics,
Emily' Johnson, 2001-03-18, Physics,
Michael Brown, 1998-12-01, Biology
*/

INSERT INTO students (first_name,last_name,birth_date,department) VALUES 
('Jane','Smith', '1999-07-22','Mathematics'),
('Emily', 'Johnson', '2001-03-18', 'Physics'),
('Michael', 'Brown', '1998-12-01', 'Biology');

SELECT * 
FROM students s 

--sadece belli field'lara bilgi girişi yapalım
-- first name: Alice, depart:Chemistry

INSERT INTO students (first_name,department) VALUES
('Alice','Chemistry');
-- NOT: Eğer yalnızca bazı field'lara veri eklemek istiyorsanız,
-- diğer fiedl'lar için varsayılan değerler kullanılacaktır

------------------------------------------------------------------
-- Tablo oluşturma
CREATE TABLE ogrenciler(
	ogrenci_no char(7), --mutlaka 7 karakter girilecek
	isim varchar(20),
	soyisim varchar(30),
	not_ort REAL, -- ondalıklı sayıları belirtmek için
	kayit_tarihi date
);

SELECT * FROM ogrenciler o 

-- SQL de tablo oluşturmanın 2 yolu vardır. Birincisi sıfırdan oluşturmaktır(yukarda yapıldı)
-- diğeri de var olan tablodan belli "field"ları kopyalarak yapmaktır

--Var olan tablodan yeni Tablo Create etmek
-- (isim, soyisim ve not_ort field'larını kullanarak)
CREATE TABLE ogrenci_notlari
AS
SELECT isim, soyisim, not_ort
FROM ogrenciler o 

SELECT * 
FROM ogrenci_notlari 

-- ogrenciler tablosuna veri girişi yapalım
INSERT INTO ogrenciler VALUES ('1234567','Tom','Cruise',85.5,'2024-08-24')
INSERT INTO ogrenciler VALUES ('2345678', 'Ali','Can',95.3,now());


SELECT * 
FROM ogrenciler o 

-------------------------

CREATE TABLE IF NOT EXISTS aktorler (
	id INTEGER,
	name VARCHAR(30),
	email VARCHAR(50)
);
SELECT * FROM aktorler

--Altta dizayn hatası olarak e-maillerin UNIQUE olmadıgı goruluyor
INSERT INTO aktorler VALUES (1001, 'Kemal Sunal', 'aktor@gmail.com');
INSERT INTO aktorler VALUES (1002, 'Sener Sen', 'aktor@gmail.com'); 

-- Tek field için veri girişi
INSERT INTO aktorler(name) VALUES ('Turkan Soray'); 




SELECT *FROM aktorler a 




