
CREATE TABLE member (
  id VARCHAR(20) NOT NULL,/*1*/
  pw VARCHAR(30) NOT NULL,/*2*/
  name VARCHAR(10) NOT NULL,/*3*/
  address_number VARCHAR(10) NOT NULL,/*4*/
  address VARCHAR(100) NOT NULL,/*5*/
  address_contents VARCHAR(100) NOT NULL,/*6*/
  email VARCHAR(30) NOT NULL,/*7*/
  birth DATE NOT NULL,/*8*/
  gender CHAR(1) NOT NULL,/*9*/
  grade CHAR(1) NOT NULL DEFAULT '1',/*10*/
  id_code VARCHAR(14) NOT NULL,/*11*/
  join_member DATE NOT NULL,/*12*/
  money INT NULL,/*13*/
  point INT NULL DEFAULT 0,/*14*/
  author CHAR(1) NOT NULL,/*15*/
  PRIMARY KEY (id)
)
/*
 * grade : 1. 일반회원 2.우수회원
 */

/*
 * gender M.남자 F.여자
 */

/*
 * author : 1 회원
 * author : 2 관리자
 */

select id from member;

select id from member where id ='1';

select * from member;

update member set author = '2' where id = 'pass';

select * from member where id = 'test';

select * from member where id ='test' and pw = 'test';

select count(id) from member;

select now()

insert into member values('1','1','1','1','1','1','1','2000/11/11','1','1','1','2000/11/11','1','1','1');

delete from member where id ='test1';

select concat(date_format(sysdate(),'%Y%m%d'),count(id)) from member;
/*회원 고윷번호 수정*/

SELECT LPAD('1',5,'0');

CREATE TABLE Notice (
  Notice_num INT NOT NULL,
  Notice_title VARCHAR(50) NOT NULL,
  Notice_contents VARCHAR(100) NULL,
  Notice_readcount INT NULL DEFAULT 0,
  Notice_date DATETIME NOT NULL,
  member_id VARCHAR(20) NOT NULL
)

CREATE TABLE Notice_review (
  Notice_review_contents VARCHAR(200) NOT NULL,
  member_id VARCHAR(20) NOT NULL,
  Notice_Notice_num INT NOT NULL
)


CREATE TABLE QnA (
  QnA_num INT NOT NULL,
  QnA_title VARCHAR(50) NOT NULL,
  QnA_contents VARCHAR(1000) NULL,
  QnA_readcount INT NOT NULL DEFAULT 0,
  QnA_date DATE NOT NULL,
  QnA_re_ref INT NOT NULL,
  QnA_re_lev INT NOT NULL,
  QnA_re_seq INT NOT NULL,
  member_id VARCHAR(20) NOT NULL
)

/*물건*/
CREATE TABLE Product (
  Product_code VARCHAR(14) NOT NULL,
  Product_name VARCHAR(100) NOT NULL,
  Product_kcal INT NOT NULL,
  Product_allergy VARCHAR(200) NULL,
  Product_price INT NOT NULL,
  Product_choice CHAR(1) NOT NULL,
  Product_inout CHAR(1) NOT NULL,
  Product_date DATE NOT NULL,
  Product_count INT NULL,
  PRIMARY KEY (Product_code)
)
/*물건 고유 번호 object(2) + sysdate(2000/12/20) + start(1)*/
/*Product_inout 물건이 있으면 I 없으면 X*/

/*Product_choice 1 : 케이크 / 2 : 음료 / 3.커피 / 4.디저트*/

select concat('2',date_format(sysdate(),'%Y%m%d'),count(Product_name)) from Product;
/*2 Product + 20210922 날짜 + conut 물건 갯수4*/
insert into Product values('1','케이크',1,'1',1000,'1','I',now(),1);
insert into Product values('2','음료',1,'1',2000,'2','I',now(),1);
insert into Product values('3','커피',1,'1',1500,'3','I',now(),1);
insert into Product values('4','디저트',1,'1',1500,'4','I',now(),1);

delete from Product where Product_code = '1';

drop table Product

select * from Product;

/*아이스크림*/
CREATE TABLE ice (
  ice_code VARCHAR(10) NOT NULL,
  ice_name VARCHAR(20) NOT NULL,
  ice_totalg INT NULL,
  ice_kcal INT NULL,
  ice_allergy VARCHAR(200) NULL,
  ice_price INT NULL,
  ice_choice CHAR(1) NOT NULL,
  ice_inout CHAR(1) NOT NULL,
  ice_date DATE NOT NULL,
  ice_count INT NULL,
  PRIMARY KEY (ice_code)
)

CREATE TABLE IO (
  inOut_index INT NOT NULL,
  inOut_status CHAR(1) NOT NULL,
  inOut_count INT NULL,
  inOut_date DATE NOT NULL,
  object_code VARCHAR(10) NOT NULL,
  ice_code VARCHAR(10) NOT NULL,
  PRIMARY KEY (inOut_index)
)

--drop table IO

CREATE TABLE object_review (
  member_id VARCHAR(20) NOT NULL,
  object_object_code INT NOT NULL,
  object_review VARCHAR(200) NULL,
  object_review_grade INT NULL  
)


CREATE TABLE member_order (
  order_code INT NOT NULL,
  order_totalprice INT NOT NULL,
  order_how CHAR(1) NOT NULL,
  order_date DATE NULL,
  member_id VARCHAR(20) NOT NULL,
  object_object_code VARCHAR(10) NOT NULL,
  ice_ice_code VARCHAR(10) NOT NULL
)

CREATE TABLE order_summary (
  order_summary_process VARCHAR(1) NOT NULL,
  order_order_code INT NOT NULL
)

CREATE TABLE basket (
  basket_num INT NOT NULL,
  basket_choice CHAR(1) NULL,
  member_id VARCHAR(20) NOT NULL,
  PRIMARY KEY (basket_num) 
)

CREATE TABLE basket_detail (
  basket_detail_name VARCHAR(20) NOT NULL,
  basket_detail_choice CHAR(1) NOT NULL,
  basket_detail_count INT NULL,
  basket_detail_date DATE NOT NULL,
  basket_basket_num INT NOT NULL
)
