drop table if exists imdb_top_movies;
create table if not exists imdb_top_movies
(
	Poster_Link		varchar(4000),
	Series_Title	varchar(1000),
	Released_Year	varchar(10),
	Certificate		varchar(10),
	Runtime			varchar(20),
	Genre			varchar(50),
	IMDB_Rating		decimal,
	Overview		varchar(4000),
	Meta_score		int,
	Director		varchar(200),
	Star1			varchar(200),
	Star2			varchar(200),
	Star3			varchar(200),
	Star4			varchar(200),
	No_of_Votes		bigint,
	Gross			money
);

select * from imdb_top_movies;



-- Solve the below problems using IMDB dataset:

1) Fetch all data from imdb table 
2) Fetch only the name and release year for all movies.
3) Fetch the name, release year and imdb rating of movies which are UA certified.
4) Fetch the name and genre of movies which are UA certified and have a Imdb rating of over 8.
5) Find out how many movies are of Drama genre.
6) How many movies are directed by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and "Rajkumar Hirani".
7) What is the highest imdb rating given so far?
8) What is the highest and lowest imdb rating given so far?
8a) Solve the above problem but display the results in different rows.
8b) Solve the above problem but display the results in different rows. And have a column which indicates the value as lowest and highest.
9) Find out the total business done by movies staring "Aamir Khan".
10) Find out the average imdb rating of movies which are neither directed by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and are not acted by any of these stars "Christian Bale", "Liam Neeson", "Heath Ledger", "Leonardo DiCaprio", "Anne Hathaway".

11) Mention the movies involving both "Steven Spielberg" and "Tom Cruise".
--12) Display the movie name and watch time (in both mins and hours) which have over 9 imdb rating.
13) What is the average imdb rating of movies which are released in the last 10 years and have less than 2 hrs of runtime.
14) Identify the Batman movie which is not directed by "Christopher Nolan".
15) Display all the A and UA certified movies which are either directed by "Steven Spielberg", "Christopher Nolan" or which are directed by other directors but have a rating of over 8.
--16) What are the different certificates given to movies?
17) Display all the movies acted by Tom Cruise in the order of their release. Consider only movies which have a meta score.
--18) Segregate all the Drama and Comedy movies released in the last 10 years as per their runtime. Movies shorter than 1 hour should be termed as short film. Movies longer than 2 hrs should be termed as longer movies. All others can be termed as Good watch time.
19) Write a query to display the "Christian Bale" movies which released in odd year and even year. Sort the data as per Odd year at the top.
20) Re-write problem #18 without using case statement.



-- Extra Assignment:
1) Split the value '1234_1234' into 2 seperate columns having 1234 each.

2) We see a string value 'PG' in released_year and we hardcoaded it, can we make a query dynamic to identify string value incase if we have multiple string values in-order to ignore those string values
 Write a query to identify non numeric values in a column.


1) Fetch all data from imdb table

select * from imdb_top_movies;


2) Fetch only the name and release year for all movies.

select series_title, released_year
from imdb_top_movies;

3) Fetch the name, release year and imdb rating of movies which are UA certified.

select series_title, released_year, imdb_rating
from imdb_top_movies
where certificate = 'UA';

4) Fetch the name and genre of movies which are UA certified and have a Imdb rating of over 8.

select series_title, genre, imdb_rating
from imdb_top_movies
where certificate = 'UA' AND imdb_rating > 8;

5) Find out how many movies are of Drama genre.

select count(*)
from imdb_top_movies
where genre like '%Drama%'; --724

6) How many movies are directed by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and "Rajkumar Hirani".

select count(*)
from imdb_top_movies
where director in ('Quentin Tarantino','Steven Spielberg','Christopher Nola' ,'Rajkumar Hirani'); --25

select count(1) 
from imdb_top_movies 
where director in ('Quentin Tarantino', 'Steven Spielberg', 'Christopher Nolan', 'Rajkumar Hirani'); --33

7) What is the highest imdb rating given so far?

select max(imdb_rating) as max_rating
from imdb_top_movies ;

8) What is the highest and lowest imdb rating given so far?

select max(imdb_rating) as highest_rating, min(imdb_rating) as lowest_rating
from imdb_top_movies ;


8a) Solve the above problem but display the results in different rows.(highest and lowest rating of movies)

select max(imdb_rating) as highest_rating
from imdb_top_movies 
union
select min(imdb_rating) as lowest_rating
from imdb_top_movies ;

8b) Solve the above problem but display the results in different rows. And have a column which indicates the value as lowest and highest.

select max(imdb_rating) as movie_rating, 'Highest rating' as high_low
from imdb_top_movies
union  
select min(imdb_rating) , 'Lowest rating' as high_low
from imdb_top_movies;


9) Find out the total business done by movies staring "Aamir Khan".

select sum(gross)
from imdb_top_movies
where star1='Aamir Khan' or star2='Aamir Khan' or star3='Aamir Khan' or star4='Aamir Khan';

select sum(gross)
from imdb_top_movies
where 'Aamir Khan' IN (star1, star2, star3, star4);


10) Find out the average imdb rating of movies which are neither directed by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and are not acted by any of these stars "Christian Bale", "Liam Neeson", "Heath Ledger", "Leonardo DiCaprio", "Anne Hathaway".

select avg(imdb_rating) as avg_rating
from imdb_top_movies 
where director not in ('Quentin Tarantino', 'Steven Spielberg', 'Christopher Nolan' )
and (star1 not in ('Christian Bale', 'Liam Neeson', 'Heath Ledger', 'Leonardo DiCaprio', 'Anne Hathaway')
	and star2 not in ('Christian Bale', 'Liam Neeson', 'Heath Ledger', 'Leonardo DiCaprio', 'Anne Hathaway')
	and star3 not in ('Christian Bale', 'Liam Neeson', 'Heath Ledger', 'Leonardo DiCaprio', 'Anne Hathaway')
	and star4 not in ('Christian Bale', 'Liam Neeson', 'Heath Ledger', 'Leonardo DiCaprio', 'Anne Hathaway')
	);

11) Mention the movies involving both "Steven Spielberg" and "Tom Cruise".

select * from imdb_top_movies
where director = 'Steven Spielberg'
and (star1 = 'Tom Cruise'
	or star2 = 'Tom Cruise'
	or star3 = 'Tom Cruise'
	or star4 = 'Tom Cruise');


12) Display the movie name and watch time (in both mins and hours) which have over 9 imdb rating.

select series_title as movie_name, runtime as runtime_mins, 
--, runtime / 60 as runtime_hours
replace (runtime, ' min', '' ),
round(cast(replace(runtime, ' min', '')as decimal)/60, 2) as runtime_hours
--, replace(runtime, ' min', '') :: int
from imdb_top_movies
where imdb_rating > 9;

13) What is the average imdb rating of movies which are released in the last 10 years and have less than 2 hrs of runtime.

select round(avg(imdb_rating),2) as avg_rating
from imdb_top_movies
where released_year > (extract(year from current_date) - 10):: varchar
and replace (runtime, ' min', '' ) :: int<=120 
--and released_year <> 'PG'


14) Identify the Batman movie which is not directed by "Christopher Nolan".
select * from imdb_top_movies
where upper(series_title) like '%BATMAN%'
and director <> 'Christopher Nolan';


15) Display all the A and UA certified movies which are either directed by "Steven Spielberg", "Christopher Nolan" or which are directed by other directors but have a rating of over 8.

select * from imdb_top_movies
where certificate in ('A','UA')
and (director in ('Steven Spielberg', 'Christopher Nolan')
	 or 
		 (director not in ('Steven Spielberg', 'Christopher Nolan')
		  and imdb_rating > 8
		 )
	);



16) What are the different certificates given to movies?

select distinct certificate
from imdb_top_movies
order by 1;

select distinct certificate
from imdb_top_movies
order by certificate;



17) Display all the movies acted by Tom Cruise in the order of their release. Consider only movies which have a meta score.
select * from imdb_top_movies
where meta_score is not null
and (star1 = 'Tom Cruise'
	or star2 = 'Tom Cruise'
	or star3 = 'Tom Cruise'
	or star4 = 'Tom Cruise')
order by released_year;


18) Segregate all the Drama and Comedy movies released in the last 10 years as per their runtime. 
Movies shorter than 1 hour should be termed as short film. Movies longer than 2 hrs should be termed as longer movies. 
All others can be termed as Good watch time.

select series_title, 
round(cast(replace(runtime, ' min', '')as decimal)/60,2) as runtime_hrs,
case when round(cast(replace(runtime, ' min', '')as decimal)/60,2)<1 then 'Short Film'
     when round(cast(replace(runtime, ' min', '')as decimal)/60,2)>2 then 'Longer Movies'
     else 'Good watch time' end as category
from imdb_top_movies
where (lower(genre)like '%drama%' Or lower(genre) like '%comedy%')
and released_year > (extract(year from current_date) - 10):: varchar
order by category;



19) Write a query to display the "Christian Bale" movies which released in odd year and even year. Sort the data as per Odd year at the top.

select series_title as movie_name, released_year
, case when released_year::int%2 = 0 then 'Even year' else 'Odd year' end as odd_or_even
from imdb_top_movies
where released_year <> 'PG'
and (star1 = 'Christian Bale'
	or star2 = 'Christian Bale'
	or star3 = 'Christian Bale'
	or star4 = 'Christian Bale')
order by odd_or_even desc;


20) Re-write problem #18 without using case statement.

select series_title as movie_name, 'Short film' as category
,round(replace(runtime, ' min', '')::decimal /60,2) as runtime
from imdb_top_movies
where released_year <> 'PG'
and extract(year from current_date ) - released_year::int <= 10
and (upper(genre) like '%DRAMA%' 
    or lower(genre) like '%comedy%')
and round(replace(runtime, ' min', '')::decimal /60,2) < 1
	UNION ALL
select series_title as movie_name, 'Longer Movies' as category
,round(replace(runtime, ' min', '')::decimal /60,2) as runtime
from imdb_top_movies
where released_year <> 'PG'
and extract(year from current_date ) - released_year::int <= 10
and (upper(genre) like '%DRAMA%' 
    or lower(genre) like '%comedy%')
and round(replace(runtime, ' min', '')::decimal /60,2) > 2
	UNION ALL
select series_title as movie_name, 'Good watch time' as category
,round(replace(runtime, ' min', '')::decimal /60,2) as runtime
from imdb_top_movies
where released_year <> 'PG'
and extract(year from current_date ) - released_year::int <= 10
and (upper(genre) like '%DRAMA%' 
    or lower(genre) like '%comedy%')
and round(replace(runtime, ' min', '')::decimal /60,2) between 1 and 2
order by category;
























