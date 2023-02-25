-- 행 > 열 전환을 통해 output의 결과물의 가독성을 높이고자함

SELECT
  dt
  , MAX(CASE WHEN indicator = 'impressions' THEN val END) AS impression
  , MAX(CASE WHEN indicator = 'sessions' THEN val END) AS sessions
  , MAX(CASE WHEN indicator = 'users' THEN val END) AS users
FROM daily_kpi
GROUP BY dt
ORDER BY dt


-- 열의 수를 모르는 경우

SELECT
  purchase_id
  , concat_ws(',', collect_list(product_id)) AS product_ids
  , SUM(price) AS amount
FROM purchase_detail_log
GROUP BY purchase_id
ORDER BY purchase_id
