create database Film
go
USE [Film]
GO

create table Restricted(
	res_id varchar(5) primary key,
	res_name varchar(255) not null,
	res_des varchar(255) not null,
	limit int not null
);
create table Film(
	film_id int primary key identity(1,1),
	film_name varchar(255) not null,
	episode int not null,
	film_year int not null,
	film_nation varchar(255) not null,
	direc varchar(255) not null,
	film_des varchar(255) not null,
	duration int not null,
	res_id varchar(5) FOREIGN KEY(res_id) REFERENCES Restricted(res_id)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);
create table Star(
	star_id int PRIMARY KEY identity(1,1),
	star_name varchar(255) not null,
	star_nation varchar(255) not null
);

create table Subscription(
	plan_id int PRIMARY KEY identity(1,1),
	plan_name varchar(255) not null,
	price float not null,
	limit int not null,
	plan_des varchar(255) not null
);

--user
create table Users(
	user_id int PRIMARY KEY identity(1,1),
	user_name varchar(255) not null,
	mail varchar(255) not null,
	dob date not null,
	--password
	pw varchar(255) not null,
	user_nation varchar(255) not null
);

create table Purchase(
	pur_id int PRIMARY KEY identity(1,1),
	user_id int foreign key(user_id) references Users(user_id) 
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	plan_id int foreign key(plan_id) references Subscription(plan_id)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	buy_date date not null
);

create table Genres(
	genre_id int PRIMARY KEY identity(1,1),
	genre_name varchar(255) not null,
	genre_des varchar(255) not null
);

create table Views(
	view_id int primary key identity(1,1),
	film_id int foreign key(film_id) references Film(film_id) 
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	user_id int foreign key(user_id) references Users(user_id) 
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	status int not null default 0
--	1: like			0:null			-1: dislike
);

create table relation_film_genre(
	film_id int foreign key(film_id) references Film(film_id) 
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	genre_id int foreign key(genre_id) references Genres(genre_id) 
	ON DELETE SET NULL
	ON UPDATE CASCADE,
);

create table relation_film_star(
	film_id int foreign key(film_id) references Film(film_id) 
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	star_id int foreign key(star_id) references Star(star_id) 
	ON DELETE SET NULL
	ON UPDATE CASCADE,
);

insert into Restricted
values('G','General Audiences','All ages admitted',5),
	  ('PG','Parental Guidance Suggested','Some material may not be suitable for children',	9),
	  ('PG-13','Parents Strongly Cautioned','Some material may not inappropriate for children under 13',13),
	  ('R'	,'Restricted'	,'Under 17 requires accompamying parent or adult guardain',	17),
	  ('NC-17',	'No one under 17 and under admitted',	'No one under 17 and under admitted',	18);


insert into Film (film_name,film_year,duration,res_id,film_nation,direc,episode,film_des)
values
('Kobayashi-san Chi no Maid Dragon ',2021,23,'PG-13','Japan','Takemoto Yasuhiro',12,'As office worker Kobayashi gets ready for work, she is greeted by a large dragon right outside her f'),
('Mushoku Tensei',2020,24,'NC-17','Japan','Okamoto Manabu',23,'An unnamed 34-year-old Japanese NEET is evicted from his home following his parents death and skippi'),
('takt op. Destiny',2021,25,'G','Japan','Itou Yuuki',12,'The anime takes place in America in the year 2047, which has fallen to ruin thanks to the D2. Takt, '),
('Fate : Grand Order',2018,26,'R','Japan','Ei Aoki',12,'Part 1 of the main story, later given the title of Fate/Grand Order: Observer on Timeless Temple, co'),
('Violet Evergarden',2018,27,'G','Japan','Akatsuki Kana',14,'In the aftermath of a great war, Violet Evergarden, a young female ex-soldier, gets a job at a write'),
('Konosuba',2016,28,'PG-13','Japan','Takaomi Kanasaki',22,'After dying a laughable and pathetic death on his way back from buying a game, high school student a'),
('Naruto',1999,29,'G','Japan','Masashi Kishimoto',720,'Naruto Uzumaki, a mischievous adolescent ninja, struggles as he searches for recognition and dreams '),
('One Piece',1997,30,'G','Japan','Eiichiro Oda',1000,'The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubbe'),
('One punch man',2015,31,'PG-13','Japan','Natsume Shingo',36,' Saitama and Genos join the Hero Association, but due to scoring low on the written entry exam, Sait'),
('Goblin Slayer',2018,32,'R','Japan','Ozaki Takaharu',12,'In a world of fantasy, adventurers come from far and wide to join the Guild. They complete contracts'),
('Kimetsu no jaiba',2019,33,'R','Japan','Haruo Sotozaki',28,'The story takes place in Taishō-era Japan. It follows Tanjiro Kamado and his sister Nezuko Kamado as'),
('Hacksaw Ridge',2016,139,'R','Australia','Mel Gibson',1,'World War II American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses t'),
('The Amazing Spider-Man',2012,136,'PG-13','USA','Marc Webb',1,'After Peter Parker is bitten by a genetically altered spider, he gains newfound, spider-like powers '),
('The Amazing Spider-Man 2',2014,142,'PG-13','USA','Marc Webb',1,'When New York is put under siege by Oscorp, it is up to Spider-Man to save the city he swore to prot'),
('Batman Begins',2005,140,'PG-13','USA','Christopher Nolan',1,'After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from corrup'),
('The Dark Knight',2008,152,'PG-13','USA','Christopher Nolan',1,'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accep'),
('The Dark Knight Rises',2012,164,'PG-13','USA','Christopher Nolan',1,'Eight years after the Jokers reign of anarchy, Batman, with the help of the enigmatic Catwoman, is f'),
('3 Idiots',2009,170,'PG-13','India','Rajkumar Hirani',1,'Two friends are searching for their long lost companion. They revisit their college days and recall '),
('The Wolverine',2013,126,'PG-13','USA','James Mangold',1,'Wolverine comes to Japan to meet an old friend whose life he saved years ago, and gets embroiled in '),
('Logan',2017,137,'R','USA','James Mangold',1,'In a future where mutants are nearly extinct, an elderly and weary Logan leads a quiet life. But whe'),
('Captain America: The First Avenger',2011,124,'PG-13','USA','Joe Johnston',1,'Steve Rogers, a rejected military soldier, transforms into Captain America after taking a dose of a '),
('Captain Marvel',2019,123,'PG-13','USA','Anna Boden, Ryan Fleck',1,'Carol Danvers becomes one of the universes most powerful heroes when Earth is caught in the middle o'),
('Iron Man',2008,126,'PG-13','USA','Jon Favreau',1,'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponi'),
('Iron Man 2',2010,124,'PG-13','USA','Jon Favreau',1,'With the world now aware of his identity as Iron Man, Tony Stark must contend with both his declinin'),
('The Incredible Hulk',2008,112,'PG-13','USA','Louis Leterrier',1,'Bruce Banner, a scientist on the run from the U.S. Government, must find a cure for the monster he t'),
('Thor',2011,115,'PG-13','USA','Kenneth Branagh',1,'The powerful but arrogant god Thor is cast out of Asgard to live amongst humans in Midgard (Earth), '),
('The Avengers',2012,143,'PG-13','USA','Joss Whedon',1,'Earths mightiest heroes must come together and learn to fight as a team if they are going to stop th'),
('Iron Man 3',2013,130,'PG-13','USA','Shane Black',1,'When Tony Starks world is torn apart by a formidable terrorist called the Mandarin, he starts an ody'),
('Thor: The Dark World',2013,112,'PG-13','USA','Alan Taylor',1,'"When the Dark Elves attempt to plunge the universe into darkness, Thor must embark on a perilous an'),
('Captain America: The Winter Soldier',2014,136,'PG-13','USA','Russo Brothers',1,'As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger')



insert into Genres(genre_name,genre_des)
values('Action','Associated with particular types of spectacle'),
('Adventure','Implies a narrative that is defined by a journey (often including some form of pursuit) and is usual'),
('Biography','A biographical film, or biopic is a film that dramatizes the life of a non-fictional or historically'),
('Comedy','Defined by events that are primarily intended to make the audience laugh'),
('Crime','Films of this genre generally involve various aspects of crime and its detection.'),
('Dark Fantasy','Dark fantasy is a subgenre of fantasy literary, artistic, and cinematic works that incorporate distu'),
('Drama','Focused on emotions and defined by conflict, often looking to reality rather than sensationalism.'),
('Fantasy','Films defined by situations that transcend natural laws and/or by settings inside a fictional univer'),
('Fantasy Comedy','Fantasy comedy films use magic, supernatural or mythological figures for comic purposes. Some fantas'),
('Gag Manga','short jokes, or comedy easy to understand (for little children)'),
('History','A historical film is a fiction film showing past events or set within a historical period. This exte'),
('Horror','A horror film is one that seeks to elicit fear or disgust in its audience for entertainment purposes'),
('Isekai','Isekai is a Japanese genre of light novels, manga, anime and video games that revolve around a perso'),
('Martial Arts','Martial arts films are a genre of action films that feature numerous martial arts combat between cha'),
('Music','Musical film is a film genre in which songs by the characters are interwoven into the narrative, som'),
('Romance','Romance films or romance movies are romantic love stories recorded in visual media for broadcast in '),
('Sci-Fi','Films are defined by a combination of imaginative speculation and a scientific or technological prem'),
('Shounen','Shōnen film also romanized as shonen or shounen, are Japanese anime marketed towards young teen male'),
('Slice Of Life','Slice of life describes the depiction of mundane experiences in art and entertainment. In theater, s'),
('Superhero','A superhero film (or superhero movie) is a film that focuses on the actions of superheroes: individu'),
('Thriller','Thriller film, also known as suspense film or suspense thriller, is a broad film genre that evokes e'),
('War','War film is a film genre concerned with warfare, typically about naval, air, or land battles, with c')

insert into Users(user_name,mail,pw,user_nation,dob)
values
('Tran Trang','trang@gmail.com','9999','Vietnam','01/21/2002'),
('Quoc Anh','quocanh@gmail.com','1452','Vietnam','03/29/2002'),
('Tien','tien@gmail.com','8526','Wjbuland','08/01/2012'),
('Thanh Đat','dat@gmail.com','7423','Vietnam','08/10/2002'),
('Duy','duy@gmail.com','8541','Vietnam','11/29/2002'),
('Duong','duong@gmail.com','8546','Vietnam','10/26/2010'),
('Barack Obama','obama@gmail.com','8451','American','03/31/2000'),
('Donal Trump','trump@gmail.com','9854','American','11/28/1987'),
('Bill Gates','gate@gmail.com','7452','American','01/29/1956'),
('Joe Biden','biden@gmail.com','4524','American','06/30/1978'),
('Haha Ta','hahata@gmail.com','1251','Vietnam','01/29/1956')

insert into Star
values ('Aamir Khan','Indo'),
('Aaron Eckhart','USA'),
('Abe Trott','Australia'),
('Ales Le','Japan'),
('Andrew Garfield','USA'),
('Anne Hathaway','USA'),
('Anthony Hopkins','UK'),
('Ben Mendelsohn','Australia'),
('Brie Larson','USA'),
('Chris Evans','USA'),
('Chris Hemsworth','USA'),
('Christian Bale','UK'),
('Edward Norton','USA'),
('Emma Stone','USA'),
('Fukushima Jun','Japan'),
('Furukawa Makoto','Japan'),
('Guy Pearce','UK'),
('Gwyneth Paltrow','Australia'),
('Hanae natsuki','Japan'),
('Heath Ledger','USA'),
('Hondo Kaede','USA'),
('Hugh Jackman','USA'),
('Hugo Weaving','UK'),
('Ishikawa Kaito','Japan'),
('Ishikawa Yui','Japan'),
('Jamie Foxx','USA'),
('Jeremy Renne','UK'),
('Junko Takeuchi','Japan'),
('Kakuma Ai','Japan'),
('Kawasumi Ayako','Japan'),
('Kazuya Nakai','Japan'),
('Ken Watanabe','Japan'),
('Koyasu Takehito','Japan'),
('Liv Tyler','UK'),
('Luke Bracey','Australia'),
('Madhavan','USA'),
('Mayumi Tanaka','Japan'),
('Michael Caine','UK'),
('Mickey Rourke,','Australia'),
('Mona Singh','USA'),
('Naganawa Maria','Japan'),
('Natalie Portman','UK'),
('Noriaki Sugiyama','Japan'),
('Onna Shinkan','UK'),
('Patrick Stewart','Australia'),
('Rhys Ifans','USA'),
('Robert Downey Jr.','USA'),
('Sam Worthington','USA'),
('Samuel L. Jackson','USA'),
('Scarlett Johansson','USA'),
('Takahashi Rie','Japan'),
('Tao Okamoto','Japan'),
('Terrence Howard','USA'),
('Tim Roth','UK'),
('Tom Hardy','UK'),
('Tom Hiddleston','UK'),
('Uchiyama Kōki','Japan'),
('Uchiyama Yumi','Japan'),
('Will Yun Lee','UK'),
('Yūichirō Umehara','Japan')

insert into Subscription (plan_name,plan_des,price,limit)
values ('Basic','Watch on your mobile only',180000,3),
('Standard','HD available,Watch on your laptop and TV',220000,5),
('Premium','Ultra HD available,Watch on your laptop and TV',260000,10)

insert into Purchase(user_id,plan_id,buy_date)
values (8,1,'06/16/2021'),
(1,1,'04/01/2021'),
(10,3,'01/27/2021'),
(11,3,'10/24/2020'),
(7,3,'10/23/2020'),
(4,3,'08/28/2020'),
(1,3,'07/18/2020'),
(6,2,'05/21/2019'),
(5,3,'11/09/2018'),
(8,3,'09/05/2018'),
(5,3,'08/12/2018'),
(7,1,'07/14/2018'),
(2,2,'05/02/2018'),
(6,2,'04/11/2018')

Insert into Views(film_id,user_id,status)
values(1,1,1),
(12,2,0),
(21,1,-1),
(3,4,1),
(4,1,0),
(6,3,1),
(3,2,1),
(23,6,-1),
(20,1,1),
(17,8,-1),
(1,10,1),
(3,2,0),
(8,7,1),
(9,1,0),
(25,3,1),
(6,7,1),
(7,9,-1),
(18,10,1),
(2,10,0)

insert into relation_film_genre
values (1,4),
(1,8),
(1,19),
(2,2),
(2,8),
(3,15),
(3,1),
(3,8),
(4,1),
(4,8),
(4,12),
(5,16),
(5,7),
(6,8),
(6,4),
(6,13),
(7,2),
(7,9),
(7,14),
(8,18),
(8,2),
(9,1),
(9,10),
(9,20),
(10,6),
(11,2),
(11,6),
(11,14),
(12,3),
(12,7),
(12,11),
(12,22),
(13,1),
(13,2),
(13,8),
(13,17),
(14,1),
(14,2),
(14,8),
(14,17),
(15,1),
(15,5),
(15,7),
(15,21),
(16,1),
(16,5),
(16,7),
(16,21),
(17,1),
(17,5),
(17,7),
(17,21),
(18,4),
(18,7),
(19,1),
(19,17),
(20,1),
(20,7),
(20,17),
(20,21),
(21,1),
(21,2),
(21,17),
(22,1),
(22,2),
(22,17),
(23,1),
(23,2),
(23,17),
(24,1),
(24,2),
(24,17),
(25,1),
(25,2),
(25,17),
(26,1),
(26,2),
(26,8),
(27,1),
(27,2),
(27,17),
(28,1),
(28,2),
(28,17),
(29,1),
(29,2),
(29,8),
(30,1),
(30,2),
(30,17)


insert into relation_film_star
values(1,41),
(2,58),
(2,29),
(3,57),
(3,21),
(4,30),
(5,25),
(5,33),
(6,51),
(6,15),
(7,28),
(7,43),
(8,37),
(8,31),
(9,16),
(9,24),
(10,60),
(10,44),
(11,19),
(11,3),
(11,4),
(12,5),
(12,48),
(12,35),
(13,5),
(13,14),
(13,46),
(14,5),
(14,14),
(14,26),
(15,12),
(15,38),
(15,32),
(16,12),
(16,20),
(16,2),
(17,12),
(17,55),
(17,6),
(18,1),
(18,36),
(18,40),
(19,22),
(19,59),
(19,52),
(20,22),
(20,45),
(21,10),
(21,23),
(21,49),
(22,9),
(22,49),
(22,8),
(23,47),
(23,18),
(23,53),
(24,47),
(24,39),
(24,18),
(25,13),
(25,34),
(25,54),
(26,11),
(26,7),
(26,42),
(27,47),
(27,10),
(27,50),
(27,27),
(27,56),
(27,11),
(28,47),
(28,17),
(28,18),
(29,11),
(29,42),
(29,56),
(30,10),
(30,49),
(30,50)

-----------------------------------------------feature
-------------------------USER

--------User see their profile
create procedure View_Profile @user_ID int
as
begin
	select *
	from Users
	where user_id=@user_ID
end

exec View_Profile 2


----------User see which film they have watched
create procedure View_Watched_film @user_ID int
as
begin
	select film_name,episode,film_year
	from Views
	join Film on Views.film_id=Film.film_id
	where user_id=@user_ID
end

exec View_Watched_film 2


----------User see their purchase plan
create procedure View_Purchased_Plan @user_ID int
as
begin
	select plan_name,plan_des,price,limit
	from Purchase p
	join Subscription s on p.plan_id=s.plan_id
	where user_id=@user_ID
end

exec View_Purchased_Plan 1


------------------------FILM
---------search film by name
create procedure Search_film_name @name varchar(255)
as
begin
	select film_name,episode,film_year
	from film
	where film_name LIKE CONCAT(@name,'%')
end

exec Search_film_name 'Ko'


---------search film by star	
create procedure Search_film_star @star_name varchar(255)
as
begin
	select film.film_name
	from relation_film_star r
	join Star on r.star_id=Star.star_id
	join Film on r.film_id=Film.film_id
	where Star.star_name LIKE CONCAT(@star_name,'%')
end

exec Search_film_star 'Kawasumi A'


---------search film by nation
create procedure Search_film_nation @nation varchar(255)
as
begin
	select film_name,episode,film_year
	from film
	where film_nation LIKE CONCAT(@nation,'%')
end

exec Search_film_nation 'Ja'



--------search film multiple episode or not
create procedure Search_film_episode @multiple int
as
begin
	if @multiple=0
		begin
			select film_name,episode,film_year
			from film
			where episode=1
		end
	else
		begin
			select film_name,episode,film_year
			from film
			where episode!=1
		end
end

exec Search_film_episode 0      ---0 la 1 tap ,1 la phim nhieu tap


------------------search film by genre
create procedure Search_film_genre @genre varchar(255)
as
begin
	select film_name,episode,film_year
	from relation_film_genre r
	join Film on r.film_id=film.film_id
	join Genres on r.genre_id=Genres.genre_id
	where Genres.genre_name LIKE CONCAT(@genre,'%')
end

exec Search_film_genre 'Ise'


-------------search film by year
create procedure Search_film_year @year int
as
begin
	select film_name,episode,film_year
	from film
	where film_year =@year
end

exec Search_film_year 2020


-------------check if user can see the film with their age
create procedure Check_user_age @user_age int, @res_id varchar(255), @t int output
as
begin
	if @user_age < (
		select limit 
		from Restricted
		where res_id=@res_id
	)
		begin
			set @t=0
		end
	else
		begin
			set @t=1
		end
end

declare @res int
exec Check_user_age 17,'R',@res output------ 0 la khong du tuoi 1 la du tuoi xem phim
print @res

-----------------
