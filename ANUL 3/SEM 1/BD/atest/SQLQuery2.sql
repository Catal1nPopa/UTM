-- Definirea datelor folosind clauza WITH
WITH r AS (
  SELECT 3 AS A, 3 as A
  UNION ALL
  SELECT 6, 4
  UNION ALL
  SELECT 2, 3
  UNION ALL
  SELECT 3, 5
  UNION ALL
  SELECT 3, 6
),
s AS (
  SELECT 5 AS A, 1 AS B, 6 as C
  UNION ALL
  SELECT 3, 3, 5
  UNION ALL
  SELECT 4, 3,1
)

-- Interogarea theta-joncțiunii
SELECT r.B, s.B
FROM r
JOIN s on r.A = s.A