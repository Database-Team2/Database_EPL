-- foul_of λ°? goal_of by Cho Minhyun

-- ? ?μΉ΄λλ₯? λ°κ±°? κ²½κ³  ?? ?Όλ‘? ?΄?₯? ?Ή? ? ? κ²??
-- SELECT player_id, sent_off FROM foul_of WHERE (sent_off = 1);

-- κ²½κ³ λ₯? κ°??₯ λ§μ΄ λ°μ?? ??? κ²??(GROUP BY, ORDER BY ?¬?©)
-- SELECT club_id, count(*) FROM foul_of GROUP BY club_id ORDER BY count(*) DESC;

-- κ³¨μ κ°??₯ λ§μ΄ ?£??? ??? κ²??(GROUP BY, ORDER BY ?¬?©) -> ??΄κ³¨λ‘ ?Έ?΄ ?¬?© λΆκ???₯
-- SELECT club_id, count(*) FROM goal_of GROUP BY club_id ORDER BY count(*) DESC;

-- ??΄κ³¨μ ?£??? ? ? κ²??
-- SELECT player_id, count(*) FROM GOAL_OF WHERE goal_time LIKE '%(OG)%' GROUP BY goal_time ORDER BY count(*) DESC; 

-- κ³¨μ΄ κ°??₯ λ§μ΄ ?€?΄κ°? ?κ°? κ²??
-- SELECT SUBSTRING(goal_time,1,2), count(*) FROM goal_of GROUP BY goal_time ORDER BY count(*) desc;


-- goal_of ? goal_time?? λͺ¨λ κ°μ ???€(count(*)) -μ‘°κ±΄- goal_time?? 90+%(90+λ‘? ???? λͺ¨λ  κ°?)?΄? 45+%(45+λ‘? ???? λͺ¨λ  κ°?)?΄?Όλ©? κ·Έλ£Ή?Όλ‘? λ¬Άμ΄ ? ? ¬??¬ μΆλ ₯??€.

-- κ³¨μ΄ κ°??₯ λ§μ΄ ?€?΄κ°? ? , ?λ°? μΆκ???κ°? κ²??(GROUP BY, ORDER BY ?¬?©)
-- SELECT goal_time, count(*) FROM goal_of WHERE goal_time LIKE'90+%' OR goal_time LIKE'45+%'GROUP BY goal_time ORDER BY count(*) DESC;

-- ? ?μΉ΄λ? κ²½κ³ ??  ?΄?₯? λ°μ?? ???? ? ?μ€? ?λ‘? μΉ΄λλ₯? 3λ²? ?΄? μ΄κ³Ό?  κ²½μ°(GROUP BY, ORDER BY, HAVING ?¬?©)
-- SELECT player_id, count(*) FROM foul_of WHERE (sent_off = 0) GROUP BY player_id  HAVING count(*) > 3 ORDER BY count(*) DESC;

-- End of retrieval