-- loadInitData.sql a script to load initial data
-- make sure addAuthenticationFuncs.sql is run before this
-- make sure addInsertFuncs.sql is run before this

-- add Initial Users
insert into users_view (name,username,password,department,division)
  values ('Roy Tanaka','royt','royt','Head','Head');
insert into users_view (name,username,password,department,division)
  values ('John Doe','john','john','1','1');
insert into users_view (name,username,password,department,division)
  values ('Jane Doe','jane','jane','1','2');
insert into users_view (name,username,password,department,division)
  values ('Bill Gates','bill','bill','2','1');
insert into users_view (name,username,password,department,division)
  values ('Jack Doe','jack','jack','2','2');
insert into users_view (name,username,password,department,division)
  values ('Sarah Parker','sarah','sarah','3','3');
  
-- add Initial user posts
insert into posts (userid,suggestion,created_at,updated_at)
  values (1,'This project is really hard.',now(),now());
insert into posts (userid,suggestion,created_at,update_at)
  values (2,'What were we suppose to do again?',now(),now());
insert into posts (userid,suggestion,created_at,updated_at)
  values (3,'I am so confused.',now(),now());
insert into posts (userid,suggestion,created_at,updated_at)
  values (4,'Yeah! I am going to finish this first!',now(),now());
insert into posts (userid,suggestion,created_at,updated_at)
  values (5,'Hahahaha',now(),now());
