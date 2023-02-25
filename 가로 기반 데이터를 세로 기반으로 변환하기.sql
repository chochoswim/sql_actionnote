-- 행으로 전개되는 데이터 수가 고정되어 있음
-- 피벗테이블을 결합하고, CASE 식으로 레이블 이름과 매출 값을 추출해서 열을 행으로 변환
SELECT 
    q.year
  , CASE 
      WHEN p.idx = 1 THEN 'q1'
  ,   WHEN p.idx = 2 THEN 'q2'
  ,   WHEN p.idx = 3 THEN 'q3'
  ,   WHEN p.idx = 4 THEN 'q4'
    END AS quarter
  , CASE 
      WHEN p.idx = 1 THEN q.q1
      WHEN p.idx = 2 THEN q.q2
      WHEN p.idx = 3 THEN q.q3
      WHEN p.idx = 4 THEN q.q4
     END AS sales
FROM 
  quarterly_sakes AS q
 CROSS JOIN
  (          SELECT 1 AS idx
   UNION ALL SELECT 2 AS idx
   UNION ALL SELECT 3 AS idx
   UNION ALL SELECT 4 AS idx
   ) AS p
  
