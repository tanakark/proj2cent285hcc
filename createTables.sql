-- createTables.sql

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
	created_on date,
	modified_on date,
	posters_name text
);
drop table if exists user_post cascade;
create table user_post(
	user_id integer references users(id),
	post_id integer references posts(id)
);

-- create view
drop view if exists user_post_view cascade;
create view user_post_view as
	select users.id as userid,posts.id as postid,posts.created_on, posts.modified_on
	from users join user_post on users.id=user_post.user_id join posts on user_post.post_id=posts.id;
	
	
