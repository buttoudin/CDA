-- Active: 1715778329735@@127.0.0.1@3306@papyrus
SELECT * FROM vente
WHERE numfou = '09120'

SELECT vente.numfou FROM vente
WHERE delliv !=0

SELECT COUNT(DISTINCT vente.numfou), COUNT(vente.numfou) FROM vente

SELECT produit.codart, produit.libart, produit.stkphy, produit.stkale, produit.qteann FROM produit
WHERE produit.qteann<1000 OR produit.stkale>=produit.stkphy

SELECT fournis.posfou, fournis.nomfou FROM fournis 
WHERE posfou LIKE '75%' OR posfou LIKE '78%' OR posfou LIKE '77%' OR posfou LIKE '92%'

SELECT * FROM entcom
WHERE datcom LIKE '%-03-%' OR datcom LIKE '%-04-%'

SELECT numcom, datcom FROM entcom
WHERE obscom != ''

-- ???
SELECT  ligcom.numcom, (ligcom.priuni*ligcom.qtecde) AS 'total' 
FROM ligcom
GROUP BY ligcom.numcom;


SELECT fournis.nomfou, entcom.numcom, entcom.datcom FROM fournis
JOIN entcom ON fournis.numfou=entcom.numfou

SELECT produit.* FROM produit
JOIN  ligcom ON ligcom.codart = produit.codart
JOIN entcom ON entcom.numcom=ligcom.numcom
WHERE entcom.obscom='%urgent%'

SELECT fournis.nomfou FROM fournis
JOIN entcom ON entcom.numfou=fournis.numfou

SELECT entcom.numcom, entcom.datcom FROM entcom
WHERE entcom.numcom = 70210

SELECT produit.libart, vente.prix1, vente.codart FROM produit
JOIN vente ON vente.codart=produit.codart
WHERE vente.prix1< ( SELECT MIN(v.prix1) FROM vente v WHERE v.codart like "R%")

SELECT * FROM fournis 
JOIN entcom ON entcom.numfou=fournis.numfou
JOIN vente ON vente.numfou=fournis.numfou
JOIN produit ON produit.codart=vente.codart
WHERE (produit.stkphy*100)/produit.stkale<=150


