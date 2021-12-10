-- create_TABLE 모두 총합

-- 스타디움 테이블 생성
CREATE TABLE STADIUM (
	Stadium_id INT UNSIGNED PRIMARY KEY,
	Stadium_name VARCHAR(45),
	Capacity VARCHAR(45)
);

-- 클럽_인포 테이블 생성
CREATE TABLE CLUB_INFO(
	Club_id INT UNSIGNED PRIMARY KEY,
	Club_name VARCHAR(30),
	Stadium INT UNSIGNED NOT NULL,
	badge_images_url VARCHAR(100),
	club_url VARCHAR(100),
	FOREIGN KEY(Stadium) REFERENCES STADIUM(Stadium_id) ON DELETE CASCADE
);

-- 선수 테이블 생성
CREATE TABLE PLAYER(
	Player_id INT UNSIGNED PRIMARY KEY,
	Club_id INT UNSIGNED NOT NULL,
	Player_name VARCHAR(45),
	Uniform_num INT,
	Date_of_birth VARCHAR(45),
	position VARCHAR(45),
	FOREIGN KEY(Club_id) REFERENCES CLUB_INFO(Club_id) ON DELETE CASCADE
);

-- 경기 결과 테이블 생성
CREATE TABLE MATCH_INFO
(
	match_id INT UNSIGNED primary key,
    match_date char(8),
    home_club_id INT UNSIGNED,
    away_club_id INT UNSIGNED,
    foreign key (home_club_id) references CLUB_INFO(Club_id) ON DELETE CASCADE,
    foreign key (away_club_id) references CLUB_INFO(Club_id) ON DELETE CASCADE
);

-- UPDATE new_schema.MATCH_INFO
-- SET match_date = null
-- WHERE match_date = "";

CREATE TABLE MATCH_DETAIL(
	Match_id INT UNSIGNED NOT NULL PRIMARY KEY,
	Home_score INT NOT NULL,
	Away_score INT NOT NULL,
	King_of_the_match CHAR(45) NOT NULL
  );

CREATE TABLE MATCH_WIN(
	Match_id INT NOT NULL,
	Winner_club_id INT NOT NULL
);

-- 클럽 결과 테이블 생성
CREATE TABLE CLUB_RESULT(
	Club_id INT UNSIGNED PRIMARY KEY,
	position INT UNSIGNED,
	played INT UNSIGNED,
	won INT UNSIGNED,
	draw INT UNSIGNED,
	lost INT UNSIGNED,
	gf INT UNSIGNED,
	ga INT UNSIGNED,
	form VARCHAR(5),
	FOREIGN KEY(Club_id) REFERENCES CLUB_INFO(Club_id) ON DELETE CASCADE
);

CREATE TABLE GOAL_OF(
	match_id INT UNSIGNED NOT NULL, -- USING UNSIGNED INT, SET FOREIGN KEY
    club_id INT UNSIGNED NOT NULL, -- USING UNSIGNED TINT, SET FOREIGN KEY
    player_id INT UNSIGNED NOT NULL, -- USING UNSIGNED INT
    goal_id INT UNSIGNED PRIMARY KEY, -- USING UNSIGNED INT, SET PK
    goal_time CHAR(10), -- USING UNSIGNED CHAR
    FOREIGN KEY(match_id) REFERENCES MATCH_DETAIL(Match_id), -- USING MATCH_INFO.match_id FOR FOREIGN KEY
    FOREIGN KEY(player_id) REFERENCES PLAYER(player_id) ON DELETE CASCADE, -- USING PLAYER.player_id FOR FOREIGN KEY
    FOREIGN KEY(club_id) REFERENCES CLUB_INFO(club_id) ON DELETE CASCADE -- USING CLUB_INFO.club_id FOR FOREIGN KEY
);

CREATE TABLE FOUL_OF(
	match_id INT UNSIGNED NOT NULL, -- USING UNSIGNED INT, SET FOREIGN KEY
    club_id INT UNSIGNED NOT NULL, -- USING UNSIGNED INT, SET FOREIGN KEY
    player_id INT UNSIGNED NOT NULL, -- USING UNSIGNED INT
    foul_time CHAR(10) NOT NULL, -- USING UNSIGNED CHAR
    sent_off BOOLEAN NOT NULL, -- USING BOOLEAN
    FOREIGN KEY(match_id) REFERENCES MATCH_DETAIL(Match_id), -- USING MATCH_INFO.match_id FOR FOREIGN KEY
    FOREIGN KEY(player_id) REFERENCES PLAYER(player_id) ON DELETE CASCADE, -- USING PLAYER.player_id FOR FOREIGN KEY
    FOREIGN KEY(club_id) REFERENCES CLUB_INFO(club_id) ON DELETE CASCADE -- USING CLUB_INFO.club_id FOR FOREIGN KEY
);

create table match_lineups(
    match_id INT UNSIGNED NOT NULL,
    home_team_id INT UNSIGNED NOT NULL,
    away_team_id INT UNSIGNED NOT NULL,
    home_lineups INT UNSIGNED NOT NULL,
    away_lineups INT UNSIGNED NOT NULL,
	foreign key(match_id) references MATCH_INFO(match_id)
);

create table match_sub(
	match_id INT UNSIGNED NOT NULL,
    home_team_id INT UNSIGNED NOT NULL,
    away_team_id INT UNSIGNED NOT NULL,
    home_sub INT UNSIGNED NOT NULL,
    away_sub INT UNSIGNED NOT NULL,
	foreign key(match_id) references MATCH_INFO(match_id)
);

create table in_out(
    match_id INT UNSIGNED NOT NULL,
    in_out varchar(20),
    time varchar(10),
    player_id INT UNSIGNED NOT NULL,
    club_id INT UNSIGNED NOT NULL,
    foreign key(match_id) references MATCH_INFO(match_id)
)