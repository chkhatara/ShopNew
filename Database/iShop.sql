use  ishop;

create table person(
	person_id int not null auto_increment,
    person_name varchar(64) not null,
    person_lastName varchar(64) not null,
    person_email varchar(64) not null unique key,
    person_password varchar(64) not null,
    person_id_number varchar(11) not null unique key,
    person_birth_date date not null,
    person_sex enum('MALE','FEMALE'),
    constraint person_pk primary key(person_id)
);
create table card_info(
	card_id int not null auto_increment,
    card_userName varchar(64) not null,
    card_expirationDate date not null,
    card_number varchar(20) not null unique key,
    card_cvv varchar(3) not null,
    person_id int not null,
    constraint card_info_pk primary key(card_id),
    constraint person_id_fk foreign key(person_id) references person(person_id)
);
create table shop_category(
	category_id int not null auto_increment,
    category_name varchar(64) not null,
    constraint shop_category_pk primary key(category_id)

);
create table shop(
	shop_id int not null auto_increment,
    shop_name varchar(100) not null,
    shop_email varchar(64) not null unique key,
    shop_password varchar(64) not null,
    shop_site varchar (64) not null,
    shop_category int not null,
    shop_info text,
    constraint shop_pk primary key(shop_id),
    constraint shop_category_fk foreign key (shop_category) references shop_category(category_id)


);

create table item_category(
	item_category_id int not null auto_increment,
    item_category_name varchar(64) not null unique key,
    constraint item_category_id_pk  primary key(item_category_id)
    

);

create table item_type(
	item_type int not null auto_increment,
	item_type_name varchar(64) not null,
    item_category_id int not null,
    constraint item_type_pk primary key(item_type),
    constraint item_type_fk foreign key(item_category_id) references item_category(item_category_id)

);

create table item_brand(
	item_brand int not null auto_increment,
    item_brand_name varchar(64) not null unique key,
    constraint item_brand_pk primary key(item_brand)

);

create table item(
	item_id int not null auto_increment,
    item_name varchar(64) not null,
    item_type int not null,
    item_description text,
    shop_id int not null,
    constraint item_id_pk primary key(item_id),
    constraint item_type_fk foreign key(item_type) references item_type(item_type_id),
    constraint item_shop_id_fk foreign key(shop_id) references shop_id(shop_id)
);

