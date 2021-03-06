--DDL:  use to create or manipulate DB objects and delete as well
-- Create (Database,table,views, Stored Procedure, functions) , Alter (DB, table, SP etc...), 
-- Drop (DB, table, SP etc..)
/*create database Music; 
drop database Music;
--drop database restaurantDb

if db_id(N'Music') Is not null
drop database Music;
go
create database Music;
go

alter database Music
modify name=MusicDb
*/
Create table Artist(
 artistId int identity(1,1) not null primary key,
 artistName varchar(50) not null,
 age smallint not null default 18,
 activeSince date,
 isAlive bit default 1
);
go 

--Constraints: Not null, unique, primary, foreign key, default, check
--Multiplicity- 1 on 1, 1 to many(*), many to many 
drop table Albums
create table Albums(
    albumId int identity(1,1) primary key,
	albumName varchar(max) not null,
	numofSongs smallint ,
	releaseDate date,
	artistId int not null,
	  --references Artist(artistId)
	genreId varchar(50) null
	   
	    constraint FK_Album_Artist foreign Key (artistId)
		references Artist(artistId)
	on delete cascade --or No ACTION
	on update cascade	-- OR NO ACTION  
);
create schema Music
 alter schema Music 
 transfer dbo.Albums

 create schema Person

 create table Person.Listeners(
 listnerId int identity(1,1) not null,
 email varchar(50) null,
 communicatioPreferences bit default 1,
 age int check(age>=10 and age<=110)
 );

 --create table Genre

 insert into Music.Artist (Age,artistName, isAlive, activeSince) 
 values (40,'Enrique',1,'1999-01-05'),
 (50,'Rick astley',1,'1989-01-05'),
 (35,'Priyanka Chopra',1,'1982-01-05')
 
 select *
 into Artist_Archive
 from Music.Artist

 select * from Artist_Archive

 update Music.Artist
 set age=37
 where artistName='Priyanka Chopra'

delete from Music.Artist

drop table Music.Albums

truncate table Music.Artist

--insert using a select command
insert into Music.Artist(artistName,age,activeSince,isAlive ) 
(select artistName,age,activeSince,isAlive 
 from Artist_Archive) 

--Bulk Insert
 insert into Music.Artist (artistName,activeSince,age,isAlive)
 values
 ('Iron Maiden', '1975-12-25',40,1),
 ('AC/DC', '1973-01-11',45,1),
 ('Buddy Rich','1919-01-01',90,0)

 select * from Music.Artist

 insert into Music.Albums (albumName,numofSongs,releaseDate,artistid,genreId)
 values('coldplay',15,'1995-06-08',2,1)

 ALTER TABLE [Music].[Albums] ALTER COLUMN  artistId int NULL
 ALTER TABLE [Music].[Albums]
DROP Constraint FK_Album_Artist
GO

--to allow to add the foreign key values
ALTER TABLE [Music].[Albums]
ADD CONSTRAINT [New_FK_Album_Artist]
FOREIGN KEY (artistId) REFERENCES Music.Artist(artistId)
ON DELETE CASCADE 
ON UPDATE CASCADE
GO 

 select * from Music.albums

 update Music.albums
 set artistId=1 where 
 genreid=1