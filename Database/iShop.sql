use  ishop;
create table person(
	person_id int not null auto_increment,
    person_name varchar(64) not null,
    person_lastName varchar(64) not null,
    person_email varchar(64) not null unique key,
    person_password varchar(64) not null,
    person_id_number varchar(11) not null unique key,
    person_birth_date date not null,
    person_tel varchar(64) not null,
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
    category_name varchar(64) not null unique key,
    constraint shop_category_pk primary key(category_id)

);
create table shop(
	shop_id int not null auto_increment,
    shop_name varchar(100) not null,
    shop_email varchar(64) not null unique key,
    shop_password varchar(64) not null,
    shop_site varchar (64) not null,
    shop_category int not null,
    shop_tel varchar(64) not null,
    shop_info text,
    constraint shop_pk primary key(shop_id),
    constraint shop_category_fk foreign key (shop_category) references shop_category(category_id)


);

create table item_category(
	item_category_id int not null auto_increment,
    item_category_name varchar(64) not null unique key,
    constraint item_category_id_pk  primary key(item_category_id)
    

);
create table item_sub_category(
	item_sub_category int not null auto_increment,
	item_sub_name varchar(64) not null,
    item_category_id int not null,
    constraint item_sub_category_pk primary key(item_sub_category),
    constraint item_sub_category_fk foreign key(item_category_id) references item_category(item_category_id)

);

create table item_type(
	item_type int not null auto_increment,
	item_type_name varchar(64) not null,
    item_sub_category_id int not null,
    constraint item_type_pk primary key(item_type),
    constraint item_type_fk foreign key(item_sub_category_id) references item_sub_category(item_sub_category)

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
    item_brand int not null,
    item_description text,
    item_price int not null,
    item_quantity int not null,
    shop_id int not null,
    constraint item_id_pk primary key(item_id),
    constraint item_brand_fk foreign key(item_brand) references item_brand (item_brand),
    constraint item_type_fk1 foreign key(item_type) references item_type(item_type),
    constraint item_shop_id_fk1 foreign key(shop_id) references shop(shop_id)
);
create table item_photoes(
	item_photo_id int not null auto_increment,
    item_id int not null,
    item_photo mediumblob not null,
    constraint item_photo_id primary key(item_photo_id),
    constraint item_id_fk foreign key (item_id) references item(item_id)

);
create table shop_photoes(
	shop_photo_id int not null auto_increment,
    shop_id int not null,
    shop_photo mediumblob not null,
    constraint ishop_photo_id primary key(shop_photo_id),
    constraint shop_id_fk foreign key (shop_id) references shop(shop_id)

);

create table recommended_item(
	item_id int not null,
    person_id int not null,
    searched_number int not null,
    constraint item_id_fk1 foreign key(item_id) references item(item_id),
    constraint person_id_fk1 foreign key(person_id) references person(person_id)

);
create table favourite_shops(
	person_id int not null,
    shop_id int not null,
     constraint shop_id_fk2 foreign key(shop_id) references shop(shop_id),
    constraint person_id_fk3 foreign key(person_id) references person(person_id) 

);
create table person_cart_items(
	person_id int not null,
    item_id int not null,
    item_quantity int not null,
    is_bought int not null,
    constraint person_cart_items_fk1 foreign key(person_id) references person(person_id),
    constraint person_cart_items_fk2 foreign key(item_id) references item(item_id)
);




USE iShop;
INSERT INTO person (person_name,person_lastName,person_email,person_password,person_id_number,person_birth_date,person_tel,person_sex) 
 values ("nika","nikadze","nika@gmail.com","123","123123",01/02/1994,"593200083","MALE"),
 ("badri","","badridze@gmail.com","123","123124",01/02/1994,"593200083","MALE"),
  ("nugo","","nugodze@gmail.com","123","123125",01/02/1994,"593200083","MALE"),
  ("salo","","salodze@gmail.com","123","123126",01/02/1994,"593200083","MALE"),
 ("nini","","ninidze@gmail.com","123","123127",01/02/1994,"593200083","MALE")
 ;
 use ishop;
 INSERT INTO item_brand(item_brand_name)
 values ("audio");
 INSERT INTO item_category( item_category_name)
 values ("cate name");
  INSERT INTO item_sub_category(item_sub_name,item_category_id)
 values ("dubcate",1);
 INSERT INTO item_type (item_type_name,item_sub_Category_id)
 values("sdsd",1);

 
 
	INSERT INTO shop_category(category_name)
    values ("pirveli");
 INSERT INTO shop (shop_name,shop_email,shop_password,shop_site,shop_category,shop_tel,shop_info)
 values ("Tbilisi Shop","tbilisi@gmail.com","123","tbilisi.ge",1,"4533","tbilisi biggest shop");
 INSERT INTO item (item_name,item_type,item_brand,item_description,item_price,item_quantity,shop_id)
 values("Headphone",1,1,"Best HeadPhone",100,1,1);
 INSERT INTO person_cart_items(person_id,item_id,item_quantity,is_bought)
 values (1,1,1,0);

