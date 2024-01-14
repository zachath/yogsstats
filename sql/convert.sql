-- pg_dump -h localhost -U postgres -t <TABLE> ttt | psql -h localhost -U postgres -d ttt2

-- insert into <table>(col) select <col> from <table2>;

-- players: 
insert into players(name) select name from player;

-- teams: 
insert into teams(team) select team from team;
update teams set can_win = false where team = 'none';

-- roles: 
insert into role values ('lover', true, false);
insert into roles(role, is_detective) select role, detective_role from role;
update roles set is_detective = true where role = 'detective';
update roles set is_detective = true where role = 'paladin';
update roles set is_detective = true where role = 'medium';
update roles set is_detective = true where role = 'tracker';
update roles set is_detective = true where role = 'santa';
update roles set is_detective = true where role = 'marshal';
update roles set is_detective = true where role = 'randoman';

-- roles_by_teams:
insert into roles_by_teams values ('innocent', 'innocents');
insert into roles_by_teams values ('traitor', 'traitors');
insert into roles_by_teams values ('jester', 'jester');
insert into roles_by_teams values ('impersonator', 'traitors');
insert into roles_by_teams values ('informant', 'traitors');
insert into roles_by_teams values ('clown', 'clown');
insert into roles_by_teams values ('hypnotist', 'traitors');
insert into roles_by_teams values ('veteran', 'innocents');
insert into roles_by_teams values ('beggar', 'none');
insert into roles_by_teams values ('beggar', 'traitors');
insert into roles_by_teams values ('beggar', 'innocents');
insert into roles_by_teams values ('zombie', 'zombies');
insert into roles_by_teams values ('turncoat', 'innocents');
insert into roles_by_teams values ('turncoat', 'traitors');
insert into roles_by_teams values ('mad scientist', 'zombies');
insert into roles_by_teams values ('summoner', 'traitors');
insert into roles_by_teams values ('parasite', 'traitors');
insert into roles_by_teams values ('deputy', 'innocents');
insert into roles_by_teams values ('glitch', 'innocents');
insert into roles_by_teams values ('paramedic', 'innocents');
insert into roles_by_teams values ('elf', 'elves');
insert into roles_by_teams values ('communist', 'communists');
insert into roles_by_teams values ('cupid', 'lovers');
insert into roles_by_teams values ('taxidermist', 'traitors');
insert into roles_by_teams values ('boxer', 'none');
insert into roles_by_teams values ('drunk', 'none');
insert into roles_by_teams values ('loot goblin', 'none');
insert into roles_by_teams values ('swapper', 'none');
insert into roles_by_teams values ('shadow', 'none');
insert into roles_by_teams values ('clowntective', 'clown');
insert into roles_by_teams values ('queen bee', 'bees');
insert into roles_by_teams values ('bee', 'bees');
insert into roles_by_teams values ('mud scientist', 'none');
insert into roles_by_teams values ('detective', 'innocents');
insert into roles_by_teams values ('paladin', 'innocents');
insert into roles_by_teams values ('medium', 'innocents');
insert into roles_by_teams values ('tracker', 'innocents');
insert into roles_by_teams values ('santa', 'innocents');
insert into roles_by_teams values ('marshal', 'innocents');
insert into roles_by_teams values ('randoman', 'innocents');
insert into roles_by_teams values ('lover', 'lovers');
insert into roles_by_teams values ('hive mind', 'hive mind');
insert into roles_by_teams values ('vindicator', 'none');
insert into roles_by_teams values ('vindicator', 'innocents');
insert into roles_by_teams values ('guesser', 'none');
insert into roles_by_teams values ('spy', 'traitors');

-- videos:
alter table video add column i_d bool default true;
update video set i_d = false where intro_death = 'not_tracked';
update video set i_d = false where intro_death = 'no';
insert into videos(video_id, title, intro_death, date) select vid, title, i_d, date from video;

-- rounds:
update round set winning_team = 'innocents' where winning_team = 'innocent';
update round set jester_killer = null where jester_killer = '';
insert into rounds(id, winning_team, video, round_start, round_end, jester_killer) select id, winning_team, video, vid_start, vid_end, jester_killer from round;

-- partici:
update round_participation set team = 'none' where id = 202211010 and player = 'Boba';
update round_participation set team = 'none' where role = 'loot goblin';
update round_participation set team = 'jester' where role = 'jester';
update round_participation set role = 'traitor' where id = 202301030 and player = 'Kirsty';
update round_participation set role = 'lover' where team = 'lovers' and role <> 'cupid';
update round_participation set team = 'traitors' where id = 202305200 and player = 'Zylus';
update round_participation set team = 'traitors' where role = 'informant';
update round_participation set team = 'none' where role = 'shadow';
update round_participation set team = 'clown' where role = 'clown';
update round_participation set team = 'traitors' where role = 'impersonator';
alter table round_participation add column died_bool bool default false;
update round_participation set died_bool = true where died = 'yes';
insert into round_participations(id, player, role, team, died) select id, player, role, team, died_bool from round_participation;
