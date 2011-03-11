-- addInsertFuncs.sql - this script will make it easier to add Users and Posts
-- make sure that createTables.sql is run before this

-- create plpgsql language
drop language if exists plpgsql cascade;
create language plpgsql;

-- create function for adding Users and returning id
create or replace function insertUser(_name text,_username text, _department text, _division text)
  returns integer as
  $func$
  begin
    execute 'insert into users (name, username, department, division)' ||
      'values (' || quote_literal(name) || ',' || quote_literal(username) || ',' || 
      quote_literal(department) || ',' || quote_literal(division) || ')';
    return currval('user_id_seq');
  end;
  $func$
  language 'plpgsql';

-- create function for adding Suggestions and returning id
create or replace function insertPost(_userid integer, _suggestion text)
  returns integer as
  $func$
  begin
    execute 'insert into posts (userid, suggestion, created_on, updated_on)' ||
      'values (' || quote_literal(_userid) || ',' || quote_literal(_suggestion) || ',' ||
      quote_literal(now()) || ',' || quote_literal(now()) || ')';
    return currval('post_id_seq');
  end;
  $func$
  language 'plpgsql';
  
-- create rule
--create or replace rule user_post_ins as on insert to user_post_view
 -- do instead select insertUserPost(new.userid, new.suggestion);
