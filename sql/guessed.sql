alter table rounds add guessed text;

ALTER TABLE ONLY rounds ADD CONSTRAINT rounds_guessed_fkey FOREIGN KEY (guessed) REFERENCES players(name);

update rounds set guessed = 'Zylus' where id = 202401060;
update rounds set guessed = 'Zylus' where id = 202401090;
update rounds set guessed = 'Briony' where id = 202401092;
update rounds set guessed = 'Zylus' where id = 202401093;
update rounds set guessed = 'Zylus' where id = 202401094;