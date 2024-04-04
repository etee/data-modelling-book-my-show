create database book_my_show;
use book_my_show;

CREATE TABLE user (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    phone varchar(10) NOT NULL
);

CREATE TABLE theater (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    address varchar(200) NOT NULL,
    city varchar(100) NOT NULL
);

CREATE TABLE screen (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    theater_id int NOT NULL,
    name varchar(100) NOT NULL,
    no_of_seats int NOT NULL,
    type ENUM ('2D', '3D', 'IMAX')
);

CREATE TABLE movie (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(200) NOT NULL,
    description varchar(500),
    imdb_rating float,
    run_time varchar(20) NOT NULL,
    language varchar(20) NOT NULL,
    genre varchar(50) NOT NULL
);

CREATE TABLE `show` (
    id int PRIMARY KEY AUTO_INCREMENT,
    movie_id int NOT NULL,
    screen_id int NOT NULL,
    theater_id int NOT NULL,
    start_time datetime NOT NULL,
    end_time datetime NOT NULL
);

CREATE TABLE seat (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    seat_type varchar(20) NOT NULL,
    ticket_id int NOT NULL
);

CREATE TABLE ticket (
    id int PRIMARY KEY NOT NULL,
    user_id int NOT NULL,
    show_id int NOT NULL
);

CREATE TABLE cast (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    movie_id int NOT NULL,
    bio varchar(500),
    dob date
);

CREATE TABLE trailer (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    movie_id int NOT NULL,
    src_url varchar(200) NOT NULL
);

CREATE TABLE image (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    movie_id int NOT NULL,
    src_url varchar(200) NOT NULL
);

CREATE TABLE review (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    movie_id int NOT NULL,
    content varchar(1000) NOT NULL,
    rating float,
    user_id int,
    created_at datetime NOT NULL
);

CREATE TABLE payment (
    id int PRIMARY KEY NOT NULL,
    user_id int NOT NULL,
    show_id int NOT NULL,
    status varchar(50) NOT NULL,
    amount float NOT NULL
);


ALTER TABLE `screen` ADD FOREIGN KEY (`theater_id`) REFERENCES `theater` (`id`);

ALTER TABLE `show` ADD FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

ALTER TABLE `show` ADD FOREIGN KEY (`screen_id`) REFERENCES `screen` (`id`);

ALTER TABLE `show` ADD FOREIGN KEY (`theater_id`) REFERENCES `theater` (`id`);

ALTER TABLE `seat` ADD FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`);

ALTER TABLE `ticket` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `ticket` ADD FOREIGN KEY (`show_id`) REFERENCES `show` (`id`);

ALTER TABLE `cast` ADD FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

ALTER TABLE `trailer` ADD FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

ALTER TABLE `image` ADD FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

ALTER TABLE `review` ADD FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

ALTER TABLE `review` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`show_id`) REFERENCES `show` (`id`);
