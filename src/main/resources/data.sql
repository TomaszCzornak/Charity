
# create charity_donation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


insert into category(name) values ('ubrania');
insert into category(name) values ('zabawki');
insert into category(name) values ('sprzęt i inne');



insert into donation(city, pick_up_comment, pick_up_time, pick_up_date, quantity, street, zip_code, institution_id)
values ('Kraków', 'rano', 1600, 20220609, 1, 'Geremka', '30-389', 1);