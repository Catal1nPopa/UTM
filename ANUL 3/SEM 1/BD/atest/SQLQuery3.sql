WITH r AS (
  SELECT 3 AS A, 3 AS B
  UNION ALL
  SELECT 4, 6
  UNION ALL
  SELECT 3, 2
  UNION ALL
  SELECT 5, 3
  UNION ALL
  SELECT 6, 3
),
s AS (
  SELECT 4 AS B, 5 AS C, 1 AS D
  UNION ALL
  SELECT 3,5,3
  UNION ALL
  SELECT 6,1,3
)
select * from r a, s b
where  a.b = b.B 