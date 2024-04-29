create table users (
	id serial primary key, first_name varchar(50), last_name varchar(50), email varchar(60)
)

insert into users (first_name, last_name, email) values
('Kylen', 'Erley', 'kerley0@umich.edu'),
('Romy', 'Kamall', 'rkamall1@usatoday.com'),
('Cesare', 'MacKimm', 'cmackimm2@qq.com');

create table posts (
	id serial primary key, creator_id int REFERENCES users(id), title varchar(100), textPosts text 
);

insert into posts (creator_id, title, textPosts) values
(2, 'Research Nurse', 'Nunc auctor leo in nisi viverra aliquet. Phasellus aliquet sem purus, nec fermentum elit molestie sit amet. Nullam a aliquet est. Donec mattis ligula at egestas faucibus.'),
(1, 'Database Administrator I', 'Fusce euismod blandit posuere. Aenean sollicitudin maximus mi, nec fermentum lorem feugiat ut. Vivamus sit amet velit enim. '),
(3, 'Account Representative IV', 'Duis maximus molestie dolor eget aliquet.'),
(2, 'Business Systems Development Analyst', 'Vivamus scelerisque aliquet mattis. Sed euismod tortor sed dapibus vehicula. Nunc rutrum ante eget turpis dictum condimentum.'),
(1, 'Web Designer II', 'Curabitur aliquam pellentesque libero, sed molestie tellus ultrices lacinia. Fusce rutrum dui nec nibh imperdiet, non venenatis metus posuere.');

create table likes (
	id serial primary key, user_id int REFERENCES users(id), post_id int REFERENCES posts(id)
);

insert into likes (user_id, post_id) values
(3, 4),
(2, 3),
(1, 2),
(3, 1),
(2, 5);

select first_name, last_name, title, textPosts from posts inner join users
on posts.creator_id = users.id;

select title, first_name, textPosts from posts 
	inner join likes on posts.id = likes.post_id 
	inner join users on posts.creator_id = users.id;
;
