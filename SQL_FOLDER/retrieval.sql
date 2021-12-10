-- foul_of ë°? goal_of by Cho Minhyun

-- ? ˆ?“œì¹´ë“œë¥? ë°›ê±°?‚˜ ê²½ê³  ?ˆ„? ?œ¼ë¡? ?‡´?ž¥?„ ?‹¹?•œ ?„ ?ˆ˜ ê²??ƒ‰
-- SELECT player_id, sent_off FROM foul_of WHERE (sent_off = 1);

-- ê²½ê³ ë¥? ê°??ž¥ ë§Žì´ ë°›ì?? ??? ê²??ƒ‰(GROUP BY, ORDER BY ?‚¬?š©)
-- SELECT club_id, count(*) FROM foul_of GROUP BY club_id ORDER BY count(*) DESC;

-- ê³¨ì„ ê°??ž¥ ë§Žì´ ?„£??? ??? ê²??ƒ‰(GROUP BY, ORDER BY ?‚¬?š©) -> ?ž?‚´ê³¨ë¡œ ?¸?•´ ?‚¬?š© ë¶ˆê???Š¥
-- SELECT club_id, count(*) FROM goal_of GROUP BY club_id ORDER BY count(*) DESC;

-- ?ž?‚´ê³¨ì„ ?„£??? ?„ ?ˆ˜ ê²??ƒ‰
-- SELECT player_id, count(*) FROM GOAL_OF WHERE goal_time LIKE '%(OG)%' GROUP BY goal_time ORDER BY count(*) DESC; 

-- ê³¨ì´ ê°??ž¥ ë§Žì´ ?“¤?–´ê°? ?‹œê°? ê²??ƒ‰
-- SELECT SUBSTRING(goal_time,1,2), count(*) FROM goal_of GROUP BY goal_time ORDER BY count(*) desc;


-- goal_of ?† goal_time?—?„œ ëª¨ë“ ê°’ì„ ?”?•œ?‹¤(count(*)) -ì¡°ê±´- goal_time?—?„œ 90+%(90+ë¡? ?‹œ?ž‘?•˜?Š” ëª¨ë“  ê°?)?´?‚˜ 45+%(45+ë¡? ?‹œ?ž‘?•˜?Š” ëª¨ë“  ê°?)?´?¼ë©? ê·¸ë£¹?œ¼ë¡? ë¬¶ì–´ ? •? ¬?•˜?—¬ ì¶œë ¥?•œ?‹¤.

-- ê³¨ì´ ê°??ž¥ ë§Žì´ ?“¤?–´ê°? ? „, ?›„ë°? ì¶”ê???‹œê°? ê²??ƒ‰(GROUP BY, ORDER BY ?‚¬?š©)
-- SELECT goal_time, count(*) FROM goal_of WHERE goal_time LIKE'90+%' OR goal_time LIKE'45+%'GROUP BY goal_time ORDER BY count(*) DESC;

-- ? ˆ?“œì¹´ë“œ?‚˜ ê²½ê³ ?ˆ„?  ?‡´?ž¥?„ ë°›ì?? ?•Š??? ?„ ?ˆ˜ì¤? ?˜ë¡? ì¹´ë“œë¥? 3ë²? ?´?ƒ ì´ˆê³¼?•  ê²½ìš°(GROUP BY, ORDER BY, HAVING ?‚¬?š©)
-- SELECT player_id, count(*) FROM foul_of WHERE (sent_off = 0) GROUP BY player_id  HAVING count(*) > 3 ORDER BY count(*) DESC;

-- End of retrieval