-- --------------------------------------------------------

-- Хост:                         localhost

-- Версия сервера:               5.0.0 - MySQL Community Server (GPL)

-- ОС Сервера:                   Win32

-- HeidiSQL Версия:              9.3.0.4984

-- --------------------------------------------------------



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET NAMES utf8mb4 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;



-- Дамп структуры базы данных sprvochnik

CREATE DATABASE IF NOT EXISTS `projectlexa` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `projectlexa`;





-- Дамп структуры для таблица projectlexa.seller

CREATE TABLE IF NOT EXISTS `seller` (

	`ID` INT NOT NULL AUTO_INCREMENT,

	`Name` varchar (10),

	`volume` INT,

	`price` INT,

	`metofpay` varchar (10),

	`contacts` varchar (20),

	`notes` varchar (20) NULL,

	PRIMARY KEY (`ID`)

) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;



-- Дамп данных таблицы projectlexa.seller: ~9 rows (приблизительно)

/*!40000 ALTER TABLE `seller` DISABLE KEYS */;

INSERT INTO `seller` (`ID`, `Name`, `volume`, `price`, `metofpay`, `contacts`, `notes`) VALUES

	(1, 'Pepsi', 500, 11000, 'card','2-11-15'),

	(2, 'Fanta', 400, 8800, 'card','6-15-18'),

	(3, 'Mars', 200, 7000, 'card','7-13-89'),

	(4, 'Sprite', 50, 1100, 'card','6-45-91'),

	(5, 'Milk', 300, 9000, 'card','5-78-42'),

	(6, 'Pepero', 800, 48000, 'card','6-34-56'),

	(7, 'Pocky', 200, 14000, 'card','6-89-56'),

	(8, 'm&m', 80, 1600, 'card','7-77-90'),

	(9, 'AlpenGold', 100, 7000, 'card','9-60-50');

/*!40000 ALTER TABLE `avtor` ENABLE KEYS */;





-- Дамп структуры для таблица projectlexa.shoppers

CREATE TABLE IF NOT EXISTS `shoppers` (

	`ID` INT NOT NULL AUTO_INCREMENT,

	`Name` varchar (10),

	`volume` INT,

	`price` INT,

	`metofpay` varchar (10),

	`contacts` varchar (20),

	`notes` varchar (20) NULL,

	PRIMARY KEY (`ID`)

) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;



-- Дамп данных таблицы projectlexa.shoppers: ~10 rows (приблизительно)

/*!40000 ALTER TABLE `frazi` DISABLE KEYS */;

INSERT INTO `shoppers` (`ID`, `Name`, `volume`, `price`, `metofpay`, `contacts`, `notes`) VALUES

	(1, 'Sweets', 10, 34, 'card','7-74-51'),

	(2, 'Sprite', 2, 44, 'card','Glazov'),

	(3, 'Pepsi', 2, 44, 'card','6-13-90'),

	(4, 'Fanta', 6, 132, 'card','4-80-56'),

	(5, 'Milk', 100, 3000, 'card','1-45-11'),

	(6, 'Pepero', 10, 600, 'card','6-34-78'),

	(7, 'Pocky', 2, 140, 'card','6-66-80'),

	(8, 'm&m', 10, 200, 'card','7-75-91'),

	(9, 'AlpenGold', 140, 7000, 'card','9-67-78'),

	(10, 'CocaCola', 110, 7000, 'card','9-60-40');

/*!40000 ALTER TABLE `frazi` ENABLE KEYS */;





-- Дамп структуры для таблица projectlexa.act

CREATE TABLE IF NOT EXISTS `act` (

  	`ID` INT NOT NULL AUTO_INCREMENT,

	`IDseller` INT,

	`IDshoppers` INT,

	`price` INT,

	`metofpay` varchar (10),

	`volume` INT,

	`claims` bool,

	PRIMARY KEY (`ID`),

	FOREIGN KEY (IDseller) REFERENCES seller(ID),

	FOREIGN KEY (IDshoppers) REFERENCES shoppers(ID)

) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



-- Дамп данных таблицы projectlexa.act: ~6 rows (приблизительно)

/*!40000 ALTER TABLE `istochnik` DISABLE KEYS */;

INSERT INTO `act` (`IDSeller`, `IDshoppers`, `price`, `metofpay`, `volume`, `claims`)) VALUES

	(1, 3, 1, 50, 'card', 2, 0 ),

	(2, 6, 6, 610, 'card', 10, 0 ),

	(3, 9, 9, 140, 'card', 2, 0 ),

	(4, 5, 5, 3000, 'card', 100, 0 ),

	(5, 4, 2, 135, 'card', 6, 0 ),

	(6, 8, 8, 200, 'card', 10, 0 );

/*!40000 ALTER TABLE `istochnik` ENABLE KEYS */;