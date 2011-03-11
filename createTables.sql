-- createTables.sql First to Run

-- create squences
drop sequence if exists user_id_seq cascade;
create sequence user_id_seq;
drop sequence if exists post_id_seq cascade;
create sequence post_id_seq;

-- create tables
drop table if exists users cascade;
create table users(
	id integer not null primary key default nextval('user_id_seq'),
	name text,
	username text unique,
	password text,
	enc_pass text,
	department text,
	division text,
	salt text
);
drop table if exists posts cascade;
create table posts(
	id integer not null primary key default nextval('post_id_seq'),
	userid integer references users(id),
	suggestion text,
	created_at timestamp,
	updated_at timestamp
);

-- create view
drop view if exists user_post_view cascade;
create view user_post_view as
	select users.id as userid,posts.id as postid,users.name,users.department,users.division,
	posts.suggestion,posts.created_at,posts.updated_at
	from users join posts on users.id=posts.userid;
