alter table rounds add vindicator_killer text;

ALTER TABLE ONLY rounds ADD CONSTRAINT rounds_vindicator_killer_fkey FOREIGN KEY (vindicator_killer) REFERENCES players(name);

update rounds set vindicator_killer = 'Lewis' where id = 202401092;
update rounds set vindicator_killer = 'Rythian' where id = 202401094;
update rounds set vindicator_killer = 'Nilesy' where id = 202401131;