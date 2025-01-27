
------------ afiseaaza atup(R)
--ex2
WITH data AS (
  SELECT 'a1' AS A, 'b2' AS B, 'c1' AS C
  UNION ALL
  SELECT 'a2', 'b1', 'c1'
  UNION ALL
  SELECT 'a1', 'b2', 'c2'
  UNION ALL
  SELECT 'a1', 'b1', 'c1'
  UNION ALL
  SELECT 'a1', 'b3', 'c2'
  UNION ALL
  SELECT 'a2', 'b2', 'c2'
  UNION ALL
  SELECT 'a2', 'b1', 'c2'
),
s AS (
  SELECT 'a2' AS A, 'b1' AS B, 'c2' AS C
  UNION ALL
  SELECT 'a2', 'b2', 'c2'
  UNION ALL
  SELECT 'a2', 'b1', 'c3'
  UNION ALL
  SELECT 'a1', 'b2', 'c1'
  UNION ALL
  SELECT 'a2', 'b2', 'c1')
, distinct_A AS (
select distinct(a.A)
from data a
)
, distinct_B AS (
select distinct(a.B)
from data a
)
, distinct_C AS (
select distinct(a.C)
from data a
), dis as( -- Creează toate cazurile posibile dintre coloanele A, B și C atup(r)
SELECT a.A, B.B, C.C
FROM distinct_A a
CROSS JOIN distinct_B AS B
CROSS JOIN distinct_C AS C
),complement_r as(--complimentul lui r
SELECT t1.A, t1.B, t1.C
FROM dis AS t1
LEFT JOIN data AS t2
ON t1.A = t2.A AND t1.B = t2.B AND t1.C = t2.C
WHERE t2.A IS NULL),
reuniune as ( ---reuniunea
select * from complement_r
union
select * from s),
select1 as(
select * from reuniune a where a.B not like 'b3' and a.C not like 'c3'),
proectia as(
SELECT t1.A, t1.B, t1.C
FROM s AS t1
LEFT JOIN data AS t2
ON t1.A = t2.A AND t1.B = t2.B AND t1.C = t2.C
WHERE t2.A IS NULL)
select * from select1 a, proectia b
where a.A = b.A and a.B=b.B and a.C=b.C


