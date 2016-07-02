drop database ishop;
create database ishop;
use  ishop;
create table person(
	person_id int not null auto_increment,
    person_name varchar(64) not null,
    person_lastName varchar(64) not null,
    person_email varchar(64) not null unique key,
    person_password varchar(64) not null,
    person_id_number varchar(11) not null unique key,
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
    shop_tel varchar(64) not null,
    shop_info text,
    constraint shop_pk primary key(shop_id)
  


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




create table item(
	item_id int not null auto_increment,
    item_name varchar(64) not null,
    item_sub_category int not null,
    item_description text,
    item_price int not null,
    item_quantity int not null,
    shop_id int not null,
    constraint item_id_pk primary key(item_id),
    constraint item_sube_fk1 foreign key(item_sub_category) references item_sub_category(item_sub_category),
    constraint item_shop_id_fk1 foreign key(shop_id) references shop(shop_id)
);

create table item_review(
	review_id int not null auto_increment,
    item_id int not null,
    description text,
    person_name varchar(64) not null,
    constraint review_pk primary key(review_id),
    constraint item_review_fk foreign key(item_id) references item(item_id)
    

);
create table item_photoes(
	item_photo_id int not null auto_increment,
    item_id int not null,
    item_photo mediumblob not null,
    constraint item_photo_id primary key(item_photo_id),
    constraint item_id_fk foreign key (item_id) references item(item_id)

);
create table item_profile_picture(
	item_profile_photo_id int not null auto_increment,
	item_id int not null,
    item_photo mediumblob not null,
	constraint item_photo_profile_id primary key(item_profile_photo_id),
    constraint item_id_fk4 foreign key (item_id) references item(item_id)
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
INSERT INTO person (person_name,person_lastName,person_email,person_password,person_id_number,person_tel,person_sex) 
 values ("nika","nikadze","nika@gmail.com","123","123123","593200083","MALE"),
 ("badri","","badridze@gmail.com","123","123124","593200083","MALE"),
  ("nugo","","nugodze@gmail.com","123","123125","593200083","MALE"),
  ("salo","","salodze@gmail.com","123","123126","593200083","MALE"),
 ("nini","","ninidze@gmail.com","123","123127","593200083","MALE")
 ;

 INSERT INTO item_category( item_category_name)
 values ("კომპიუტერები & აქსესუარები"),
 ("საოჯახო ტექნიკა"),
 ("სპორტი & ტურიზმი"),
 ("ტანსაცმელი & აქსესუარები"),
 ("აუდიო & ვიდეო – ტექნიკა") ,
 ("მუსიკალური ინსტრუმენტები"),
 ("ავეჯი & ინტერიერი") ,
 ("მობილური ტელეფონები");
 
  INSERT INTO item_sub_category(item_sub_name,item_category_id)
 values ("Desktop კომპიუტერები",1),
 ("Laptop კომპიუტერები",1),
 ("Laptop-ის ჩანთები",1),
 ("კლავიატურები",1),
 ("კომპიუტერის ნაწილები",1),
 ("მაუსები",1),
 ("კომპიუტერის დინამიკები",1),
 ("მაცივრები",2),
 ("მტვერსასრუტები",2),
 ("კონდეციონერები",2),
 ("სარეცხი მანქანები",2),
 ("უთოები",2),
 ("ფენები",2),
 ("ალპინიზმი",3),
 ("სამოგზაურო ჩანთები",3);
 use ishop;
 INSERT INTO item_sub_category(item_sub_name,item_category_id)
 values ("აქსესუარები",4),
 ("ბიჭის ტანსაცმელი",4),
 ("გოგოს ტანსაცმელი",4),
 ("კაცის ტანსაცმელი",4),
 ("ქალის ტანსაცმელი",4),
 ("ფეხსაცმელები",4),
 ("ვიდეო კამერები",5),
 ("ტელევიზორები",5),
 ("დინამიკები",5),
 ("ყურსასმენები",5),
 ("MP3 ფლეიერები",5),
 ("ანდროიდი",8),
 ("iPhobe",8),
 ("მობილურის აქსესუარები",8)
;
 
 
 INSERT INTO shop (shop_name,shop_email,shop_password,shop_site,shop_tel,shop_info)
 values ("Tbilisi Shop","tbilisi@gmail.com","123","tbilisi.ge","4533","tbilisi biggest shop");
 INSERT INTO shop (shop_name,shop_email,shop_password,shop_site,shop_tel,shop_info)
 values 
 ("Shoes Shop","shoes@gmail.com","123","shoes.ge","4523424","Check out our latest selection of all the must-have shoes for women this spring. From sandals to pumps and heels to fun spring boots, our assortment of women's shoes is endless. The expansive selection of women's sandals covers every silhouette, style, and fit you need. Think gladiator sandals, flip-flops, wedges and espadrilles! If you can't find the fit you need, check out our selection of women's wide width shoes and wide width sandals. Need another pair of spring or summer shoes besid
 es your go-to wedge sandals? Get a pair of stylish pumps or high heels, or maybe a pair of flats or boat shoes for everyday wear. And don't forget to grab that perfect pair of sneakers to complete that trendy athleisure look!"),
 ("Technics","technics@gmail.com","123","technics.ge","2342342","Best Technics shop in tbilisi");
 
 INSERT INTO item (item_name,item_sub_category,item_description,item_price,item_quantity,shop_id)
 values("Man's Standart Shoes",21,"Summer Mans Shoes",230,1,2),
   ("Earphones",25,"Noise isolating earphones",123,1,3);
 
 
 
 INSERT INTO item (item_name,item_sub_category,item_description,item_price,item_quantity,shop_id)
 values("Headphone",1,"Best HeadPhone",100,1,1),
   ("Laptop",1,"Best Laptop",89,1,1);
 INSERT INTO person_cart_items(person_id,item_id,item_quantity,is_bought)
values (1,1,1,0);

   INSERT INTO person_cart_items(person_id,item_id,item_quantity,is_bought)
values (1,2,3,0);
