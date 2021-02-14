create DATABASE iEgypt;

go

use iEgypt;

CREATE TABLE [User] (
ID INT PRIMARY KEY IDENTITY,
email varchar(50) unique,
first_name varchar(50),
middle_name varchar(50),
last_name varchar(50),
birth_date DATE,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)),
[password] varchar(50),
deactivation_date date
);

CREATE TABLE Viewer (
ID INT PRIMARY KEY,
working_place varchar(50),
working_place_type varchar(50),
working_place_description varchar(300),
FOREIGN KEY(ID) REFERENCES [User] ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Notified_Person (
ID INT identity PRIMARY KEY
);

CREATE TABLE Contributor (
ID INT PRIMARY KEY,
years_of_experience INT,
portfolio_link varchar(300),
specialization varchar(50), 
notified_id INT,
FOREIGN KEY(ID) REFERENCES [User] ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(notified_id) REFERENCES Notified_Person ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Staff (
ID INT PRIMARY KEY,
hire_date DATE,
working_hours INT,
payment_rate DECIMAL(15,2),
total_salary AS (payment_rate*working_hours),
notified_id INT,
FOREIGN KEY(ID) REFERENCES [User] ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(notified_id) REFERENCES Notified_Person ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Content_type (
[type] varchar(50) primary key
);

CREATE TABLE Content_manager (
ID INT PRIMARY KEY,
[type] varchar(50),
FOREIGN KEY(ID) REFERENCES Staff ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY([type]) REFERENCES Content_type ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Reviewer (
ID INT PRIMARY KEY,
FOREIGN KEY(ID) REFERENCES [User] ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [Message] (
sent_at DATE,
contributer_id INT,
viewer_id INT,
sender_type varchar(50),
read_at DATE,
[text] varchar(300),
read_status bit,
PRIMARY KEY(sent_at, contributer_id, viewer_id, sender_type),
FOREIGN KEY(contributer_id) REFERENCES Contributor ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY(viewer_id) REFERENCES Viewer ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Category (
[type] varchar(50) PRIMARY KEY,
[description] varchar(300)
);

CREATE TABLE Sub_Category (
category_type varchar(50),
[name] varchar(50),
PRIMARY KEY(category_type, [name]),
FOREIGN KEY(category_type) REFERENCES Category ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Notification_Object (
ID INT PRIMARY KEY IDENTITY
);

CREATE TABLE Content (
ID INT PRIMARY KEY IDENTITY,
link varchar(300),
uploaded_at DATETIME,
contributer_id INT,
category_type varchar(50),
subcategory_name varchar(50),
[type] varchar(50),
FOREIGN KEY(contributer_id) REFERENCES Contributor ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY([type]) REFERENCES Content_type ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY(category_type, subcategory_name) REFERENCES Sub_Category ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Original_Content (
ID INT PRIMARY KEY,
content_manager_id INT,
reviewer_id INT,
review_status bit,
filter_status bit,
FOREIGN KEY(ID) REFERENCES Content ON DELETE CASCADE ON UPDATE NO ACTION,
FOREIGN KEY(reviewer_id) REFERENCES Reviewer ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY(content_manager_id) REFERENCES Content_manager ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Existing_Request (
id INT PRIMARY KEY IDENTITY,
original_content_id INT, 
viewer_id INT,
FOREIGN KEY(original_content_id) REFERENCES Original_Content ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(viewer_id) REFERENCES Viewer ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE New_Request (
id INT PRIMARY KEY IDENTITY,
accept_status bit,
specified bit,
information varchar(50),
viewer_id INT,
notif_obj_id INT,
contributer_id INT,
accepted_at datetime,
FOREIGN KEY(viewer_id) REFERENCES Viewer ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY(notif_obj_id) REFERENCES Notification_Object ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY(contributer_id) REFERENCES Contributor ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE New_Content (
ID INT PRIMARY KEY,
new_request_id INT,
FOREIGN KEY(ID) REFERENCES Content ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(new_request_id) REFERENCES New_Request ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Comment (
Viewer_id INT, 
original_content_id INT,
[date] DATETIME,
[text] varchar(300),
PRIMARY KEY(Viewer_id, original_content_id, date),
FOREIGN KEY(Viewer_id) REFERENCES Viewer ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY(original_content_id) REFERENCES Original_Content ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Rate (
viewer_id INT,
original_content_id INT,
[date] DATETIME,
rate INT check(rate >= 0 and rate <= 5),
PRIMARY KEY(viewer_id, original_content_id),
FOREIGN KEY(viewer_id) REFERENCES Viewer ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(original_content_id) REFERENCES Original_Content ON DELETE CASCADE ON UPDATE NO ACTION
);

GO
create function Average_Rating (@needed_ID int)
returns Decimal(2,1)
AS
begin
declare @temp decimal(2,1)
select @temp=(AVG(rate)) from rate where @needed_ID=original_content_id
return @temp
end
GO

ALTER TABLE Original_Content ADD rating AS dbo.Average_Rating(ID);

CREATE TABLE [Event] (
id INT PRIMARY KEY IDENTITY,
[description] varchar(300),
[location] varchar(50),
city varchar(50),
[time] DATETIME,
entertainer varchar(50),
notification_object_id INT,
viewer_id INT,
FOREIGN KEY(notification_object_id) REFERENCES Notification_Object ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY(viewer_id) REFERENCES Viewer ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Event_Photos_link (
event_id INT,
link varchar(300),
PRIMARY KEY(event_id, link),
FOREIGN KEY(event_id) REFERENCES [Event] ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Event_Videos_link (
event_id INT,
link varchar(300),
PRIMARY KEY(event_id, link),
FOREIGN KEY(event_id) REFERENCES [Event] ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Advertisement (
id INT PRIMARY KEY IDENTITY,
[description] varchar(300),
[location] varchar(50),
event_id INT,
viewer_id INT,
FOREIGN KEY(event_id) REFERENCES [Event] ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(viewer_id) REFERENCES Viewer ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Ads_Video_Link (
advertisement_id INT,
link varchar(300),
PRIMARY KEY(advertisement_id, link),
FOREIGN KEY(advertisement_id) REFERENCES Advertisement ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Ads_Photos_Link (
advertisement_id INT,
link varchar(300),
PRIMARY KEY(advertisement_id, link),
FOREIGN KEY(advertisement_id) REFERENCES Advertisement ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Announcement (
ID INT PRIMARY KEY IDENTITY,
seen_at DATE,
sent_at DATE,
notified_person_id INT,
notification_object_id INT,
FOREIGN KEY(notified_person_id) REFERENCES Notified_Person ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(notification_object_id) REFERENCES Notification_Object ON DELETE CASCADE ON UPDATE CASCADE
);

--Data Insertion
-- Part 1
INSERT INTO Category values ('Music','Everything related to music is in this section.');
INSERT INTO Category values ('Movies','All you need to know about movies is here.');
INSERT INTO Category values ('Books','If you love to read this section is all about books.');
INSERT INTO Sub_Category values ('Music','House');
INSERT INTO Sub_Category values ('Music','Rock');
INSERT INTO Sub_Category values ('Music','Other');
-- Part 2
INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Karim.Hassan@gmail.com','Karim','Mohammed','Hassan','12/10/1982','abcd1234'); 
INSERT INTO Viewer (ID, working_place  , working_place_type , working_place_description) 
			values (1 , 'Vodafone','Telecomunication Company','Provides mobile and internet services.');

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('George.Ramy@gmail.com','George','Ramzi','Rami','9/11/1973','password'); 
INSERT INTO Viewer (ID, working_place  , working_place_type , working_place_description) 
			values (2 , 'Toyota','Vehicle Company','Manufactures vehicles of different kinds.');

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Abdulrahman.Ibrahim@hotmail.com','Abdulrahman','Mohammed','Ibrahim','3/15/1962','football'); 
INSERT INTO Viewer (ID,working_place  , working_place_type , working_place_description) 
			values (3 , 'Panda','SuperMarket','Sells everyday groceries.');

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Rana.Sheirf@gmail.com','Rana','Yacer','Sherif','4/18/1987','qwerty12345'); 
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Contributor(ID, years_of_experience, portfolio_link, specialization, notified_id) 
				values (4 , 5,'portofolio.com/link/rana.sheirf', 'Music', 1);

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Shady.Ahmed@gmail.com','Shady','Galal','Ahmed','5/5/1955','watermelon'); 
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Contributor(ID, years_of_experience, portfolio_link, specialization, notified_id) 
				values (5 , 30,'portofolio.com/link/shady.ahmed', 'Finance', 2);

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Dina.Mohammed@gmail.com','Dina','Hussein','Mohammed','12/10/1990','passw0rd'); 
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Contributor(ID, years_of_experience, portfolio_link, specialization, notified_id) 
				values (6 , 2,'portofolio.com/link/dina.mohammed', 'Arts', 3);

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Karim.Shehab@gmail.com','Karim','Abdelmohsen','Shehab','12/2/1984','letmein'); 
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Contributor(ID, years_of_experience, portfolio_link, specialization, notified_id) 
				values (7 , 6,'portofolio.com/link/karim.shehab', 'Sports', 4);

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Yasmeen.Hatem@hotmail.com','Yasmeen','Hatem','Ahmed','1/1/1975','abcd1234'); 
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Contributor(ID, years_of_experience, portfolio_link, specialization, notified_id) 
				values (8 , 12,'portofolio.com/link/yasmeen.hatem', 'Politics', 5);

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Jamal.Yasser@hotmail.com','Jamal','Karim','Yasser','5/7/1982','1234567'); 
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Staff (ID , hire_date, working_hours, payment_rate, notified_id)
			values(9, '6/17/2007',7, 18,6);
INSERT INTO Reviewer values (9);

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Omnia.Samir@gmail.com','Omnia','Hassan','Samir','12/9/1987','abcd1234'); 
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Staff (ID , hire_date, working_hours, payment_rate, notified_id)
			values(10, '12/29/2004',6, 24,7);
INSERT INTO Reviewer values (10);

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Zeyad.Labib@gmail.com','Zeyad','Kamal','Labib','12/12/1986','admin');
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Staff (ID , hire_date, working_hours, payment_rate, notified_id)
			values( 11 , '10/10/2005', 7, 50, 8);
INSERT INTO Content_type values ('Finance');
INSERT INTO Content_manager values (11,'Finance');

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Farida.Gamal@hotmail.com','Farida','Abdelhameed','Gamal','4/27/1979','StarWars');
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Staff (ID , hire_date, working_hours, payment_rate, notified_id)
			values( 12 , '1/12/2012', 8, 20, 9);
INSERT INTO Content_type values ('Politics');
INSERT INTO Content_manager values (12,'Politics');

INSERT INTO [User] (email, first_name, middle_name, last_name, birth_date,[password])
			values ('Maria.Soliman@gmail.com','Maria','Wafeek','Soliman','12/12/1986','zxcvbnm');
INSERT INTO Notified_Person DEFAULT VALUES;
INSERT INTO Staff (ID , hire_date, working_hours, payment_rate, notified_id)
			values( 13 , '1/1/2015', 6, 10, 10);
INSERT INTO Content_type values ('Music');
INSERT INTO Content_manager values (13, 'Music');
-- Part 3
INSERT INTO Content(link, uploaded_at,contributer_id, category_type, subcategory_name, [type])
			values ('mywebsite.net/housemusic', '9/11/1989', 4, 'Music', 'House', 'Music');
INSERT INTO Original_Content  (ID , content_manager_id, reviewer_id,review_status, filter_status)
						values(1  , 13, 9,1,1);
INSERT INTO Rate values (1,1,'10/6/1989',5);
INSERT INTO Existing_Request (original_content_id, viewer_id) 
					  values (1, 1);

INSERT INTO Content(link, uploaded_at,contributer_id, category_type, subcategory_name, [type])
			values ('mywebsite.net/rockmusic', '6/18/1989', 4, 'Music', 'Rock', 'Music');
INSERT INTO Original_Content  (ID , content_manager_id, reviewer_id,review_status, filter_status)
						values(2  , 13, 9,1,1);
INSERT INTO Rate values (2,2,'10/6/1989',5);
INSERT INTO Existing_Request (original_content_id, viewer_id) 
					  values (1, 3);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)
				values (1,1,'What are some kinds of arts that are not popular.',1,1,6);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)
				values (1,1,'Talk about the evolution of art drawing.',2,2,6);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO Content(link, uploaded_at, contributer_id, category_type, subcategory_name , [type])
			values ('mywebsite.com/music/musiconbrain','2/16/2006',4,'Music','Other','Music');
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)
				values (1,1,'Tell us more about music and its effect on brain.',3,3,4);
INSERT INTO New_Content values(3 , 3);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO Content(link, uploaded_at, contributer_id, category_type, subcategory_name , [type])
			values ('mywebsite.com/music/startofmusic','9/24/2009',4,'Music','Other','Music')
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)
				values (1,1,'Write about how music started.',1,4,4);
INSERT INTO New_Content values (4 , 4);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO Content(link, uploaded_at, contributer_id, category_type, subcategory_name , [type])
			values ('mywebsite.com/music/musicaddiction','4/14/2012',4,'Music','Other','Music')
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)
				values (1,1,'Tell me more about why some music is addicitve.',2,5,4);
INSERT INTO New_Content values (5 , 5);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)
				values (1,1,'More about financial advice for midlife',3,6,5);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)
				values (1,1,'How do you like the new president.',1,7,8);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)
				values (1,1,'What are some new sports to try.',2,8,7);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id)
				values (0,0,'Why is the country trash?!',3,9);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id)
				values (0,0,'BARCELONA IS THE WORST TEAM EVER',1,10);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO New_Request(accept_status, specified, information, viewer_id, notif_obj_id)
				values (0,0,'Your page is useless delete please.',2,11);
--Part 4

INSERT INTO Content (link, uploaded_at, contributer_id, category_type, subcategory_name , [type])
values ('mywebsite.com/RockMusic','8/1/2009',7,'Music','Rock','Music');
INSERT INTO Original_Content values (6, 11, 10, 1, 1);
INSERT INTO Rate values (2,6,'8/2/2009',4);

INSERT INTO Content (link, uploaded_at, contributer_id, category_type, subcategory_name , [type])
values ('mywebsite.com/Housemusic','8/1/2004',7,'Music','House','Music');
INSERT INTO Original_Content values (7, 11, 9, 1, 1);
INSERT INTO Rate values (1,7,'9/1/2004',5);

INSERT INTO Content (link, uploaded_at, contributer_id, category_type, subcategory_name , [type])
values ('mywebsite.com/Othermusic','8/1/2006',7,'Music','Other','Music');
INSERT INTO Original_Content values (8, 12, 10, 1, 1);
INSERT INTO Rate values (2,8,'8/2/2006',4);
--Part 5
INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO [Event] ([description], [location], city, [time], entertainer, notification_object_id, viewer_id)
values('Gathering to watch football match','St 12 Apartment 3 2nd floor','Berlin','19:30','Mario Adorf',12,1);

INSERT INTO Notification_Object DEFAULT VALUES;
INSERT INTO [Event] ([description], [location], city, [time], entertainer, notification_object_id, viewer_id)
			  values('Speech about the story of speakers success','90 St. Sky mall 3rd floor room number 36','Cairo','6:30','Mo Salah',13,3);
--Part 6
INSERT INTO Announcement values ('11/12/2005', '11/2/2001', 1, 12);
INSERT INTO Announcement values ('9/7/2014', '5/30/2009', 1, 13);
INSERT INTO Announcement values ('7/8/2016', '3/8/2006', 2, 12);
INSERT INTO Announcement values ('6/26/2015', '10/15/2013', 2, 13);
INSERT INTO Announcement values ('2/16/2015', '7/4/2011', 3, 12);
INSERT INTO Announcement values ('8/20/2016', '8/18/2015', 3, 13);
INSERT INTO Announcement values ('5/11/2010', '11/3/2003', 4, 12);
INSERT INTO Announcement values ('4/24/2014', '5/3/2008', 4, 13);
INSERT INTO Announcement values ('5/17/2009', '10/4/2002', 5, 12);
INSERT INTO Announcement values ('3/16/2014', '5/24/2008', 5, 13);
INSERT INTO Announcement values ('7/11/2017', '11/19/2013', 6, 12);
INSERT INTO Announcement values ('7/7/2017', '2/23/2006', 6, 13);
INSERT INTO Announcement values ('9/16/2012', '10/12/2007', 7, 12);
INSERT INTO Announcement values ('3/2/2011', '2/8/2001', 7, 13);
INSERT INTO Announcement values ('4/16/2007', '3/5/2002', 8, 12);
INSERT INTO Announcement values ('3/24/2014', '3/7/2000', 8, 13);
INSERT INTO Announcement values ('7/23/2009', '10/11/2007', 9, 12);
INSERT INTO Announcement values ('5/27/2011', '6/4/2001', 9, 13);
INSERT INTO Announcement values ('1/7/2012', '3/20/2000', 10, 12);
INSERT INTO Announcement values ('3/29/2016', '5/3/2008', 10, 13);
INSERT INTO Announcement values ('9/12/2017', '6/22/2017', 1, 1);
INSERT INTO Announcement values ('7/12/2017', '7/4/2017', 1, 2);
INSERT INTO Announcement values ('10/5/2016', '3/4/2016', 1, 3);
INSERT INTO Announcement values ('7/5/2010', '2/23/2005', 1, 4);
INSERT INTO Announcement values ('3/14/2008', '7/9/2002', 1, 5);
INSERT INTO Announcement values ('3/28/2013', '5/6/2007', 1, 6);
INSERT INTO Announcement values ('11/11/2008', '7/28/2008', 1, 7);
INSERT INTO Announcement values ('7/4/2017', '9/30/2006', 1, 8);
INSERT INTO Announcement values ('1/4/2016', '5/17/2004', 1, 9);
INSERT INTO Announcement values ('11/14/2005', '10/8/2005', 1, 10);
INSERT INTO Announcement values ('6/30/2013', '4/18/2008', 1, 11);
INSERT INTO Announcement values ('3/28/2005', '1/18/2005', 2, 1);
INSERT INTO Announcement values ('2/20/2016', '4/3/2015', 2, 2);
INSERT INTO Announcement values ('9/9/2016', '6/27/2015', 2, 3);
INSERT INTO Announcement values ('9/22/2016', '8/1/2016', 2, 4);
INSERT INTO Announcement values ('9/4/2015', '8/1/2002', 2, 5);
INSERT INTO Announcement values ('12/3/2015', '11/29/2015', 2, 6);
INSERT INTO Announcement values ('10/23/2009', '9/27/2009', 2, 7);
INSERT INTO Announcement values ('5/16/2015', '4/22/2015', 2, 8);
INSERT INTO Announcement values ('5/7/2009', '6/16/2002', 2, 9);
INSERT INTO Announcement values ('11/18/2008', '8/17/2008', 2, 10);
INSERT INTO Announcement values ('10/21/2014', '4/17/2014', 2, 11);
INSERT INTO Announcement values ('2/2/2010', '6/11/2006', 3, 1);
INSERT INTO Announcement values ('7/24/2011', '8/29/2011', 3, 2);
INSERT INTO Announcement values ('8/24/2010', '2/26/2010', 3, 3);
INSERT INTO Announcement values ('9/11/2005', '7/24/2003', 3, 4);
INSERT INTO Announcement values ('3/15/2014', '1/7/2013', 3, 5);
INSERT INTO Announcement values ('4/3/2012', '1/7/2007', 3, 6);
INSERT INTO Announcement values ('11/4/2010', '8/1/2008', 3, 7);
INSERT INTO Announcement values ('7/30/2015', '10/6/2006', 3, 8);
INSERT INTO Announcement values ('10/27/2016', '7/1/2016', 3, 9);
INSERT INTO Announcement values ('2/28/2008', '4/13/2006', 3, 10);
INSERT INTO Announcement values ('4/10/2015', '3/18/2015', 3, 11);
INSERT INTO Announcement values ('7/15/2012', '6/8/2012', 4, 1);
INSERT INTO Announcement values ('2/25/2013', '8/5/2002', 4, 2);
INSERT INTO Announcement values ('11/13/2017', '10/17/2017', 4, 3);
INSERT INTO Announcement values ('2/24/2011', '10/22/2009', 4, 4);
INSERT INTO Announcement values ('9/18/2014', '6/1/2014', 4, 5);
INSERT INTO Announcement values ('9/28/2012', '9/16/2012', 4, 6);
INSERT INTO Announcement values ('8/14/2015', '7/26/2015', 4, 7);
INSERT INTO Announcement values ('11/4/2007', '10/20/2007', 4, 8);
INSERT INTO Announcement values ('10/7/2016', '8/14/2000', 4, 9);
INSERT INTO Announcement values ('7/6/2013', '5/12/2013', 4, 10);
INSERT INTO Announcement values ('9/13/2012', '8/27/2012', 4, 11);
INSERT INTO Announcement values ('8/2/2014', '3/2/2007', 5, 1);
INSERT INTO Announcement values ('9/26/2008', '8/4/2008', 5, 2);
INSERT INTO Announcement values ('4/15/2017', '3/25/2017', 5, 3);
INSERT INTO Announcement values ('6/2/2008', '6/30/2001', 5, 4);
INSERT INTO Announcement values ('9/10/2012', '8/24/2012', 5, 5);
INSERT INTO Announcement values ('7/25/2013', '7/23/2013', 5, 6);
INSERT INTO Announcement values ('11/14/2011', '2/28/2011', 5, 7);
INSERT INTO Announcement values ('7/6/2006', '6/25/2006', 5, 8);
INSERT INTO Announcement values ('2/6/2015', '4/27/2001', 5, 9);
INSERT INTO Announcement values ('1/5/2011', '11/2/2010', 5, 10);
INSERT INTO Announcement values ('2/9/2010', '5/25/2009', 5, 11);
--Part 7
INSERT INTO Advertisement ([description], [location], viewer_id)
					values('Visit my profile im funny.','New Cairo,Helipolis Square',1);

INSERT INTO Advertisement ([description], [location], viewer_id)
					values('Please check out my profile it is interesting.','New Cairo,El Saaa Square',2);
					
insert into [Message] (sent_at,contributer_id,viewer_id,[text],sender_type) values('2/9/2010',4,1,'ay 7aga',0)




--2. User Stories
--Part 1
go
create procedure Original_Content_Search
@typename varchar(50),
@categoryname varchar(50)
AS
BEGIN
if(@typename is not null)
	select * from Original_Content INNER JOIN Content ON Original_Content.ID=Content.ID
	where Original_Content.filter_status=1 and Original_Content.review_status=1 
	and @typename=Content.[type];
else
	select * from Original_Content INNER JOIN Content on Original_Content.ID=Content.ID
	where Original_Content.filter_status=1 and Original_Content.review_status=1 
	and @categoryname=Content.category_type;
END

--Part 2
go
create procedure Contributor_Search 
@fullname varchar(150)
AS
BEGIN
select * from Contributor INNER JOIN [User] on Contributor.ID=[User].ID 
where [User].first_name+' '+[User].middle_name+' '+[User].last_name = @fullname;
end
go
--Part 3
go
create procedure Register_User 
@usertype varchar(50), @email varchar(50), @password varchar(50), @firstname varchar(50), @middlename varchar(50),
@lastname varchar(50), @birth_date date,
@working_place_name varchar(50), @working_place_type varchar(50),@wokring_place_description varchar(50), 
@specilization varchar(50), @portofolio_link varchar(50), @years_experience int, @hire_date date,
@working_hours int, @payment_rate decimal(15,2), @user_id int OUTPUT
AS
BEGIN
declare @userid int;
select @userid=1+count(*) from [User];
SET IDENTITY_INSERT [User] ON;
INSERT INTO [User] (ID , email, first_name, middle_name, last_name, birth_date,[password])
values (@userid,@email,@firstname,@middlename,@lastname,@birth_date,@password);
SET IDENTITY_INSERT [User] OFF;
if(@usertype='Viewer')
	INSERT INTO Viewer values (@userid , @working_place_name, @working_place_type, @wokring_place_description);
else if(@usertype='Contributor')
begin
	INSERT INTO Notified_Person DEFAULT VALUES;
	INSERT INTO Contributor values (@userid , @years_experience, @portofolio_link, @specilization, (select count(*) from Notified_Person) );
end
else
Begin
	INSERT INTO Notified_Person DEFAULT VALUES;
	INSERT INTO Staff (ID , hire_date, working_hours, payment_rate,notified_id)
	values (@userid , @hire_date, @working_hours, @payment_rate, (select count(*) from Notified_Person))
	if(@usertype='Authorized Reviewer')
		INSERT INTO Reviewer values (@userid)
	else if(@usertype='Content Manager')
		INSERT INTO Content_manager values(@userid, null);
End
select @user_id=@userid;
END
go
--Part 4
go
create procedure Check_Type 
@typename varchar(50),
@content_manager_id int
AS
BEGIN
	if not exists(select * from Content_type where type =@typename)
		INSERT INTO Content_type VALUES (@typename)
 Update Content_Manager set [type]=@typename where ID=@content_manager_id;
END
go
--Part 5
go
create procedure Order_Contributor
AS Select * from Contributor INNER JOIN [User] on [User].ID=Contributor.ID order by years_of_experience desc
go
--Part 6
go
create procedure Show_Original_Content
@contributor_id int
AS
if(@contributor_id is not null)
	select Content.*,Contributor.*,[User].* from Original_Content 
	INNER JOIN Content on Original_Content.ID=Content.ID 
	INNER JOIN Contributor on Content.contributer_id=Contributor.ID
	INNER JOIN [User] on Contributor.ID=[User].ID
	where @contributor_id=Content.contributer_id and Original_Content.review_status=1 and Original_Content.filter_status=1;
else
	select Content.*,Contributor.*,[User].* from Original_Content 
	INNER JOIN Content on Original_Content.ID=Content.ID
	INNER JOIN Contributor on Content.contributer_id=Contributor.ID
	INNER JOIN [User] on Contributor.ID=[User].ID
	where Original_Content.review_status=1 and Original_Content.filter_status=1;
go
--Registered User
--Part 1
go
create procedure User_login 
@email varchar(50), @password varchar(50), @user_id int OUTPUT
AS
BEGIN
	declare @userdate date;
	declare @userid int;
	if(not exists (select * from [User] where @email=email and @password=[password]))
		select @user_id=-1;
	else
	begin
		select @userdate=deactivation_date,@userid=ID from [User] where @email=email and @password=[password];

		if(@userdate=null)
			select @user_id=@userid;
		else if(DATEDIFF(week,@userdate,CURRENT_TIMESTAMP)>=2 or @userid=null)
			select @user_id=-1;
		else
			BEGIN
			select @user_id=@userid;
			update  [User] set [User].deactivation_date=null where @email=email and @password=[password];
			END
	END
END
go
--Part 2
create procedure Show_Profile
@user_id int, @email varchar(50) OUTPUT, @password varchar(50) OUTPUT, @firstname varchar(50) OUTPUT,
@middlename varchar(50) OUTPUT,@lastname varchar(50) OUTPUT, @birth_date date OUTPUT,
@working_place_name varchar(50) OUTPUT, @working_place_type varchar(50) OUTPUT,
@wokring_place_description varchar(50) OUTPUT, @specilization varchar(50) OUTPUT,
@portofolio_link varchar(50) OUTPUT, @years_experience int OUTPUT, @hire_date date OUTPUT, 
@working_hours int OUTPUT, @payment_rate decimal(15,2) OUTPUT
AS
BEGIN
select @email=email, @firstname=first_name, @middlename=middle_name, @lastname=last_name,
@birth_date=birth_date,@password=[password] from [User] where ID=@user_id;
declare @viewercount int;
declare @contributorcount int;
declare @staffcount int;

select @viewercount=count(*) from Viewer where ID=@user_id;
select @contributorcount=count(*) from Contributor where ID=@user_id;
select @staffcount=count(*) from Staff where ID=@user_id;

if(@viewercount>0)
	select @working_place_name=working_place, @working_place_type=working_place_type,
	@wokring_place_description=working_place_description from Viewer where ID=@user_id;
else if(@contributorcount>0)
	select @years_experience=years_of_experience, @portofolio_link=portfolio_link,@specilization=specialization
	from Contributor where ID=@user_id;
else if(@staffcount>0)
	select @hire_date=hire_date,@working_hours=working_hours, @payment_rate=payment_rate
	from Staff where ID=@user_id;
else
	BEGIN
		select @email=null, @password =null, @firstname=null, @middlename=null,@lastname=null, @birth_date=null, 
		@working_place_name=null, @working_place_type=null, @wokring_place_description=null,@specilization=null, 
		@portofolio_link=null, @years_experience=null, @hire_date=null, @working_hours=null, @payment_rate=null;
	END
END
go
--Part 3
go
create procedure Edit_Profile
@user_id int, @email varchar(50), @password varchar(50),
@firstname varchar(50), @middlename varchar(50), @lastname varchar(50), @birth_date date, 
@working_place_name varchar(50), @working_place_type varchar(50), @wokring_place_description varchar(50),
@specilization varchar(50), @portofolio_link varchar(50), @years_experience int, @hire_date date,
@working_hours int, @payment_rate decimal(15,2)
AS
BEGIN
UPDATE [User]
	SET email=@email, first_name=@firstname, middle_name=@middlename, last_name=@lastname, birth_date=@birth_date,
	[password]=@password
	WHERE ID=@user_id;
declare @viewercount int;
declare @contributorcount int;
declare @staffcount int;

select @viewercount=count(*) from Viewer where ID=@user_id;
select @contributorcount=count(*) from Contributor where ID=@user_id;
select @staffcount=count(*) from Staff where ID=@user_id;

if(@viewercount>0)
	UPDATE Viewer
	SET working_place=@working_place_name, working_place_type=@working_place_type,
	working_place_description=@wokring_place_description
	WHERE ID=@user_id;
else if(@contributorcount>0)
	UPDATE Contributor
	SET  years_of_experience=@years_experience, portfolio_link=@portofolio_link, specialization=@specilization
	WHERE ID=@user_id;
else if(@staffcount>0)
	UPDATE Staff
	SET hire_date=@hire_date, working_hours=@working_hours, payment_rate=@payment_rate
	WHERE ID=@user_id;
END
go
--Part 4
go
create procedure Deactivate_Profile @user_id int
AS
BEGIN
	UPDATE [User]
	SET deactivation_date=CURRENT_TIMESTAMP
	WHERE ID=@user_id;
END
go
--Part 5
create procedure Show_Event @event_id int
AS
BEGIN
if(@event_id is null or not Exists(Select * from [Event] where id=@event_id))
	select [Event].*,[User].first_name,[User].middle_name,[User].last_name 
	from [Event] INNER JOIN Viewer on Viewer.id=[Event].viewer_id 
	INNER JOIN [User] on [User].ID=Viewer.ID where [Event].[time]>CURRENT_TIMESTAMP;
else
	select [Event].*,[User].first_name,[User].middle_name,[User].last_name
	from [Event] INNER JOIN Viewer on Viewer.id=[Event].viewer_id 
	INNER JOIN [User] on [User].ID=Viewer.ID
	where @event_id=[Event].id;
END
--Part 6
go
create procedure Show_Notification @user_id int
AS
BEGIN
declare @staffcount int;
declare @contributorcount int;

select @staffcount=count(*) from Staff where ID=@user_id;
select @contributorcount=count(*) from Contributor where ID=@user_id;

declare @notifpersonID int;

if(@staffcount>0)
  begin
	select @notifpersonID=notified_id
	from Staff
	where ID=@user_id;

	Update Announcement
	set seen_at=CURRENT_TIMESTAMP
	where notified_person_id = @notifpersonID;

	select Announcement.*
	from Announcement 
	where notified_person_id = @notifpersonID;

  end
else
  begin
	select @notifpersonID=notified_id
	from Contributor
	where ID=@user_id;

	Update Announcement
	set seen_at=CURRENT_TIMESTAMP
	where notified_person_id = @notifpersonID;

	select Announcement.*
	from Announcement 
	where notified_person_id = @notifpersonID;

  end
END
go
--Part 7
go
create procedure Show_New_Content @viewer_id int, @content_id int
AS
BEGIN
if(@content_id is not null)
	select New_Content.ID,New_Request.contributer_id,[User].first_name,[User].middle_name,[User].last_name 
	from New_Content
	INNER JOIN New_Request on New_Content.new_request_id=New_Request.ID
	INNER JOIN [User] on [User].ID=New_Request.contributer_id where @content_id=New_Content.ID;
else
	select New_Content.ID,New_Request.contributer_id,[User].first_name,[User].middle_name,[User].last_name 
	from New_Content
	INNER JOIN New_Request on New_Content.new_request_id=New_Request.ID
	INNER JOIN [User] on [User].ID=New_Request.contributer_id;
END
go
--Viewer

-- Part 1
go
create procedure Viewer_Create_Event
@city             varchar(50)  ,
@event_date_time  datetime     ,
@description      varchar(300) ,
@entartainer      varchar(50)  ,
@viewer_id        int          ,
@location		  varchar(50)  ,
@event_id         int          OUTPUT
as
begin
 INSERT INTO Notification_object DEFAULT VALUES;
 declare @notf_obgj_id int;
 select @notf_obgj_id = max(id) from Notification_object ;

 insert INTO [Event] ( [description],location, city,
                    [time], entertainer, notification_object_id,
                    viewer_id)
 values ( @description, @location, @city, @event_date_time,
          @entartainer, @notf_obgj_id ,@viewer_id)

 select @event_id=id
 from [Event]
 where [description]			= @description		and
		location				= @location			and
       city						= @city				and
       [time]					= @event_date_time	and
       entertainer				= @entartainer		and
	   notification_object_id	= @notf_obgj_id		and
       viewer_id				= @viewer_id ;

select notified_id INTO Tmp FROM Contributor
UNION
select notified_id FROM Staff;

INSERT INTO Announcement(sent_at , notified_person_id, notification_object_id) 
select CURRENT_TIMESTAMP as sent_at,
notified_id as notified_person_id,
@notf_obgj_id as notification_object_id from Tmp;

drop table Tmp;
end
go

-- Part 2
go
create procedure Viewer_Upload_Event_Photo
@event_id   int          ,
@link       varchar(100) 
as
begin
if(not exists(select * from Event_Photos_link where event_id=@event_id and link=@link))
 insert 
 INTO Event_Photos_link( event_id, link)
 values ( @event_id, @link)
end

go

create procedure Viewer_Upload_Event_Video
@event_id   int          ,
@link       varchar(100)
as
begin
if(not exists(select * from Event_Videos_link where event_id=@event_id and link=@link))
 insert 
 INTO Event_Videos_link( event_id, link)
 values ( @event_id, @link)
end
go
-- Part 3
go
create procedure Viewer_Create_Ad_From_Event
@event_id   int
as
begin
 declare @location    varchar(50);
 declare @description varchar(150);
 declare @viewer_id   int;
 select @location    = location,
        @description = description,
        @viewer_id   = viewer_id
 from [Event]
 where id = @event_id;

 insert 
 INTO Advertisement([description], [location],
                    event_id, viewer_id)
 values ( @description, @location,
          @event_id, @viewer_id)
end
go

-- Part 4
go
create procedure Apply_Existing_Request
@viewer_id            int ,
@original_content_id  int
as
begin
 declare @rate int;

 select @rate = rating
 from Original_Content
 where id = @original_content_id;

 if (@rate > 3)
  begin
   insert 
   INTO Existing_Request( original_content_id,
                          viewer_id)
   values ( @original_content_id ,@viewer_id)
  end
end
go
--comment:1- how do i notify the contributer?
--         by creating an announcement and by
--         adding them to the notification object
--         table and the notified person tables?
         
--        2- what is the use of the type content
--           id?
-- Part 5
go
create procedure Apply_New_Request

@information      varchar(50),
@contributor_id   int,
@viewer_id        int

as

begin
 declare @notf_obj_id int;
--if(not EXISTS(select * from New_Request where @viewer_id=viewer_id and @information=information))
--begin
 INSERT
 INTO Notification_object DEFAULT VALUES;

 select @notf_obj_id = max(id)
 from Notification_object ;
 
 if @contributor_id is null 
  begin
  INSERT
   INTO New_Request( information,viewer_id,notif_obj_id,accept_status)
   VALUES( @information, @viewer_id,@notf_obj_id,0)
   
   create table Tmp(sentat datetime,notfc_id int,notf_obj int)
   insert 
   INTO Tmp(notfc_id)
   select notified_id FROM Contributor;

   update Tmp
   set sentat=CURRENT_TIMESTAMP;
   update Tmp
   set notf_obj = @notf_obj_id;
   
   insert
   INTO Announcement(sent_at , notified_person_id,
                     notification_object_id)
   select * from Tmp;
   drop table Tmp;
  end

 else
  begin
   INSERT
   INTO New_Request( information,viewer_id,notif_obj_id,
                     contributer_id,accept_status)
   VALUES( @information, @viewer_id,@notf_obj_id ,@contributor_id,0)
  
   declare @notf_person_id int;
   
   select @notf_person_id=notified_id
   from Contributor
   where id=@contributor_id;

   insert
   INTO Announcement(sent_at,notified_person_id,
                     notification_object_id)
   values( CURRENT_TIMESTAMP , @notf_person_id , @notf_obj_id)
  end
--end
end
go

-- Part 6
go
create procedure Delete_New_Request
@request_id int
as
begin
 DELETE 
 FROM New_Request
 where (not(accept_status = 1) or(accept_status is null)) and @request_id=ID;
end
go
-- Part 7
go

create procedure Rating_Original_Content
@orignal_content_id int ,
@rating_value       int ,
@viewer_id          int 
as
begin
if(not exists(select * from Rate where viewer_id=@viewer_id and original_content_id =@orignal_content_id))
 insert
 INTO Rate(viewer_id, original_content_id,[date],rate)
 values( @viewer_id, @orignal_content_id ,CURRENT_TIMESTAMP,
         @rating_value)
end
go
-- Part 8
go
create procedure Write_Comment
@comment_text         varchar(300) ,
@viewer_id            int          ,
@original_content_id  int          ,
@written_time         datetime     
as
begin
 insert
 INTO Comment( Viewer_id, 
               original_content_id, 
               [date], [text])
 values( @viewer_id, @original_content_id,
         @written_time , @comment_text)
end
go
-- Part 9
go
create procedure Edit_Comment
@comment_text          varchar(300) , 
@viewer_id             int          ,
@original_content_id   int          ,
@last_written_time     datetime     ,
@updated_written_time  datetime     
as 
begin
 update Comment
 SET [text] = @comment_text , 
     [date] = @updated_written_time
 where Viewer_id = @viewer_id 
       and original_content_id =
                        @original_content_id
       and [date] = @last_written_time
end
go
-- Part 10
go
create procedure Delete_Comment 
@viewer_id            int          ,
@original_content_id  int          ,
@written_time         datetime     
as
begin
 DELETE
 FROM Comment
 where Viewer_id = @viewer_id 
       and original_content_id = 
                        @original_content_id
       and [date] = @written_time;
end
go
-- Part 11
go
create procedure Create_Ads
@viewer_id    int           ,
@description  varchar(300)  ,
@location     varchar(50)   
as
begin
 insert 
 INTO Advertisement( [description], [location], 
                     viewer_id)
 values( @description, @location, @viewer_id);
end
go
-- Part 12
go
create procedure Edit_Ad
@ad_id    int           ,
@description  varchar(300)  ,
@location     varchar(50)
as
begin
 UPDATE Advertisement
 SET [description] = @description,
     [location] = @location
 where @ad_id=id;
end
go
-- Part 13
go
create procedure Delete_Ads
@ad_id  int
as
begin
 DELETE
 FROM Advertisement
 where id = @ad_id;
end
go
-- Part 14
go
create procedure Send_Message
@msg_text        varchar(300)  ,
@viewer_id       int           ,
@contributor_id  int           ,
@sender_type     bit   		   ,
@sent_at         DATE
as
begin 
 insert 
 INTO [Message]( sent_at, contributer_id,
               viewer_id, sender_type, [text])
 values( @sent_at, @contributor_id, @viewer_id,
         @sender_type, @msg_text)
end
go
-- Part 15
go
create procedure Show_Message
@contributor_id   int
as
begin
 select * 
 FROM [Message]
 where contributer_id = @contributor_id
end
go
-- Part 16
go
create procedure Highest_Rating_Original_content
as
begin
 declare @H_rate int;
 select @H_rate = max(rating)
 FROM Original_Content;

 select *
 FROM Original_Content
 where rating = @H_rate;
end
go

-- Part 17
go
create procedure Assign_New_Request
@request_id int,
@contributor_id int
as
begin
declare @contrb_Id int;
select @contrb_Id=contributer_id
from New_Request
where id=@request_id 

if(@contrb_Id is null)
update New_Request
set contributer_id = @contributor_id
where id = @request_id;
end
go

go
create procedure getTime
@out datetime out
as
begin
set @out = CURRENT_TIMESTAMP;
end
go

--Contributor
--Part 1
go
CREATE PROCEDURE Receive_New_Requests 
(@request_id int,
 @contributor_id int  )
AS
begin
if @request_id is null 
select * from New_Request where @contributor_id = contributer_id or contributer_id is null
else
select * from New_Request where id = @request_id and (contributer_id =@contributor_id or contributer_id is null)
end
go


go
create PROCEDURE Respond_New_Request --set specified to 1 when assigining a contributor, shouldnt this be a derived variable, specified=(contributor!=null)
(@contributor_id int ,
@accept_status bit ,
@request_id int ) 
as
begin

declare @cont_id int ;
select @cont_id = contributer_id from New_Request where @request_id = ID;
if(@cont_id is  null or @cont_id=@contributor_id)
update New_Request 
set accept_status = @accept_status,contributer_id=@contributor_id,specified=1 where   @request_id = ID;
end
go

-- Part 3
go
CREATE PROCEDURE Upload_Oringial_Content
(@type_id varchar (50),@subcategory_name varchar (50) , @category_id varchar (50), @contributor_id int,@link varchar (150) )
as
begin
INSERT INTO Content (contributer_id,subcategory_name,category_type,uploaded_at,link)
VALUES (@contributor_id,@subcategory_name,@category_id,GETDATE(),@link)
declare @max int;
select @max=max(ID) from Content;

INSERT INTO Original_Content(ID) values(@max)

end
go

-- Part 4
go
CREATE PROCEDURE Upload_New_Content --max(ID) and not max(ID)+1
(@new_request_id int ,
@contributor_id int ,
@subcategory_name varchar (50),
@category_id varchar(50),
@link varchar (150))
as
begin
INSERT INTO Content (contributer_id,subcategory_name,category_type,uploaded_at,link)
VALUES (@contributor_id,@subcategory_name,@category_id,GETDATE(),@link)

declare @max int;
select @max=max(ID) from Content;

INSERT INTO New_Content VALUES(@max,@new_request_id)
end
go
-- Part 5

go
CREATE PROCEDURE Delete_Content
-- changed it
(@content_id int)
AS
BEGIN
delete  from Original_Content 
where  
(
	review_status is not null and ID = @content_id
)
END
go
-- Part 6
go
CREATE PROCEDURE Receive_New_Request
(@contributor_id int ,@can_receive bit OUTPUT)
AS
BEGIN
DECLARE	@count int;
SET @count = (Select count(*) from New_Request where (contributer_id = @contributor_id and accept_status =1 and not exists 
(select * from New_Content where New_Content.new_request_id =New_Request.ID ) ))

if(@count =3)
	SET @can_receive = 0;
else
	SET @can_receive = 1;
END
go
--Staff member
-- Part 1
go
CREATE PROCEDURE reviewer_filter_content
(@reviewer_id int ,@original_content int ,@status bit)
AS 
begin
update Original_Content 
SET review_status = @status, reviewer_id=@reviewer_id
where id = @original_content
end
-- Part 2
go
CREATE PROCEDURE content_manager_filter_content
(@content_manager_id int ,
@original_content int,
@status bit)
AS
begin
update Original_Content 
SET filter_status = @status, content_manager_id=@content_manager_id
where id = @original_content
--eh lazma el 4 lines eli ta7t ?
--if(@status =1 and exists (select * from Original_Content where id=@original_content and review_status =1))
	--update Original_Content
	--SET filter_status=1
	--WHERE ID = @original_content
END
go
-- Part 3
go
CREATE PROCEDURE Staff_Create_Category
(@category_name varchar (50) )
AS
begin
if(not exists (select * from Category where @category_name=[type]))
INSERT INTO Category ([type])
VALUES (@category_name)
end
go
-- Part 4
go
CREATE PROCEDURE Staff_Create_Subcategory
(@category_name varchar (50),
@subcategory_name varchar (50))
AS
begin
if(not exists (select * from Sub_Category where @category_name=category_type and @subcategory_name=[name]))
INSERT INTO Sub_Category (category_type,[name])
VALUES (@category_name,@subcategory_name)
end
go
-- Part 5
go
CREATE PROCEDURE Staff_Create_Type
(@type_name varchar (50))
AS
begin
if(not exists(select * from Content_type where [type]=@type_name))
INSERT INTO Content_type
VALUES (@type_name)
end
go
-- Part 6
go
CREATE PROCEDURE Most_Requested_Content
as
begin
select original_content_id,count(*) AS 'Number of Requests' from Existing_Request 
GROUP by original_content_id 
ORDER BY [Number of Requests] DESC
end
go


-- Part 7
create PROCEDURE Workingplace_Category_Relation
as
begin

select Viewer.working_place_type, Content.category_type--, count(Existing_Request.ID) as 'Number of times requesed'
Into temp1 from Existing_Request 
RIGHT JOIN (Original_Content INNER JOIN Content on Original_Content.ID=Content.ID)
on Existing_Request.original_content_id=Original_Content.ID 
LEFT JOIN Viewer on Viewer.ID=Existing_Request.viewer_id
group by Viewer.working_place_type,Content.category_type;

select Viewer.working_place_type, Content.category_type--, count(New_Request.ID) as 'Number of times requesed'
into temp2 from New_Request 
RIGHT JOIN (New_Content INNER JOIN Content on New_Content.ID=Content.ID)
on New_Request.ID=New_Content.new_request_id
LEFT JOIN Viewer on Viewer.ID=New_Request.viewer_id
group by Viewer.working_place_type,Content.category_type;


select * into temp3 from  temp1 UNION All (select * from temp2) order by temp1.category_type ,temp1.working_place_type;

select temp3.working_place_type , temp3.category_type,count(temp3.working_place_type) as 'Number of Requests' from temp3
group by temp3.working_place_type,temp3.category_type;

drop table temp1,temp2,temp3

end

-- Part 8(Already implemented before in Viewer Part 10)
/*go
CREATE PROCEDURE Delete_Comment
(@viewer_id int , @original_content_id int , @comment_time  DATETIME)
AS
begin
DELETE FROM Comment where Viewer_id=@viewer_id and original_content_id =@original_content_id and [date]=@comment_time
end
go*/
-- Part 9
go
CREATE PROCEDURE Delete_Original_Content 
(@content_id int)
AS
begin

DELETE FROM Content where id=@content_id
end
go

--Part 10
go
Create PROCEDURE Delete_New_Content 
(@content_id int)
AS
begin
DELETE FROM Content where id=@content_id
end
go
-- Part 11
CREATE PROCEDURE Assign_Contributor_Request 
--updated specified aswell
(@contributor_id INT , @new_request_id int)
AS
begin
UPDATE New_Request 
SET contributer_id=@contributor_id,specified=1
where id=@new_request_id 
end
-- Part 12
-- is this important ?
--select * from Contributor order by (select count(*) from New_Request where Contributor.ID=New_Request.contributer_id) desc;
go
CREATE PROCEDURE Show_Possible_Contributors
AS
begin
Select Contributor.* into temp from Contributor 
INNER JOIN Content on Content.contributer_id=Contributor.ID
INNER JOIN New_Request on New_Request.contributer_id=Contributor.ID
where (select count(*) from New_Request where Contributor.ID=New_Request.contributer_id)<3
order by (DATEDIFF(MINUTE,Content.uploaded_at,New_Request.accepted_at)) asc,
(select count(*) New_Request where New_Request.contributer_id=Contributor.ID) desc;
select distinct * from temp;
drop table temp;
end

go

create procedure filterboth (@id int ,
@original_content int,
@status bit)
AS
begin
if(exists (select * from Reviewer where Reviewer.ID=@id))
	exec reviewer_filter_content @id,@original_content,@status;
else
	exec content_manager_filter_content @id,@original_content,@status ;
end

go
create procedure show_content_to_be_filtered
(@id int)
as
begin
if(exists(select * from Reviewer where id=@id))
	select * from (Original_Content OC inner join Content C on OC.ID=C.ID and review_status is null) inner join
 [User] U on U.ID=C.contributer_id  ;

else
	select * from (Original_Content OC inner join Content C on OC.ID=C.ID and review_status = 1 and filter_status is null)
	inner join
 [User] U on U.ID=C.contributer_id  ;


end
go
create PROCEDURE deleteboth 
(@id int)
AS
begin
if(exists (select * from Original_Content where Original_Content.ID=@id))
exec Delete_Original_Content @id;
else
exec Delete_New_Content @id;

end

go
exec Upload_Oringial_Content @type_id='Music',@subcategory_name='Rock',@category_id='Music',@contributor_id=6,@link='mywebsite.com/music/first'
exec Upload_Oringial_Content @type_id='Music',@subcategory_name='Rock',@category_id='Music',@contributor_id=6,@link='mywebsite.com/music/second'
exec Upload_Oringial_Content @type_id='Music',@subcategory_name='Rock',@category_id='Music',@contributor_id=6,@link='mywebsite.com/music/third'
exec Upload_Oringial_Content @type_id='Music',@subcategory_name='Rock',@category_id='Music',@contributor_id=6,@link='mywebsite.com/music/fourth'
exec Write_Comment 'first comment',1,8,'3-10-2019';
exec Write_Comment 'second comment',1,8,'4-10-2019';
exec Write_Comment 'third comment',1,8,'5-10-2019';


