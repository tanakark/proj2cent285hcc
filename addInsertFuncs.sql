-- addInsertFuncs.sql - this script will make it easier to add Authors and Books
-- make sure that createTables.sql is run before this

-- create plpgsql language
drop language if exists plpgsql cascade;
create language plpgsql;

-- create function for adding Book and returning id
create or replace function insertPost(_name text, _post text)
  returns integer as
  $func$
  begin
    execute 'insert into Posts (name, post, created_on, updated_on) values ('
      || quote_literal(_name) || ',' || quote_literal(_post) || ',' ||
      quote_literal(now()) || ',' || quote_literal(now()) || ')';
    return currval('post_id_seq');
  end;
  $func$
  language 'plpgsql';
