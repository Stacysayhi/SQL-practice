CREATE VIEW PHIEUNHAPTRA
AS
SELECT A.TGXL,A.SP,A.NGAY,A.MKN,A.MKX,B.STT,B.ML,B.DG,B.TT
FROM NHAPTRA1 A
JOIN NHAPTRA2 B
ON A.TGXL= B.TGXL AND A.SP = B.SP
GO

--CAU 2:
SELECT *
FROM PHIEUNHAPTRA A
JOIN DMTHUOC B
ON A.ML = B.ML
WHERE RIGHT(A.TGXL,4)='2017' AND B.TL LIKE '%sa%'
ORDER BY A.TT DESC

---CAU 3:
SELECT LEFT(A.TGXL,2) AS THANG, RIGHT(A.TGXL,4) AS NAM, A.MKN,B.TK,A.TT
FROM PHIEUNHAPTRA A
JOIN DMK B
ON A.MKN= B.MK
WHERE A.TT > 10000000
GROUP BY A.MKN,A.TT,A.TGXL,B.TK
ORDER BY 1,2


--CAU 4:
SELECT A.ML,B.TL
FROM PHIEUNHAPTRA A
JOIN DMTHUOC B
ON A.ML=B.ML
WHERE RIGHT(A.TGXL,4)='2016'
INTERSECT
SELECT A.ML,B.TL
FROM PHIEUNHAPTRA A
JOIN DMTHUOC B
ON A.ML=B.ML
WHERE RIGHT(A.TGXL,4)='2017'

--CAU 5:
ALTER VIEW CAU5
AS
SELECT A.SP AS SOPHIEUNHAP ,B.SP AS SOPHIEUXUAT ,A.SL AS SLNHAP , B.SL AS SLXUAT, A.TGXL AS TGXL
FROM NHAP2 A
JOIN THONGKEXUAT2 B
ON A.TGXL= B.TGXL AND A.STT = B.STT
GO

SELECT *
FROM CAU5
WHERE TGXL='012016'