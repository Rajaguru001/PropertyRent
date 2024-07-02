create database propertyrentlease;
use propertyrentlease;
select * from comments;
select c.user_id,c.comment_section, u.user_name ,c.property_id from comments as c join users u on c.user_id=u.user_id where property_id=12 ;
create table users(
user_id int auto_increment primary key,
user_name varchar(30),
password varchar(30),
email varchar(30) NOT NULL UNIQUE,
phonenumber varchar(10)NOT NULL UNIQUE																														
);
insert into users(user_id,user_name,password,email,phonenumber)values(1,'Rajaguru','Raju@123','adminlog@eliterental.com',9879879879);
select *from users;
select user_id,email from users ;
select email from users where user_id='10';

SELECT 
    pd.property_id,
    pd.property_type,
    pd.sqft,
    pd.furnishing,
    pd.available_from,
    pd.rent,
    pd.address,
    pd.posted_on_date,
    pd.EB_Bill,
    pd.owner_id,
    pd.rent_id,
    pd.subscription_id,
    pd.is_approval,
    u_owner.user_name AS owner_name,
    u_owner.email AS owner_email,
    u_owner.phonenumber AS owner_phonenumber,
    u_renter.user_name AS renter_name,
    u_renter.email AS renter_email,
    u_renter.phonenumber AS renter_phonenumber
FROM 
    property_details AS pd
JOIN 
    users AS u_owner ON pd.owner_id = u_owner.user_id
LEFT JOIN 
    users AS u_renter ON pd.rent_id = u_renter.user_id;


CREATE TABLE property_subscription (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_id INT,
    subscription_duration INT, 
    payment_amount DECIMAL(10, 2), 
    payment_date DATE,
    FOREIGN KEY (owner_id) REFERENCES users(user_id)
  
    
);
 ALTER TABLE property_subscription
MODIFY COLUMN payment_amount INT DEFAULT 200;
ALTER TABLE property_subscription
MODIFY COLUMN subscription_duration INT DEFAULT 90;
ALTER TABLE property_subscription
MODIFY payment_status BOOLEAN DEFAULT FALSE;
select *from property_subscription ;
describe  property_subscription;
ALTER TABLE property_subscription DROP COLUMN payment_date;
ALTER TABLE property_subscription
ADD COLUMN payment_status BOOLEAN DEFAULT FALSE;
truncate property_subscription;

CREATE TABLE property_details (
    property_id INT PRIMARY KEY AUTO_INCREMENT,
    property_type VARCHAR(20),
    sqft INT,
    furnishing VARCHAR(20), 
    available_from date,
    rent INT,
    address VARCHAR(50),
    posted_on_date DATE,
    EB_Bill longblob,
    owner_id INT,
    rent_id INT,
    subscription_id INT,
    is_approval BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (owner_id) REFERENCES users(user_id),
    FOREIGN KEY (rent_id) REFERENCES users(user_id),
    FOREIGN KEY (subscription_id) REFERENCES property_subscription(subscription_id),
    CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES users(user_id),
    CONSTRAINT fk_rent_id FOREIGN KEY (rent_id) REFERENCES users(user_id),
	CONSTRAINT fk_subscription_id FOREIGN KEY (subscription_id) REFERENCES property_subscription(subscription_id)
);
SELECT * FROM property_details WHERE is_approval = true AND location = 'Madurai' AND rent <= 5000;
create table request(
  owner_id int,
  rent_id int,
  request_id int primary key,
  approval boolean,
  constraint fk_requestowner_id FOREIGN KEY (owner_id) references users(user_id),
  constraint fk_requestrent_id FOREIGN KEY (rent_id) references users(user_id)
);
describe request;
SELECT * FROM request WHERE rent_id =3;
select * from request;
select * from users;
ALTER TABLE request
MODIFY COLUMN request_id INT AUTO_INCREMENT ;
ALTER TABLE request
ADD COLUMN property_id INT,
ADD CONSTRAINT fk_request_property_id FOREIGN KEY (property_id) REFERENCES property_details(property_id);
ALTER TABLE request
ALTER COLUMN approval SET DEFAULT FALSE;

INSERT INTO property_details (property_type, sqft, furnishing, available_from, rent, address, posted_on_date, EB_Bill,owner_id) VALUES ('pg', '123', 'no','2024-06-07', '1222', 'wqd','2024-06-05','null','2');
describe property_details;
select*from property_details;
delete from  property_details;
SELECT * FROM property_details WHERE is_approval = true and rent_id=null;
SELECT * FROM property_details order by property_id desc;
truncate property_details;
ALTER TABLE property_details
ADD COLUMN location VARCHAR(50);
describe  property_details;
update property_details set is_approval ='1'  where property_id ='2';
update property_details set is_approval =true  where property_id =3;
update  property_details  set rent_id=2  where property_id=2;
select * from property_details;
create table comments(
user_id int,
comment_id int PRIMARY KEY AUTO_INCREMENT,
comment_section varchar(50),
FOREIGN KEY(user_id)  REFERENCES users(user_id),
CONSTRAINT fk_user_id foreign key(user_id) references users(user_id)
);
describe comments;
insert into comments (user_id ,comment_section,property_id)values(2,'nyz house',9);
ALTER TABLE comments
ADD COLUMN property_id INT,
ADD CONSTRAINT fk_comments_id FOREIGN KEY (property_id) REFERENCES property_details(property_id);
select * from request;

create table property_images(
image_id int PRIMARY KEY AUTO_INCREMENT,
images longblob,
property_id int,
foreign key (property_id) references  property_details(property_id),
constraint fk_property_id  foreign key (property_id) references  property_details(property_id)
);
select * from property_details where owner_id=2;
drop table property_images;
truncate property_images;