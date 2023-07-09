drop table if exists delivery_driver_rating;
drop table if exists cuisine;
drop table if exists order_menu_item;
drop table if exists notification;
drop table if exists comment_section;
drop table if exists payment;
drop table if exists order_details;
drop table if exists cart;
drop table if exists menu_item;
drop table if exists delivery_driver;
drop table if exists  discount;
drop table if exists order_status;
drop table if exists restaurant;
drop table if exists customer ;








create table customer (
customer_id integer,
first_name varchar(300) not null,
last_name varchar(300) not null,
middle_name varchar(300),
phone_number varchar(15)not null,
email varchar(200)not null,
unit_id varchar(200)not null,
street varchar(200) not null,
city varchar(200)not null,
state varchar (200)not null,
zip_code varchar(20)not null,
primary key (customer_id)
);
create table restaurant(
restaurant_id integer,
restaurant_name varchar(200) not null,
street varchar(200) not null,
city varchar(200)not null,
state varchar (200)not null,
zip_code varchar(20)not null,
website varchar(300),
primary key (restaurant_id)
);
create table order_status (
order_status_id integer,
status_message varchar(300),
primary key (order_status_id)
);
create table discount(
discount_id integer,
discount_code integer,
times_used varchar(50),
max_usage varchar(50),
discount_percent varchar(60),
primary key(discount_id)
);
create table delivery_driver(
driver_id integer,
first_name varchar(50) not null,
last_name varchar(50) not null,
middle_name varchar(50),
phone_number varchar(15) not null,
primary key(driver_id)
);
create table menu_item (
menu_item_id integer,
restaurant_id integer,
item_name varchar (100) not null,
price integer not null,
primary key (menu_item_id),
foreign key (restaurant_id) references restaurant (restaurant_id)
);
create table cart(
cart_id integer,
menu_item_id integer,
primary key (cart_id),
foreign key (menu_item_id) references menu_item (menu_item_id)
);
create table order_details(
order_id integer,
customer_id integer,
order_time varchar(50) not null,
order_date Date not null,
preparation_time varchar(50) not null,
ready_for_pickup_time varchar(50) not null,
delivery_fee varchar(50) not null,
total_amount varchar(50) not null,
requested_delivery_time varchar(50) not null,
customer_restaurant_rating varchar(50) not null,
customer_driver_rating varchar(50) not null,
cart_id integer,
order_status_id integer,
driver_id integer,
restaurant_id integer,
primary key (order_id),
foreign key (customer_id) references customer (customer_id),
foreign key (cart_id) references cart(cart_id),
foreign key (order_status_id)references order_status (order_status_id),
foreign key (driver_id) references delivery_driver (driver_id),
foreign key (restaurant_id)references restaurant (restaurant_id)
);
create table payment(
payment_id integer,
customer_id integer,
order_id integer,
discount_id integer,
total_amount integer not null,
payment_method varchar(20) not null,
payment_account integer not null,
primary key (payment_id),
foreign key(customer_id) references customer (customer_id),
foreign key(discount_id) references discount (discount_id),
foreign key(order_id) references order_details(order_id)
);
create table comment_section (
comment_id integer,
customer_id integer,
order_id integer,
comment_text varchar (500),
tim_stamp varchar (100),
primary key (comment_id),
foreign key (order_id) references order_details (order_id),
foreign key (customer_id) references customer (customer_id)
);
create table notification(
notification_id integer,
order_id integer,
customer_id integer,
message varchar (500),
primary key (notification_id),
foreign key (order_id) references order_details (order_id),
foreign key (customer_id) references customer (customer_id)
);
create table order_menu_item(
order_menu_item_id integer,
order_id integer,
menu_item_id integer,
quantity_ordered varchar(200) not null,
primary key (order_menu_item_id),
foreign key (order_id) references order_details (order_id),
foreign key (menu_item_id) references menu_item (menu_item_id)
);
create table cuisine (
menu_item_id integer,
breakfast_menu varchar (100),
lunch_menu varchar (100),
dinner_menu varchar (100),
foreign key (menu_item_id) references menu_item (menu_item_id)
);
create table delivery_driver_rating(
delivery_driver_rating_id integer,
driver_id integer,
customer_id integer,
feedback varchar (100),
tip varchar (100),
primary key (delivery_driver_rating_id),
foreign key (driver_id) references delivery_driver (driver_id),
foreign key (customer_id) references customer (customer_id)
);


insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (1, 'Juanita', 'Staunton', 'Dunstan', '650-599-8241', 'dstaunton0@a8.net', 'SA', 'Golf Course', 'Palo Alto', 'California', '94302');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (2, 'Rosella', 'Pollins', null, '504-654-4470', 'mpollins1@ftc.gov', 'SA', 'Merchant', 'New Orleans', 'Louisiana', '70154');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (3, 'Chiarra', 'Emma', 'Bev', '212-457-0325', 'bemma2@china.com.cn', 'NA', 'Bobwhite', 'Jamaica', 'New York', '11499');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (4, 'Law', 'Surridge', 'Beverie', '361-914-7629', 'bsurridge3@angelfire.com', 'SA', 'Donald', 'Corpus Christi', 'Texas', '78426');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (5, 'Corenda', 'Newlan', 'Xever', '719-965-4654', 'xnewlan4@cbsnews.com', 'NA', 'Buell', 'Colorado Springs', 'Colorado', '80925');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (6, 'Ealasaid', 'Sloss', 'Melvyn', '212-876-9598', 'msloss5@tripadvisor.com', 'NA', 'Hazelcrest', 'New York City', 'New York', '10275');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (7, 'Brnaba', 'Jacke', 'Ettie', '712-376-9954', 'ejacke6@sfgate.com', 'AS', 'Bunting', 'Omaha', 'Nebraska', '68134');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (8, 'Gasparo', 'Stampe', 'Saxe', '601-245-9342', 'sstampe7@quantcast.com', 'AS', 'Arkansas', 'Jackson', 'Mississippi', '39204');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (9, 'Gherardo', 'Reeves', 'Adah', '617-927-4547', 'areeves8@home.pl', 'NA', 'Valley Edge', 'Watertown', 'Massachusetts', '02472');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (10, 'Garvy', 'Malling', 'Kip', '912-720-9428', 'kmalling9@timesonline.co.uk', 'NA', 'Transport', 'Savannah', 'Georgia', '31405');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (11, 'Ferdinanda', 'Nottingham', 'Myles', '410-841-0414', 'mnottinghama@lycos.com', 'NA', 'Anhalt', 'Baltimore', 'Maryland', '21265');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (12, 'Maribel', 'Davies', null, '904-579-9618', 'gdaviesb@trellian.com', 'NA', 'Fairfield', 'Jacksonville', 'Florida', '32259');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (13, 'Erminie', 'Reames', 'Pat', '813-913-9372', 'preamesc@reddit.com', 'NA', 'Lindbergh', 'Tampa', 'Florida', '33633');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (14, 'Mari', 'Pavinese', 'Zia', '239-248-0421', 'zpavinesed@dmoz.org', 'NA', 'Dottie', 'Naples', 'Florida', '34108');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (15, 'Robinia', 'Wyatt', 'Virge', '352-464-5018', 'vwyatte@blogspot.com', 'AS', 'Sundown', 'Gainesville', 'Florida', '32610');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (16, 'Nathalia', 'Malmar', 'Bettina', '423-213-3504', 'bmalmarf@smh.com.au', 'OC', 'Crownhardt', 'Chattanooga', 'Tennessee', '37410');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (17, 'Ezekiel', 'Lared', 'Iorgos', '616-786-0768', 'ilaredg@berkeley.edu', 'AF', 'Weeping Birch', 'Grand Rapids', 'Michigan', '49518');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (18, 'Matthiew', 'Deacock', 'Pepillo', '850-474-6575', 'pdeacockh@vk.com', 'NA', 'Jana', 'Tallahassee', 'Florida', '32304');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (19, 'Perice', 'Whapple', 'Shaina', '213-475-0733', 'swhapplei@blogs.com', 'NA', 'Kipling', 'Los Angeles', 'California', '90035');
insert into customer (customer_id, first_name, last_name, middle_name, phone_number, email, unit_id, street, city, state, zip_code) values (20, 'Cammy', 'Greally', 'Lindsey', '734-424-1993', 'lgreallyj@webmd.com', 'AS', 'Sherman', 'Ann Arbor', 'Michigan', '48107');

INSERT INTO restaurant (restaurant_id, restaurant_name, street, city, state, zip_code, website)
VALUES
(1248, 'The Cheesecake Factory', '123 Main St', 'Los Angeles', 'CA', '90001', 'www.thecheesecakefactory.com'),
(2365, 'Burger King', '456 Oak Ave', 'New York', 'NY', '10001', 'www.burgerking.com'),
(3497, 'Pizza Hut', '789 Pine St', 'Chicago', 'IL', '60601', 'www.pizzahut.com'),
(4502, 'McDonalds', '101 Elm St', 'Houston', 'TX', '77002', 'www.mcdonalds.com'),
(5809, 'Taco Bell', '222 Maple St', 'Philadelphia', 'PA', '19102', 'www.tacobell.com'),
(6123, 'Chipotle', '333 Walnut St', 'Phoenix', 'AZ', '85001', 'www.chipotle.com'),
(7472, 'KFC', '444 Cedar St', 'San Antonio', 'TX', '78201', 'www.kfc.com'),
(8220, 'Subway', '555 Birch St', 'San Diego', 'CA', '92101', 'www.subway.com'),
(9734, 'Wendys', '666 Oak St', 'Dallas', 'TX', '75201', 'www.wendys.com'),
(10296, 'Starbucks', '777 Pine St', 'Washington DC', 'DC', '20001', 'www.starbucks.com'),
(11857, 'Dunkin Donuts', '888 Maple St', 'Boston', 'MA', '02108', 'www.dunkindonuts.com'),
(12654, 'Panda Express', '999 Walnut St', 'Seattle', 'WA', '98101', 'www.pandaexpress.com'),
(13789, 'Olive Garden', '111 Cedar St', 'Atlanta', 'GA', '30303', 'www.olivegarden.com'),
(14357, 'Red Lobster', '222 Birch St', 'San Francisco', 'CA', '94102', 'www.redlobster.com'),
(15894, 'Panera Bread', '333 Oak St', 'Miami', 'FL', '33101', 'www.panerabread.com'),
(16203, 'Baskin Robbins', '444 Maple St', 'Detroit', 'MI', '48201', 'www.baskinrobbins.com'),
(17468, 'Papa Johns', '555 Cedar St', 'Las Vegas', 'NV', '89101', 'www.papajohns.com'),
(18976, 'Dominos', '666 Pine St', 'Austin', 'TX', '78701', 'www.dominos.com'),
(19823, 'Five Guys', '777 Walnut St', 'Portland', 'OR', '97201', 'www.fiveguys.com'),
(20297, 'Chick-fil-A', '888 Cedar St', 'Charlotte', 'NC', '28201', 'www.chickfila.com');

INSERT INTO order_status (order_status_id, status_message)
VALUES
(123, 'Order received'),
(2345, 'Preparing order'),
(345, 'Order ready for pickup'),
(456, 'Order out for delivery'),
(567, 'Order delivered'),
(678, 'Order cancelled'),
(789, 'Refund processed'),
(890, 'Order completed'),
(901, 'Payment received'),
(234, 'Order placed'),
(432, 'Order confirmed'),
(543, 'Order delayed'),
(654, 'Order returned'),
(765, 'Order lost'),
(8706, 'Order damaged'),
(987, 'Order refunded'),
(876, 'Payment failed'),
(7065, 'Order not found'),
(6054, 'Order cancelled by restaurant');

INSERT INTO discount (discount_id, discount_code, times_used, max_usage, discount_percent)
VALUES
(3004, 120345, '10', '50', '10% off'),
(508, 234507, '5', '20', '20% off'),
(706, 345608, '15', '30', '15% off'),
(902, 450789, '7', '50', '25% off'),
(605, 567090, '20', '25', '30% off'),
(703, 678001, '12', '50', '10% off'),
(401, 790203, '3', '10', '40% off'),
(409, 890123, '8', '20', '20% off'),
(907, 903454, '25', '50', '15% off'),
(304, 104567, '9', '25', '25% off'),
(608, 120405, '5', '10', '10% off'),
(809, 203476, '2', '5', '50% off'),
(708, 304587, '17', '20', '20% off'),
(207, 405678, '30', '50', '10% off'),
(501, 506789, '10', '15', '30% off'),
(607, 601234, '6', '10', '25% off'),
(905, 702345, '4', '5', '40% off'),
(406, 803456, '22', '30', '15% off'),
(702, 904567, '18', '25', '20% off'),
(506, 100389, '12', '15', '30% off');

INSERT INTO delivery_driver (driver_id, first_name, last_name, middle_name, phone_number)
VALUES
(235, 'John', 'Doe', 'M', '123-456-7890'),
(489, 'Jane', 'Doe', NULL, '234-567-8901'),
(823, 'David', 'Johnson', 'L', '345-678-9012'),
(762, 'Sarah', 'Smith', 'K', '456-789-0123'),
(399, 'Michael', 'Brown', 'D', '567-890-1234'),
(927, 'Emily', 'Davis', NULL, '678-901-2345'),
(653, 'Daniel', 'Wilson', 'J', '789-012-3456'),
(847, 'Jessica', 'Miller', 'R', '890-123-4567'),
(101, 'Brian', 'Taylor', 'S', '901-234-5678'),
(446, 'Amanda', 'Anderson', 'T', '012-345-6789'),
(279, 'Jason', 'Thomas', 'E', '123-456-7890'),
(534, 'Ashley', 'Lee', 'N', '234-567-8901'),
(718, 'Kevin', 'Clark', NULL, '345-678-9012'),
(961, 'Stephanie', 'Hall', 'M', '456-789-0123'),
(168, 'Jacob', 'Wright', 'P', '567-890-1234'),
(504, 'Lauren', 'Martin', 'F', '678-901-2345'),
(732, 'Ryan', 'Allen', 'G', '789-012-3456'),
(258, 'Melissa', 'King', NULL, '890-123-4567'),
(613, 'Nicholas', 'Baker', 'H', '901-234-5678'),
(845, 'Taylor', 'Garcia', 'J', '012-345-6789');

INSERT INTO menu_item (menu_item_id, restaurant_id, item_name, price)
VALUES
(5123, 1248, 'Original Cheesecake', 799),
(7325, 2365, 'Whopper', 499),
(9831, 3497, 'Pepperoni Pizza', 1099),
(10254, 4502, 'Big Mac', 349),
(12489, 5809, 'Crunchwrap Supreme', 379),
(13654, 6123, 'Burrito Bowl', 799),
(14789, 7472, '3-Piece Chicken Meal', 649),
(15203, 8220, 'Turkey Breast Sandwich', 399),
(16893, 9734, 'Baconator', 599),
(17925, 10296, 'Caramel Frappuccino', 549),
(18532, 11857, 'Glazed Donut', 99),
(19657, 12654, 'Orange Chicken', 799),
(20876, 13789, 'Chicken Alfredo', 1399),
(21357, 14357, 'Lobster Bisque', 899),
(22469, 15894, 'Broccoli Cheddar Soup', 499),
(23648, 16203, 'Mint Chocolate Chip Ice Cream', 399),
(24751, 17468, 'Pepperoni Pizza', 1099),
(25136, 18976, 'Meat Lovers Pizza', 1199),
(26398, 19823, 'Bacon Cheeseburger', 799),
(27965, 20297, 'Spicy Chicken Sandwich', 399);

INSERT INTO menu_item (menu_item_id, restaurant_id, item_name, price)
VALUES
(356789, 1248, 'Original Cheesecake', 799),
(458321, 2365, 'Whopper', 449),
(598732, 3497, 'Medium Pan Pizza', 1099),
(613827, 4502, 'Big Mac', 399),
(745891, 5809, 'Crunchwrap Supreme', 379),
(824569, 6123, 'Chicken Burrito Bowl', 899),
(936781, 7472, '3 Piece Meal', 699),
(102364, 8220, '6 Inch Sub', 399),
(114523, 9734, 'Baconator', 649),
(126780, 10296, 'Iced Caramel Macchiato', 499),
(134678, 11857, 'Glazed Donut', 119),
(145678, 12654, 'Orange Chicken', 899),
(158234, 13789, 'Fettuccine Alfredo', 1399),
(169832, 14357, 'Lobster Bisque', 599),
(177892, 15894, 'Broccoli Cheddar Soup', 499),
(184276, 16203, 'Mint Chocolate Chip Ice Cream', 299),
(197435, 17468, 'Large Pepperoni Pizza', 1299),
(209465, 18976, 'ExtravaganZZa Pizza', 1599),
(215763, 19823, 'Little Hamburger', 699),
(227910, 20297, 'Chicken Sandwich', 449);

INSERT INTO cart (cart_id, menu_item_id)
VALUES
(1234, 5123),
(2345, 7325),
(3456, 9831),
(4567, 10254),
(5678, 12489),
(6789, 13654),
(7890, 14789),
(8901, 15203),
(9012, 16893),
(1235, 17925),
(2346, 18532),
(3457, 19657),
(4568, 20876),
(5679, 21357),
(6780, 22469),
(7901, 23648),
(8902, 24751),
(9013, 25136),
(1236, 26398),
(2347, 27965);


insert into order_details (order_id, customer_id, order_time, order_date, preparation_time, ready_for_pickup_time, delivery_fee, total_amount, requested_delivery_time, customer_restaurant_rating, customer_driver_rating, cart_id, order_status_id, driver_id, restaurant_id) 
values (100001, 1, '12:30 PM', '2023-03-13', '20 minutes', '1:00 PM', '$5.00', '$25.00', '1:30 PM', '4', '5', 1234, 123, 235, 1248), 
(100002, 2, '1:00 PM', '2023-03-13', '30 minutes', '1:30 PM', '$3.00', '$15.00', '2:00 PM', '3', '4', 2345, 234, 489, 2365), 
(100003, 3, '2:00 PM', '2023-03-13', '25 minutes', '2:25 PM', '$4.50', '$22.50', '2:50 PM', '5', '5', 3456, 345, 823, 3497), 
(100004, 4, '3:00 PM', '2023-03-13', '35 minutes', '3:35 PM', '$6.00', '$30.00', '4:00 PM', '4', '3', 4567, 456, 762, 4502), 
(100005, 5, '4:00 PM', '2023-03-13', '20 minutes', '4:20 PM', '$2.50', '$12.50', '4:30 PM', '4', '4', 5678, 567, 399, 5809),
(100006, 6, '10:30 AM', '2023-03-13', '20 mins', '11:00 AM', '5.00', '25.00', '12:00 PM', '4.5', '4.0', 6789, 678, 927, 6123),
(100007, 7, '11:00 AM', '2023-03-13', '25 mins', '11:30 AM', '3.00', '20.00', '12:30 PM', '4.0', '3.5', 7890, 789, 653, 7472),
(100008, 8, '12:30 PM', '2023-03-13', '15 mins', '12:45 PM', '6.00', '30.00', '1:15 PM', '4.5', '4.5', 8901, 890, 847, 8220),
(100009, 9, '1:00 PM', '2023-03-13', '30 mins', '1:30 PM', '4.50', '22.50', '2:15 PM', '4.0', '3.5', 9012, 901, 101, 9734),
(1000010, 10, '2:00 PM', '2023-03-13', '10 mins', '2:10 PM', '2.00', '15.00', '2:45 PM', '3.5', '3.0', 1235, 234, 446, 10296),
(1000011, 11, '3:00 PM', '2023-03-13', '20 mins', '3:20 PM', '5.00', '25.00', '4:00 PM', '4.5', '4.0', 2346, 432, 279, 11857),
(1000012, 12, '4:00 PM', '2023-03-13', '15 mins', '4:15 PM', '3.00', '20.00', '5:00 PM', '4.0', '3.5', 3457, 543, 534, 12654),
(1000013, 13, '5:00 PM', '2023-03-13', '30 mins', '5:30 PM', '6.00', '30.00', '6:30 PM', '4.5', '4.5', 4568, 654, 718, 13789),
(1000014, 14, '6:00 PM', '2023-03-13', '10 mins', '6:10 PM', '4.50', '22.50', '7:00 PM', '4.0', '3.5', 5679, 765, 961, 14357),
(1000015, 15, '12:30 PM', '2023-03-13', '20 minutes', '12:50 PM', '$3.50', '$25.00', '1:00 PM', '4', '5', 6780, 8706, 168, 15894),
(1000016, 16, '1:15 PM', '2023-03-13', '30 minutes', '1:45 PM', '$4.00', '$40.00', '2:00 PM', '5', '4', 7901, 987, 504, 16203),
(1000017, 17, '6:00 PM', '2023-03-13', '45 minutes', '6:45 PM', '$5.00', '$50.00', '7:00 PM', '4', '3', 8902, 876, 732, 17468),
(1000018, 18, '7:30 PM', '2023-03-13', '25 minutes', '7:55 PM', '$6.50', '$35.00', '8:15 PM', '3', '4', 9013, 7065, 258, 18976),
(1000019, 19, '10:00 AM', '2023-03-14', '15 minutes', '10:15 AM', '$3.00', '$20.00', '10:30 AM', '4', '4', 1236, 6054, 613, 19823);




insert into payment (payment_id, customer_id, order_id, discount_id, total_amount, payment_method, payment_account)
values
(123456, 1, 100001, 3004, 500, 'Credit Card', 123456789),
(234567, 2, 100002, 508, 750, 'PayPal', 987654321),
(345678, 3, 100003, 706, 1000, 'Cash', 135792468),
(456789, 4, 100004, 902, 1250, 'Credit Card', 864297531),
(567890, 5, 100005, 605, 1500, 'PayPal', 246813579),
(678901, 6, 100006, 703, 1750, 'Cash', 975318642),
(789012, 7, 100007, 401, 2000, 'Credit Card', 531864297),
(890123, 8, 100008, 409, 2250, 'PayPal', 318642975),
(901234, 9, 100009, 907, 2500, 'Cash', 864297531),
(123457, 10, 1000010, 304, 500, 'Credit Card', 246813579),
(234568, 11, 1000011, 608, 750, 'PayPal', 975318642),
(345679, 12, 1000012, 809, 1000, 'Cash', 864297531),
(456790, 13, 1000013, 708, 1250, 'Credit Card', 135792468),
(567901, 14, 1000014, 207, 1500, 'PayPal', 531864297),
(678012, 15, 1000015, 501, 1750, 'Cash', 975318642),
(789123, 16, 1000016, 607, 2000, 'Credit Card', 246813579),
(890234, 17, 100001, 905, 2250, 'PayPal', 864297531),
(901345, 18, 100002, 406, 2500, 'Cash', 531864297),
(123460, 19, 100003, 702, 500, 'Credit Card', 975318642),
(234571, 20, 100004, 506, 750, 'PayPal', 135792468);


insert into comment_section (comment_id, customer_id, order_id, comment_text, tim_stamp) values
(12345, 1, 100001, 'Great product, highly recommend!', '2023-03-13 10:00:00'),
(23456, 2, 100002, 'Shipping was fast and product arrived in great condition.', '2023-03-13 10:01:00'),
(34567, 3, 100003, 'I had some issues with the product, but customer service was very helpful.', '2023-03-13 10:02:00'),
(45678, 4, 100004, 'This is the best product I have ever bought!', '2023-03-13 10:03:00'),
(56789, 5, 100005, 'I am very satisfied with my purchase.', '2023-03-13 10:04:00'),
(67890, 6, 100006, 'The product did not meet my expectations.', '2023-03-13 10:05:00'),
(78901, 7, 100007, 'Shipping took longer than expected, but the product is good.', '2023-03-13 10:06:00'),
(89012, 8, 100008, 'The product arrived damaged, but customer service was very helpful in resolving the issue.', '2023-03-13 10:07:00'),
(90123, 9, 100009, 'I would definitely purchase from this company again.', '2023-03-13 10:08:00'),
(12346, 10, 1000010, 'The product works as advertised.', '2023-03-13 10:09:00'),
(23457, 11, 1000011, 'I received the wrong product, but customer service was very helpful in resolving the issue.', '2023-03-13 10:10:00'),
(34568, 12, 1000012, 'The product was not what I expected, but customer service was very helpful in resolving the issue.', '2023-03-13 10:11:00'),
(45679, 13, 1000013, 'I am very happy with my purchase!', '2023-03-13 10:12:00'),
(56780, 14, 1000014, 'The product arrived in a timely manner and was exactly what I wanted.', '2023-03-13 10:13:00'),
(67891, 15, 1000015, 'I had some issues with the product, but customer service was very helpful in resolving the issue.', '2023-03-13 10:14:00'),
(78902, 16, 1000016, 'The product arrived damaged, but customer service was very helpful in resolving the issue.', '2023-03-13 10:15:00');


INSERT INTO notification (notification_id, order_id, customer_id, message)
VALUES
    (100001, 100001, 1, 'Your order has been shipped'),
    (100002, 100002, 2, 'Your order is out for delivery'),
    (100003, 100003, 3, 'Your order has been delivered'),
    (100004, 100004, 4, 'Your order is being prepared'),
    (100005, 100005, 5, 'Your order has been cancelled'),
    (100006, 100006, 6, 'Your order has been refunded'),
    (100007, 100007, 7, 'Your order has been shipped'),
    (100008, 100008, 8, 'Your order is out for delivery'),
    (100009, 100009, 9, 'Your order has been delivered'),
    (100010, 1000010, 10, 'Your order is being prepared'),
    (100011, 1000011, 11, 'Your order has been cancelled'),
    (100012, 1000012, 12, 'Your order has been refunded'),
    (100013, 1000013, 13, 'Your order has been shipped'),
    (100014, 1000014, 14, 'Your order is out for delivery'),
    (100015, 1000015, 15, 'Your order has been delivered'),
    (100016, 1000016, 16, 'Your order is being prepared'),
    (10037, 1000017, 17, 'Your order has been cancelled'),
    (10048, 1000018, 18, 'Your order has been refunded');
   
   
   
insert into order_menu_item (order_menu_item_id, order_id, menu_item_id, quantity_ordered) values
(1000001, 100001, 356789, '2'),
(1000002, 100002, 458321, '1'),
(1000003, 100003, 598732, '3'),
(1000004, 100004, 613827, '2'),
(1000005, 100005, 745891, '1'),
(1000006, 100006, 824569, '4'),
(1000007, 100007, 936781, '2'),
(1000008, 100008, 102364, '1'),
(1000009, 100009, 114523, '3'),
(1000010, 1000010, 126780, '2'),
(1000011, 1000011, 134678, '1'),
(1000012, 1000012, 145678, '4'),
(1000013, 1000013, 158234, '2'),
(1000014, 1000014, 169832, '1'),
(1000015, 1000015, 177892, '3'),
(1000016, 1000016, 184276, '2'),
(1000017, 100001, 197435, '1'),
(1000018, 100002, 209465, '4'),
(1000019, 100003, 215763, '2'),
(1000020, 100004, 227910, '1');


INSERT INTO cuisine (menu_item_id, breakfast_menu, lunch_menu, dinner_menu) VALUES
(356789, 'Oatmeal with fresh fruit', 'Chicken Caesar Salad', 'Grilled Salmon with roasted vegetables'),
(458321, 'Blueberry Pancakes', 'Turkey Club Sandwich', 'Spaghetti Carbonara'),
(598732, 'Greek Yogurt with honey and granola', 'Roasted Vegetable Wrap', 'Filet Mignon with mashed potatoes'),
(613827, 'Egg White Omelette with spinach and mushrooms', 'Quinoa Salad with grilled chicken', 'Grilled Shrimp Scampi'),
(745891, 'Avocado Toast with poached egg', 'Caprese Panini', 'Lobster Ravioli'),
(824569, 'Eggs Benedict with smoked salmon', 'Vegetable Stir Fry', 'Roasted Chicken with mushroom sauce'),
(936781, 'Cinnamon French Toast', 'Caesar Salad with grilled shrimp', 'Filet of Sole with lemon butter sauce'),
(102364, 'Bagel with Cream Cheese and Lox', 'Mediterranean Salad', 'Beef Bourguignon with mashed potatoes'),
(114523, 'Breakfast Burrito with scrambled eggs and chorizo', 'Cobb Salad', 'Roasted Pork Loin with apples and onions'),
(126780, 'Belgian Waffles with fresh berries', 'Beef and Broccoli Stir Fry', 'Pan-Seared Duck Breast with cherry sauce'),
(134678, 'Yogurt Parfait with granola and berries', 'Turkey Chili', 'Grilled Ribeye with chimichurri sauce'),
(145678, 'Banana Bread French Toast', 'Spinach and Feta Stuffed Chicken Breast', 'Lemon Herb Roasted Chicken'),
(158234, 'Breakfast Hash with poached eggs', 'Kale Caesar Salad', 'Pan-Seared Scallops with risotto'),
(169832, 'Sourdough Toast with mashed avocado', 'BLT Sandwich', 'Herb-Crusted Rack of Lamb with roasted root vegetables'),
(177892, 'Fruit and Yogurt Smoothie Bowl', 'Turkey Club Wrap', 'Pesto Grilled Shrimp with orzo salad'),
(184276, 'Buttermilk Biscuits and Gravy', 'Pesto Chicken Panini', 'Grilled Tuna Steak with sesame ginger sauce'),
(197435, 'Bagel Sandwich with scrambled eggs and bacon', 'Asian Chicken Salad', 'Roasted Vegetable Lasagna'),
(209465, 'Quiche Lorraine with mixed greens', 'Greek Salad', 'Baked Stuffed Lobster'),
(215763, 'Strawberry and Cream Cheese Stuffed French Toast', 'Caprese Salad', 'Vegetable Lasagna'),
(227910, 'Chocolate Chip Pancakes', 'Grilled Cheese Sandwich and Tomato Soup', 'Chicken Marsala with garlic mashed potatoes');


INSERT INTO delivery_driver_rating (delivery_driver_rating_id, driver_id, customer_id, feedback, tip)
VALUES
(1011, 235, 1, 'Great service!', '$5'),
(1033, 823, 3, 'Friendly driver', '$3'),
(1055, 399, 5, 'Good communication', '$1'),
(1076, 653, 7, 'Helpful driver', '$2'),
(1059, 279, 9, 'Fast delivery', '$4'),
(1141, 613, 11, 'Professional driver', '$3'),
(1163, 961, 13, 'On-time delivery', '$1'),
(1175, 504, 15, 'Great service!', '$5'),
(1167, 258, 17, 'Friendly driver', '$2'),
(1189, 718, 19, 'Helpful driver', '$3'),
(1271, 489, 2, 'Fast delivery', '$4'),
(1253, 762, 4, 'Professional driver', '$5'),
(1235, 927, 6, 'On-time delivery', '$1'),
(1227, 446, 8, 'Good communication', '$2'),
(1299, 534, 10, 'Friendly driver', '$3'),
(1351, 101, 12, 'Great service!', '$4'),
(1373, 732, 14, 'Helpful driver', '$5'),
(1355, 168, 16, 'Fast delivery', '$1'),
(1357, 847, 18, 'Professional driver', '$2'),
(1379, 258, 20, 'On-time delivery', '$3');
