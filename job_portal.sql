CREATE SCHEMA job_portal;

USE job_portal;

CREATE TABLE 'user'
(
  userID NUMERIC(5) NOT NULL,
  email VARCHAR(25) NOT NULL,
  password VARCHAR(25) NOT NULL,
  adminID INT NOT NULL,
  PRIMARY KEY (userID),
 FOREIGN KEY (adminID) REFERENCES Admin(adminID),
  UNIQUE (email)
);

CREATE TABLE User_Profile
(
  name VARCHAR(25) NOT NULL,
  username VARCHAR(25) NOT NULL,
  email VARCHAR(25) NOT NULL,
  password VARCHAR(25) NOT NULL,
  bio VARCHAR(500) NOT NULL,
  ProfileID NUMERIC(5) NOT NULL,
  userID NUMERIC(5) NOT NULL,
  searchuserID NUMERIC(5) NOT NULL,
  PRIMARY KEY (ProfileID),
  FOREIGN KEY (userID) REFERENCES User(userID),
  FOREIGN KEY (searchuserID) REFERENCES User(userID),
  UNIQUE (email)
);

CREATE TABLE Message
(
  messageID NUMERIC(5) NOT NULL,
  content VARCHAR(500) NOT NULL,
  subject VARCHAR(20) NOT NULL,
  attach_file VARCHAR(25) NOT NULL,
  userID NUMERIC(5) NOT NULL,
  PRIMARY KEY (messageID),
  FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE Thread
(
  threadID NUMERIC(5) NOT NULL,
  content VARCHAR(500) NOT NULL,
  subject VARCHAR(20) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  PRIMARY KEY (threadID)
);

CREATE TABLE Admin
(
  adminID INT NOT NULL,
  admin_name VARCHAR(25) NOT NULL,
  PRIMARY KEY (adminID)
);

CREATE TABLE Bulk_Email
(
  Invitation VARCHAR(500) NOT NULL,
  userEmail VARCHAR(25) NOT NULL,
  bulkID NUMERIC(5) NOT NULL,
  subject INT NOT NULL,
  content INT NOT NULL,
  PRIMARY KEY (bulkID)
);

CREATE TABLE Job
(
  jobID NUMERIC(5) NOT NULL,
  job_profile VARCHAR(25) NOT NULL,
  company_name VARCHAR(25) NOT NULL,
  job_title VARCHAR(20) NOT NULL,
  job_descriptin VARCHAR(500) NOT NULL,
  salary FLOAT NOT NULL,
  adminID INT NOT NULL,
  PRIMARY KEY (jobID),
  FOREIGN KEY (adminID) REFERENCES Admin(adminID)
);

CREATE TABLE can_send
(
  adminID INT NOT NULL,
 bulkID NUMERIC(5) NOT NULL,
  PRIMARY KEY (adminID, bulkID),
  FOREIGN KEY (adminID) REFERENCES Admin(adminID),
  FOREIGN KEY (bulkID) REFERENCES Bulk_Email(bulkID)
);


CREATE TABLE Experience
(
  experienceID NUMERIC(5) NOT NULL,
  duration DATE NOT NULL,
  company VARCHAR(25) NOT NULL,
  proffession VARCHAR(25) NOT NULL,
  ProfileID NUMERIC(5) NOT NULL,
  PRIMARY KEY (experienceID),
  FOREIGN KEY (ProfileID) REFERENCES User_Profile(ProfileID)
);


CREATE TABLE can_apply
(
  jobID NUMERIC(5) NOT NULL,
  userID NUMERIC(5) NOT NULL,
  PRIMARY KEY (jobID, userID),
  FOREIGN KEY (jobID) REFERENCES Job(jobID),
  FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE send
(
  messageID NUMERIC(5) NOT NULL,
  userID NUMERIC(5) NOT NULL,
  PRIMARY KEY (messageID, userID),
  FOREIGN KEY (messageID) REFERENCES Message(messageID),
  FOREIGN KEY (userID) REFERENCES User(userID)
);


CREATE TABLE administrate
(
  adminID INT NOT NULL,
  userID NUMERIC(5) NOT NULL,
  PRIMARY KEY (adminID, userID),
  FOREIGN KEY (adminID) REFERENCES Admin(adminID),
  FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE create_reply
(
  userID NUMERIC(5) NOT NULL,
  threadID NUMERIC(5) NOT NULL,
  PRIMARY KEY (userID, threadID),
  FOREIGN KEY (userID) REFERENCES User(userID),
  FOREIGN KEY (threadID) REFERENCES Thread(threadID)
);

CREATE TABLE Qualification
(
  qualificationID NUMERIC(5) NOT NULL,
  university VARCHAR(25) NOT NULL,
  degree VARCHAR(25) NOT NULL,
  specialization VARCHAR(25) NOT NULL,
  achievement VARCHAR(20) NOT NULL,
  ProfileID NUMERIC(5) NOT NULL,
  PRIMARY KEY (qualificationID),
  FOREIGN KEY (ProfileID) REFERENCES User_Profile(ProfileID)
);











#datainsert------------------------------------------------------------------------------------------------------


#User Table

insert into job_portal.user (userID, email, password, adminID, gender) values (1, 'gsheppey0@fr.net', 'J9npdZ2DG', 1, 'Male');
insert into job_portal.user (userID, email, password, adminID, gender) values (2, 'ldioniso1@vk.com', 'DsDtg0YW1ZVQ', 2, 'Female');
insert into job_portal.user (userID, email, password, adminID, gender) values (3, 'bvenneur2@er.com', 'OQVVMplbW4Q', 3, 'Female');
insert into job_portal.user (userID, email, password, adminID, gender) values (4, 'lmathouse3@nasa.gov', 'ydCyE5', 4, 'Male');
insert into job_portal.user (userID, email, password, adminID, gender) values (5, 'cjoontjes4@yt.com', 'MgjRxqTWyMZ', 5, 'Female');
insert into job_portal.user (userID, email, password, adminID, gender) values (6, 'lblakebrough5@ui.it', 'ZmKSjS76937', 6, 'Female');
insert into job_portal.user (userID, email, password, adminID, gender) values (7, 'clitherland6@yu.me', 'K2c5mjyWVmm', 7, 'Male');
insert into job_portal.user (userID, email, password, adminID, gender) values (8, 'ejaffra7@friend.com', 'Gd7DZEG', 8, 'Male');
insert into job_portal.user (userID, email, password, adminID, gender) values (9, 'ezupone8@prweb.com', '9b2aTxd', 9, 'Female');
insert into job_portal.user (userID, email, password, adminID, gender) values (10, 'lwerendell9@d.com', 'ARBc5Ma7', 10, 'Male');
 
#Thread Table

insert into job_portal.thread (threadID, content, subject, description) values (1, 'duis aliquam convallis nunc proin', 'ut', 'nisl nunc rhoncus dui vel sem sed sagittis nam');
insert into job_portal.thread (threadID, content, subject, description) values (2, 'posuere felis sed lacus morbi', 'proin', 'mus etiam vel augue vestibulum rutrum rutrum neque');
insert into job_portal.thread (threadID, content, subject, description) values (3, 'pulvinar nulla pede ullamcorper augue', 'aliquam', 'lacus morbi sem mauris laoreet ut rhoncus aliquet');
insert into job_portal.thread (threadID, content, subject, description) values (4, 'tincidunt nulla mollis molestie lorem', 'sapien', 'cursus id turpis integer aliquet massa id lobortis');
insert into job_portal.thread (threadID, content, subject, description) values (5, 'mauris lacinia sapien quis libero', 'ut', 'ut blandit non interdum in ante vestibulum ante ipsum');
insert into job_portal.thread (threadID, content, subject, description) values (6, 'in magna bibendum imperdiet nullam', 'tempus', 'suscipit nulla elit ac nulla sed vel enim');
insert into job_portal.thread (threadID, content, subject, description) values (7, 'erat eros viverra eget congue', 'faucibus', 'sit amet lobortis sapien sapien non mi integer ac');
insert into job_portal.thread (threadID, content, subject, description) values (8, 'tristique fusce congue diam id', 'odio', 'tincidunt ante vel ipsum praesent blandit lacinia erat');
insert into job_portal.thread (threadID, content, subject, description) values (9, 'sodales sed tincidunt eu felis', 'erat', 'aliquet at feugiat non pretium quis lectus suspendisse');
insert into job_portal.thread (threadID, content, subject, description) values (10, 'luctus nec molestie sed justo', 'integer', 'morbi a ipsum integer a nibh in quis');

 

#Qualification Table

insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (6, 'Institute of Techno', 'Quality Specialist', 'aliquet', 1, 1);
insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (6, 'Institute of Techno', 'Quality Specialist', 'aliquet', 2, 2);
insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (6, 'Institute of Techno', 'Quality Specialist', 'aliquet', 3, 3);
insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (6, 'Institute of Techno', 'Quality Specialist', 'aliquet', 4, 4);
insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (6, 'Institute of Techno', 'Quality Specialist', 'aliquet', 5, 5);
insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (6, 'Institute of Techno', 'Quality Specialist', 'aliquet', 6, 6);
insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (7, 'Space Technology', 'Sales Representative', 'quisque', 7, 7);
insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (8, 'Balikesir University', 'VP Marketing', 'habitasse', 8, 8);
insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (9, 'Academy for Technology', 'Financial Analyst', 'nunc', 9, 9);
insert into job_portal.qualification (qualificationID, university, specialization, achievement, degree, ProfileID) values (10, 'Marlboro College', 'HelpDesk Technician', 'non', 10, 10); 
 

#User Profile

insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (1, 'Cosetta', 'cpoxon4', 'cmccurd@times.com', 'x1qPtg3TN', 'aliquam convallis nunc proin', 1, 1);
insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (2, 'Cosetta', 'cpoxon4', 'cmccurd@times.com', 'x1qPtg3TN', 'aliquam convallis nunc proin', 2,2);
insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (3, 'Cosetta', 'cpoxon4', 'cmccurd@times.com', 'x1qPtg3TN', 'aliquam convallis nunc proin', 3,3);
insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (4, 'Cosetta', 'cpoxon4', 'cmccurd@times.com', 'x1qPtg3TN', 'aliquam convallis nunc proin', 4,4);
insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (5, 'Cosetta', 'cpoxon4', 'cmccurd@times.com', 'x1qPtg3TN', 'aliquam convallis nunc proin', 5, '5');
insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (6, 'Darnell', 'ddyott5', 'dbradnick5@ifty.com', 'mWt2omAmZp', 'at nunc commodo placerat', 6, '6');
insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (7, 'Batholomew', 'bdonavan6', 'breinhart6@ha.com', 'gtwoIJ', 'sollicitudin mi sit amet', 7, 7);
insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (8, 'Jules', 'jnozzolii7', 'jmcallen7@bo.com', 'wPPGLq2znd', 'ridiculus mus vivamus', 8,8);
insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (9, 'Adrian', 'aironside8', 'ajossel8@acc.com', 'KwUYvc0Z5r6', 'urna ut tellus', 9,9);
insert into job_portal.user_profile (ProfileID, name, username, email, password, bio, userID, searchuserID) values (10, 'Dorthy', 'dbesnard9', 'dfaudrie9@hist.com', 'SUjJQB8TEnO', 'justo in blandit', 10, 10);

 
#Admin Table

insert into job_portal.admin (adminID, admin_name) values (1, 'Hugues');
insert into job_portal.admin (adminID, admin_name) values (2, 'Staci');
insert into job_portal.admin (adminID, admin_name) values (3, 'Che');
insert into job_portal.admin (adminID, admin_name) values (4, 'Kathi');
insert into job_portal.admin (adminID, admin_name) values (5, 'Amargo');
insert into job_portal.admin (adminID, admin_name) values (6, 'Adoree');
insert into job_portal.admin (adminID, admin_name) values (7, 'Chantalle');
insert into job_portal.admin (adminID, admin_name) values (8, 'Kriste');
insert into job_portal.admin (adminID, admin_name) values (9, 'Ira');
insert into job_portal.admin (adminID, admin_name) values (10, 'Rod');

 

#Administrate

INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('1', '1');
INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('2', '2');
INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('3', '3');
INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('4', '4');
INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('5', '5');
INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('6', '6');
INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('7', '7');
INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('8', '8');
INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('9', '9');
INSERT INTO `job_portal`.`administrate` (`adminID`, `userID`) VALUES ('10', '10');

 

#Bulk_email

insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('primis in', 'rballingh@ri.org', 1, 'nascetur ridiculus mus vivamus', 'ultrices');
insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('et commodo vulputate justo', 'uexposito1@ii.com', 2, 'nisi nam ultrices libero', 'praesent');
insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('justo sit', 'jwasie2@ning.com', 3, 'quis odio consequat varius', 'quis');
insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('nonummy maecenas tincidunt', 'stancock3@ty.net', 4, 'vel accumsan tellus nisi', 'nunc');
insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('in tempor', 'jaspell4@on.com', 5, 'id nulla ultrices aliquet', 'fusce');
insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('nibh in hac', 'hshenton5@hu.jp', 6, 'vitae nisl aenean lectus', 'dapibus');
insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('nec nisi', 'pbynold6@ew.com', 7, 'ut erat id mauris', 'rutrum');
insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('tellus nulla ut erat', 'tnoll@friendly.com', 8, 'mauris ullamcorper purus sit', 'dapibus');
insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('scelerisque mauris sit', 'ocyseley8@tamu.edu', 9, 'consequat varius integer ac', 'proin');
insert into job_portal.bulk_email (invitation, userEmail, bulkID, content, subject) values ('faucibus orci luctus', 'dhurl9@spiegel.de', 10, 'eu felis fusce posuere', 'nec');

 


#Can_apply

INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('1', '1');
INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('2', '2');
INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('3', '3');
INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('4', '4');
INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('5', '5');
INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('6', '6');
INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('7', '7');
INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('8', '8');
INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('9', '9');
INSERT INTO `job_portal`.`can_apply` (`jobID`, `userID`) VALUES ('10', '10');

 


#Can_send

INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('1', '1');
INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('2', '2');
INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('3', '3');
INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('4', '4');
INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('5', '5');
INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('6', '6');
INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('7', '7');
INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('8', '8');
INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('9', '9');
INSERT INTO `job_portal`.`can_send` (`adminID`, `bulkID`) VALUES ('10', '10');

 
#Create_reply

INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('1', '1');
INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('2', '2');
INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('3', '3');
INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('4', '4');
INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('5', '5');
INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('6', '6');
INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('7', '7');
INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('8', '8');
INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('9', '9');
INSERT INTO `job_portal`.`create_reply` (`userID`, `threadID`) VALUES ('10', '10');
 

#Experience

insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (1, '5 years', 'Jayo', 'Pyramid', 1);
insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (2, '7 years', 'Edgeblab', 'Talent Booking', 2);
insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (3, '3 years', 'Rhynoodle', 'UDS', 3);
insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (4, '6 years', 'Livefish', 'MX960', 4);
insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (5, '8 years', 'Kwideo', 'global HCM', 5);
insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (6, '2 years', 'Skinix', 'Non-fiction', 6);
insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (7, '6 years', 'Demivee', 'RDMA', 7);
insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (8, '8 years', 'Oyope', 'VDI', 8);
insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (9, '5 years', 'Skiptube', 'Occupational Health', 9);
insert into job_portal.experience (experienceID, duration, company, proffession, profileID) values (10, '8 years', 'Quimm', 'Nuclear', 10);
 

#Job

insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (1, 'Physical Assistant', 'Mydo', 'Librarian', 'nunc rhoncus dui vel', '347.00', 1);
insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (2, 'Analyst Programmer', 'Thoughtsphere', 'Payment Coordinator', 'non mauris morbi non lectus', '534.37', 2);
insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (3, 'Chemical Engineer', 'Eidel', 'Environmental Tech', 'facilisi cras non velit nec', '809.09', 3);
insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (4, 'Cost Accountant', 'Vimbo', 'Tax Accountant', 'phasellus id sapien in', '717.33', 4);
insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (5, 'Paralegal', 'Zava', 'Env Specialist', 'aliquam lacus morbi quis', '506.91', 5);
insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (6, 'Product Engineer', 'Katz', 'Quality Specialist', 'varius ut blandit non interdum', '417.25', 6);
insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (7, 'Account Executive', 'Jaxbean', 'Account Executive', 'elit sodales scelerisque mauris', '619.80', 7);
insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (8, 'Software Test', 'Oyoyo', 'Administrator III', 'magna vulputate luctus cum sociis', '161.22', 8);
insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (9, 'Administrate Officer', 'Kimia', 'Dental Hygienist', 'dolor morbi vel lectus', '424.54', 9);
insert into job_portal.job (jobID, job_profile, company_name, job_title, job_descriptin, salary, adminID) values (10, 'Occupational Therapist', 'Bubblemix', 'Account Executive', 'amet turpis elementum ligula vehicula', '932.00', 10);

 
#Message

insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (1, 'vestibulum aliquet ultrices erat tortor sollicitudin', 'imperdiet', 'SapienVarius.mpeg', 1);
insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (2, 'ac nulla sed vel enim', 'aliquet', 'Justo.xls', 2);
insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (3, 'eleifend quam a odio in hac', 'neque', 'PrimisIn.ppt', 3);
insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (4, 'volutpat eleifend donec ut dolor morbi', 'mauris', 'Volutpat.ppt', 4);
insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (5, 'faucibus orci luctus et ultrices', 'lacinia', 'Tincidunt.xls', 5);
insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (6, 'nulla pede ullamcorper augue a', 'eget', 'Cubilia.jpeg', 6);
insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (7, 'vel pede morbi porttitor lorem', 'sem', 'CongueDiamId.tiff', 7);
insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (8, 'cursus id turpis integer aliquet massa', 'sollicitudin', 'NonLigula.ppt', 8);
insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (9, 'non lectus aliquam sit amet', 'morbi', 'EstPhasellus.pdf', 9);
insert into job_portal.message (messageID, content, subject, attach_file, UserID) values (10, 'vel sem sed sagittis nam congue', 'eget', 'Vitae.tiff', 10);
 


#Send

INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('1', '1');
INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('2', '2');
INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('3', '3');
INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('4', '4');
INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('5', '5');
INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('6', '6');
INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('7', '7');
INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('8', '8');
INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('9', '9');
INSERT INTO `job_portal`.`send` (`messageID`, `userID`) VALUES ('10', '10');
 

















