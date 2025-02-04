# SQL-Projects

**#Project1. IMDb Dataset Analysis Using PostgreSQL**

**Project Description**

This project focuses on analyzing and extracting valuable insights from the IMDb dataset using PostgreSQL. The dataset consists of movie-related information such as movie names, release years, IMDb ratings, genres, directors, actors, certifications, and box office earnings. The goal is to perform a series of SQL queries to answer specific questions regarding movies, ratings, directors, genres, and financial performance.

**Tasks Performed**

1.Data Extraction: Retrieved all records from the IMDb table to get an overview of the dataset.

2.Selective Data Retrieval: Fetched specific columns like movie names and release years for better readability and analysis.

3.Filtering by Certification: Identified movies with a "UA" certification along with their release year and IMDb rating.

4.High-Rated UA Movies: Extracted movies that are "UA" certified and have an IMDb rating above 8.

5.Genre-Based Analysis: Counted the total number of movies in the "Drama" genre.

6.Director-Based Analysis: Determined the number of movies directed by well-known directors like Quentin Tarantino, Steven Spielberg, Christopher Nolan, and Rajkumar Hirani.

7.IMDb Ratings Insights:

Identified the highest IMDb rating given so far.

Retrieved both the highest and lowest IMDb ratings in separate queries.

Displayed the highest and lowest IMDb ratings in different rows, along with a label indicating whether they are the highest or lowest.

8.Box Office Analysis: Calculated the total box office collection of movies starring Aamir Khan.

9.Average IMDb Rating Analysis: Found the average IMDb rating of movies that were neither directed by certain well-known directors nor starred a specified list of actors.

10.Director-Actor Collaboration: Listed movies that involved both Steven Spielberg and Tom Cruise.

11.Movie Watch Time Analysis:

Displayed movies with an IMDb rating over 9 along with their watch time in both minutes and hours.

Calculated the average IMDb rating of movies released in the last 10 years with a runtime of less than 2 hours.

12.Batman Movie Analysis: Identified the Batman movie that was not directed by Christopher Nolan.

13.Certification and Rating-Based Filtering: Extracted A and UA certified movies directed by either Steven Spielberg or Christopher Nolan, or movies by other directors that have an IMDb rating above 8.

14.Movie Certification Types: Retrieved the distinct movie certification categories present in the dataset.

15.Actor-Based Movie Listing: Displayed movies starring Tom Cruise, ordered by their release year, considering only movies that have a meta score.

16.Genre and Runtime Segmentation:

Classified Drama and Comedy movies released in the last 10 years based on their runtime:

Less than 1 hour: Short Films

Between 1 and 2 hours: Good Watch Time

More than 2 hours: Long Movies

Implemented an alternative solution without using the CASE statement.

17.Christian Bale Movie Analysis: Segregated Christian Bale’s movies based on wh
