-- PLAYER TABLE FOR TESTING
CREATE TABLE PLAYER(
	player_id INT UNSIGNED PRIMARY KEY,
	player_name VARCHAR(50) NOT NULL,
    club_id INT NOT NULL,
    uniform_num INT,
    date_of_birth INT,
    position CHAR(10)
);

-- MATCH_DETIAL TABLE FOR TESTING
CREATE TABLE MATCH_DETAIL(
	match_id INT UNSIGNED PRIMARY KEY,
    club_id INT
);

-- CREATE TABLES CODE --
CREATE TABLE GOAL_OF(
	match_id INT UNSIGNED NOT NULL, -- USING UNSIGNED INT, SET FOREIGN KEY
    club_id TINYINT UNSIGNED NOT NULL, -- USING UNSIGNED TINYINT, SET FOREIGN KEY
    player_id INT UNSIGNED NOT NULL, -- USING UNSIGNED INT
    goal_id INT UNSIGNED PRIMARY KEY, -- USING UNSIGNED INT, SET PK
    goal_time INT UNSIGNED NOT NULL, -- USING UNSIGNED INT
    FOREIGN KEY(match_id) REFERENCES MATCH_DETAIL(match_id), -- USING MATCH_DETAIL.match_id FOR FOREIGN KEY
    FOREIGN KEY(player_id) REFERENCES PLAYER(player_id), -- USING PLAYER.player_id FOR FOREIGN KEY
    FOREIGN KEY(club_id) REFERENCES MATCH_DETAIL(club_id) -- USING MATCH_DETAIL.club_id FOR FOREIGN KEY
);

CREATE TABLE FAUL_OF(
	match_id INT UNSIGNED NOT NULL, -- USING UNSIGNED INT, SET FOREIGN KEY
    club_id TINYINT UNSIGNED NOT NULL, -- USING UNSIGNED TINYINT, SET FOREIGN KEY
    player_id INT UNSIGNED NOT NULL, -- USING UNSIGNED INT
    foul_time TINYINT UNSIGNED NOT NULL, -- USING UNSIGNED TINYINT
    sent_off BOOLEAN NOT NULL, -- USING BOOLEAN
    FOREIGN KEY(match_id) REFERENCES MATCH_DETAIL(match_id), -- USING MATCH_DETAIL.match_id FOR FOREIGN KEY
    FOREIGN KEY(player_id) REFERENCES PLAYER(player_id), -- USING PLAYER.player_id FOR FOREIGN KEY
    FOREIGN KEY(club_id) REFERENCES MATCH_DETAIL(club_id) -- USING MATCH_DETAIL.club_id FOR FOREIGN KEY
);
-- END OF CODE --