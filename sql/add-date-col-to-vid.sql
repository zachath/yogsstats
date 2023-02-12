alter table video add date date;
update video as V set date = R.date from round as R where V.vid = R.video;