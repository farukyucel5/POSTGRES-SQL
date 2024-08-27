-- GREEN PAGES

-- ORDER BY Komutu

SELECT * FROM customers c 

--SORU: Customer tablosunu score değerlerine göre 
--küçükten büyüğe sıralayarak getir

SELECT * 
FROM customers 
ORDER BY score ASC 

--NOT: PostgreSQL de NULL değerler ASC sıralamasında en alta gider.
--MYSQL de ise en üstte gelir. Eğer Postgre de Null değeri en üstte görmek istersek
--alttaki gibi yazarız:

SELECT * 
FROM customers 
ORDER BY score ASC NULLS FIRST

-- Customer tablosunu score değerlerine göre büyükten küçüğe sıralayarak getir

SELECT * 
FROM customers 
ORDER BY score DESC

-- NULL değerler en altta görünmesini isterseniz;
SELECT * 
FROM customers
ORDER BY score DESC NULLS LAST

--ORDER BY için 2 kriter kullanımı
-- Country e göre alfabetik olarak ve score'a göre büyükten küçüğe sırala
SELECT *
FROM customers c 
ORDER BY country ASC,score DESC
-- önce country ye göre sıraladık, sonra ülkeleri kendi içerisinde score a göre tekrar sıraladık
-- Birden fazla sıralamada önce birinci field dakileri sıralar, sonra birinci field da aynı olanlara // 
--// bağlı olarak ikinci fielda kileri kendi arasında siralar


-- ORDER By için alttaki gibi kullanılaiblir ama tavsiye edilmez
--field adını yazmak yerine tablodaki sıra numarası yazılarak elde edilir
SELECT *
FROM customers c 
ORDER BY 4 ASC,5 DESC

-- PostgreSQL de büyükten küçüğe sıralamada NULL hücreyi öncelikli getirir


-- LIMIT Command
-- Seçilen satır sayısı kadar sonucu döndürür

--Customer tablosundaki ilk 2 satırı getir
SELECT *
FROM customers c 
LIMIT 2

-- OFFSET VE LIMIT KULLANIMI
-- OFFSET: yazılan rakam kadar satırı atlayıp sonrakilerini getirmenizi sağlar

SELECT *
FROM customers c 
OFFSET 2
LIMIT 1

-- AÇIKLAMA: İLK 2 SATIRI ATLAYIP SONRA SADECE 3.SATIRI GETİRİR 






