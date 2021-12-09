-- foul_of 및 goal_of by Cho Minhyun

-- 레드카드를 받거나 경고 누적으로 퇴장을 당한 선수 검색
SELECT player_id, sent_off FROM foul_of WHERE (sent_off = 1);

-- 경고를 가장 많이 받은 팀 검색(GROUP BY, ORDER BY 사용)
SELECT club_id, count(*) FROM foul_of GROUP BY club_id ORDER BY count(*) DESC;

-- 골을 가장 많이 넣은 팀 검색(GROUP BY, ORDER BY 사용)
SELECT club_id, count(*) FROM goal_of GROUP BY club_id ORDER BY count(*) DESC;

-- 골이 가장 많이 들어간 시간 검색
SELECT SUBSTRING(goal_time,1,2), count(*) FROM goal_of GROUP BY goal_time ORDER BY count(*) desc;

-- 골이 가장 많이 들어간 전, 후반 추가시간 검색(GROUP BY, ORDER BY 사용)
-- goal_of 속 goal_time에서 모든값을 더한다(count(*)) -조건- goal_time에서 90+%(90+로 시작하는 모든 값)이나 45+%(45+로 시작하는 모든 값)이라면 그룹으로 묶어 정렬하여 출력한다.
SELECT goal_time, count(*) FROM goal_of WHERE goal_time LIKE'90+%' OR goal_time LIKE'45+%'GROUP BY goal_time ORDER BY count(*) DESC;

-- 골을 가장 많이 넣은 팀 검색(GROUP BY, ORDER BY 사용)
SELECT club_id, count(*) FROM goal_of GROUP BY club_id order by count(*) DESC;

-- End of retrieval