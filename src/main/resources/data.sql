
-- create database charity_donation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

insert into category(name) values ('ubrania, które nadają się do ponownego użycia');
insert into category(name) values ('ubrania, do wyrzucenia');
insert into category(name) values ('zabawki');
insert into category(name) values ('książki');
insert into category(name) values ('inne');

insert into institution(name, description) values('Fundacja "Dbam o Zdrowie"', 'Cel i misja: Pomoc dzieciom z ubogich rodzin.');
insert into institution(name, description) values('Fundacja "A kogo"', 'Cel i misja: Pomoc wybudzaniu dzieci ze śpiączki.');
insert into institution(name, description) values('Fundacja “Dla dzieci"', 'Cel i misja: Pomoc osobom znajdującym się w trudnej sytuacji życiowej.
');
insert into institution(name, description) values('Fundacja “Bez domu”
', 'Cel i misja: Pomoc dla osób nie posiadających miejsca zamieszkania');
insert into institution(name, description) values('Fundacja “Siemacha”
', 'Cel i misja: Pomoc dla młodych i bezdomnych');

insert into donation(city, pick_up_comment, pick_up_time, pick_up_date, quantity, street, zip_code, institution_id)
values ('Kraków', 'rano', 080000, 20220609, 1, 'Geremka', '30-389', 1);
insert into donation(city, pick_up_comment, pick_up_time, pick_up_date, quantity, street, zip_code, institution_id)
values ('Warszawa', 'popołudniu', 174500, 20220610, 2, 'Piłsudskiego', '00-900', 2);
insert into donation(city, pick_up_comment, pick_up_time, pick_up_date, quantity, street, zip_code, institution_id)
values ('Wrocław', 'popołudniu', 155000, 20220611, 3, 'Herberta', '11-111', 3);