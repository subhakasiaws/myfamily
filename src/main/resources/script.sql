create table userdetails (id integer not null auto_increment, email varchar(255), firstname varchar(255), lastname varchar(255), password varchar(255), primary key (id)) ENGINE=InnoDB;
INSERT INTO userdetails(email,firstname,lastname,password) VALUES ('admin@admin.com','admin','admin','admin');
INSERT INTO userdetails(email,firstname,lastname,password) VALUES ('john@gmail.com','john','doe','johndoe');
INSERT INTO userdetails(email,firstname,lastname,password) VALUES ('sham@yahoo.com','sham','tis','shamtis');




use sql12325412;
CREATE  TABLE IF NOT EXISTS USERS (ID INT NOT NULL AUTO_INCREMENT, NAME VARCHAR(255),PRIMARY KEY (ID)) ENGINE=InnoDB;
CREATE  TABLE IF NOT EXISTS TASKS (ID INT NOT NULL AUTO_INCREMENT, NAME VARCHAR(255),PRIMARY KEY (ID)) ENGINE=InnoDB;
CREATE  TABLE IF NOT EXISTS EVENTS (ID INT NOT NULL AUTO_INCREMENT, NAME VARCHAR(255),PRIMARY KEY (ID)) ENGINE=InnoDB;


CREATE  TABLE IF NOT EXISTS TASK_MANAGEMENT (USER_ID INT NOT NULL, , TASK_ID INT NOT NULL, FOREIGN KEY (USER_ID) REFERENCES USERS(ID), FOREIGN KEY (TASK_ID) REFERENCES TASKS(ID)) ENGINE=InnoDB;
CREATE  TABLE IF NOT EXISTS EVENT_MANAGEMENT (USER_ID INT NOT NULL, EVENT_ID INT NOT NULL, FOREIGN KEY (USER_ID) REFERENCES USERS(ID), FOREIGN KEY (EVENT_ID) REFERENCES EVENTS(ID)) ENGINE=InnoDB;
CREATE  TABLE IF NOT EXISTS LEADERBOARD (II INT NOT NULL, POINTS INT(10), USER_ID INT NOT NULL, FOREIGN KEY (USER_ID) REFERENCES USERS(ID)) ENGINE=InnoDB;
CREATE  TABLE IF NOT EXISTS NOTIFICATIONS (Id INT NOT NULL AUTO_INCREMENT, NAME VARCHAR(255),PRIMARY KEY (ID)) ENGINE=InnoDB;

CREATE  TABLE IF NOT EXISTS AUDIT(Id INT NOT NULL AUTO_INCREMENT, NAME VARCHAR(255),PRIMARY KEY (ID)) ENGINE=InnoDB;
