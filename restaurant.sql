drop database if exists `restaurant`;
create database `restaurant`;
use `restaurant`;

drop table if exists `RESTAURANT`;
create table `RESTAURANT`(
	`Name` varchar(100) NOT NULL,
	`Location` varchar(100) NOT NULL,
	`Contact` varchar(100) NOT NULL,
	`Opening_Closing_Time` varchar(100) NOT NULL,
	`Details` varchar(500) default NULL,
	PRIMARY KEY (`Name`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `CUSTOMER`;
create table `CUSTOMER`(
	`Customer_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) DEFAULT NULL,
	`Email_Id` varchar(50) DEFAULT NULL,	
	PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `ORDER`;
create table `ORDER`(
	`Order_Id` int NOT NULL AUTO_INCREMENT,
	`Name` varchar(30) NOT NULL,
	`Quantity` varchar(15) NOT NULL,
	`Description` varchar(100) DEFAULT NULL,
	PRIMARY KEY (`Order_Id`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `BILL`;
create table `BILL`(
	`Bill_Id` int NOT NULL AUTO_INCREMENT,
	`Customer_Fname` varchar (20) NOT NULL,
	`Customer_Lname` varchar (20) NOT NULL,
	`Customer_id` int NOT NULL,
	`Total_Amount` double NOT NULL,	
	PRIMARY KEY (`Bill_Id`),
    FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER`(`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `CASHIER`;
create table `CASHIER`(
	`Order_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
 	`Address` varchar(30) DEFAULT NULL,
  	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	PRIMARY KEY(`Order_Id`),
	FOREIGN KEY (`Order_Id`) REFERENCES `ORDER`(`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `MANAGER`;
create table `MANAGER`(
	`Manager_Id` varchar(15) NOT NULL,
    `Order_Id` int NOT NULL,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
 	`Address` varchar(30) DEFAULT NULL,
  	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	PRIMARY KEY (`Manager_Id`),
    FOREIGN KEY (`Order_Id`) REFERENCES `ORDER`(`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `WAITER`;
create table `WAITER`(
	`Waiter_Id` int NOT NULL AUTO_INCREMENT,
    `Customer_id` int NOT NULL,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
 	`Address` varchar(30) DEFAULT NULL,
  	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	PRIMARY KEY (`Waiter_Id`),
    FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER`(`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `COOK`;
create table `COOK`(
	`Cook_Id` varchar(15) NOT NULL,
    `Order_Id` int NOT NULL,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
 	`Address` varchar(30) DEFAULT NULL,
  	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	`Specialization` varchar(50) DEFAULT NULL,
	PRIMARY KEY (`Cook_Id`),
	FOREIGN KEY (`Order_Id`) REFERENCES `ORDER`(`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `INGREDIENT`;
create table `INGREDIENT`(
	`Ingredient_Id` int NOT NULL AUTO_INCREMENT,
	`Name` varchar(30) NOT NULL,
	`Quantity` varchar(15) NOT NULL,
	`Description` varchar(100) DEFAULT NULL,
	`Supp_Name` varchar(50) NOT NULL,
	PRIMARY KEY (`Ingredient_Id`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `MENU`;
create table `MENU`(
	`Menu_Id` int NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL,
	`Price` varchar(20) NOT NULL,	
	`Type` varchar(20) DEFAULT NULL,
	`Category` varchar(30) NOT NULL,
	PRIMARY KEY(`Menu_Id`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into `RESTAURANT`(`Name`,`Location`,`Contact`,`Opening_Closing_Time`,`Details`)
values 
("Tandoori By Nature","Gandhi Nagar Jammu And Kashmir","09642540626/09581871321","10:00 AM - 12:00 AM","None");

insert into `MENU`(`Name`,`Price`,`Type`,`Category`)
values
("Vegetable Pakora","3.00","Veg","Starters"),
("Vegetable Samosa","3.00","Veg","Starters"),
("Onion Bhaji ","3.00","Veg","Starters"),
("Potato and Mushroom Chaat","3.00","Veg","Starters"),
("Mushroom Garlic Fry","3.00","Veg","Starters"),
("Chicken Tikka","4.00","Non-Veg","Starters"),
("Tandoori Chicken","4.00","Non-Veg","Starters"),
("Chicken Garlic Fry","4.00","Non-Veg","Starters"),
("Chicken Tikka on Puree","4.00","Non-Veg","Starters");

insert into `CUSTOMER`(`Customer_Id`,`Fname`,`Lname`,`Contact`,`Email_Id`)
values
("101","Arpit","Sharma","938912","arpit.sharma@students.iiit.ac.in"),
("102","Yash","Shah","289374","yash.shah@students.iiit.ac.in"),
("103","Darshit","Serna","234322","darshit.serna@students.iiit.ac.in"),
("104","Aditya","Sharma","778989","aditya.sharma@students.iiit.ac.in"),
("105","Pallavi","Shah","364932","pallav.shah@students.iiit.ac.in"),
("106","Rajat","Bharadwaj","734277","rajat.bharadwaj@students.iiit.ac.in"),
("107","Achintya","Madhav","347534","achintya.madhav@students.iiit.ac.in");

insert into `WAITER`(`Waiter_Id`,`Customer_id`,`Fname`,`Lname`,`Contact`,`Address`,`Salary`,`Sex`,`Bdate`,`Join_Date`)
values
("11","101","Raghav","Sharma","123456","E-22 OBH , IIIT Hyderabad","8000","U","1993-10-12","2012-08-01"),
("12","102","Rishav","Kumar","132244","E-28 OBH , IIIT Hyderabad","8000","M","1992-12-22","2012-08-01"),
("13","103","Vinil","Narang","213122","E-27 OBH , IIIT Hyderabad","8000","M","1993-05-12","2012-08-01"),
("14","104","Bharat","Jain","121232","E-26 OBH , IIIT Hyderabad","8000","M","1992-03-12","2012-08-01"),
("15","105","Megan","Fox","213122","Hollywood USA","9000","F","1986-10-13","2012-08-01"),
("16","106","Sunny","Leone","323322","Bollywood INDIA","9000","F","1982-10-13","2012-08-01");

insert into `Order`(`Order_Id`,`Name`,`Quantity`,`Description`)
values
("51","Vegetable Pakora","3.00","Veg"),
("89","Vegetable Samosa","3.00","Veg"),
("20","Onion Bhaji ","3.00","Grilled");

insert into `MANAGER`(`Manager_Id`,`Order_Id`,`Fname`,`Lname`,`Contact`,`Address`,`Salary`,`Sex`,`Bdate`,`Join_Date`)
values
("M1","51","Rishi Raj","Singh Jhelumi","9642540626","E-28 OBH , IIIT Hyderabad","30000","M","1992-09-29","2012-08-01"),
("M2","89","Prachish","Gora","9581871321","E-27 OBH , IIIT Hyderabad","30000","M","1993-11-18","2012-08-01");

insert into `CASHIER`(`Order_Id`,`Fname`,`Lname`,`Contact`,`Address`,`Salary`,`Sex`,`Bdate`,`Join_Date`)
values
("51","Abhinav","Mittal","124142","E-19 OBH , IIIT Hyderabad","12000","M","1993-11-30","2012-08-01"),
("89","Sanchit","Gangwar","113332","E-24 OBH , IIIT Hyderabad","12000","M","1993-02-21","2012-08-01"),
("20","Abhishek","Kumar","122121","E-25 OBH , IIIT Hyderabad","12000","M","1992-07-21","2012-08-01");

insert into `COOK`(`Cook_Id`,`Order_Id`,`Fname`,`Lname`,`Contact`,`Address`,`Salary`,`Sex`,`Specialization`,`Bdate`,`Join_Date`)
values
("C1","51","Bhavshuk","Jindal","123211","E-18 OBH , IIIT Hyderabad","15000","M","Maggi","1992-08-02","2012-08-01"),
("C2","89","Japneet","Singh","231312","E-19 OBH , IIIT Hyderabad","15000","M","Samosa","1992-10-12","2012-08-01"),
("C3","20","Dinesh","Singla","874594","E-18 OBH , IIIT Hyderabad","15000","M","Omlette","1992-03-14","2012-08-01");