drop table if exists users;
create table users (
  id integer primary key,
  name text,
  password text
);

-- あとでデータ型をtext→stringに変更する

insert into users (name, password) values ('name1', 'password1');
insert into users (name, password) values ('name2', 'password2');
insert into users (name, password) values ('name3', 'password3');
insert into users (name, password) values ('name4', 'password4');



drop table if exists posts;
create table posts (
  id integer primary key,
  user_id integer,
  category_id integer,
  title text,
  body text,
  created_at datetime,
  updated_at datetime
);

insert into posts (user_id, category_id, title, body, created_at, updated_at) values ('1', '1', 'タイトル1', '投稿1', '2023.06.01', '2024.06.01');
insert into posts (user_id, category_id, title, body, created_at, updated_at) values ('1', '2', 'タイトル2', '投稿2', '2023.06.01', '2024.06.01');
insert into posts (user_id, category_id, title, body, created_at, updated_at) values ('2', '1', 'タイトル3', '投稿3', '2023.06.01', '2024.06.01');
insert into posts (user_id, category_id, title, body, created_at, updated_at) values ('2', '2', 'タイトル4', '投稿4', '2023.06.01', '2024.06.01');


insert into likes (user_id, post_id) values ('1', '3');
insert into likes (user_id, post_id) values ('2', '1');
insert into likes (user_id, post_id) values ('2', '2');


insert into categories (category_name) values ('study');
insert into categories (category_name) values ('housework');
