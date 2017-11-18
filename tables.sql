create schema News;

USE News;

create table Article(
	id char(4) primary key, 
	title varchar(200), 
	dateOnline date, 
	category varchar(30));

create table Author(
	emp_id char(4) primary key, 
	lastname varchar(30), 
	firstname varchar(30));

create table PhotoAuthor(
	emp_id char(4) primary key, 
	firstname varchar(30), 
	astname varchar(30));

create table Photo(
	id char(4) primary key, 
	name_of_uploader varchar(30), 
	dateOnline date, emp_id char(4),
	constraint fk_photo_author foreign key (emp_id) references News.PhotoAuthor(emp_id));

create table Subscriber(
	id char(4) primary key, 
	lastname varchar(30), firstname varchar(30), 
	account_number char(16));

create table Commenter(
	id char(4) primary key, 
	screen_name varchar(30), 
	likes int, 
	constraint subscriber_id foreign key (id) references News.Subscriber(id));

create table Comment(
	id char(4) primary key, 
	likes int, 
	omment_time datetime, 
	constraint commenter_id foreign key (id) references Commenter(id), 
	constraint article_id foreign key (id) references Article(id));

#not working needs fix

create table Article_photos(
	article_id char(4) not null, 
	photo_id char(4) not null, 
	constraint fk_article_id foreign key (article_id) references News.Article(id), 
	constraint fk_photo_id foreign key (photo_id) references News.Photo(id));

create table Article_author(
	article_id2 char(4) not null, 
	author_id2 char(4) not null, 
	constraint fk_article_id2 foreign key (article_id2) references News.Article(id), 
	constraint fk_emp_id2 foreign key (author_id2) references News.Author(emp_id));

create table Article_subscriber(
	article_id3 char(4) not null, 
	subscriber_id2 char(4) not null, 
	constraint fk_article_id3 foreign key (article_id3) references News.Article(id), 
	constraint fk_subscriber_id2 foreign key (subscriber_id2) references News.Subscriber(id));