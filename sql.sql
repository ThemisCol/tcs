SET FOREIGN_KEY_CHECKS=0 
;

/* Drop Tables */

DROP TABLE IF EXISTS `Banks` CASCADE
;

DROP TABLE IF EXISTS `Centers` CASCADE
;

DROP TABLE IF EXISTS `Company` CASCADE
;

DROP TABLE IF EXISTS `ContactPerson` CASCADE
;

DROP TABLE IF EXISTS `Countries` CASCADE
;

DROP TABLE IF EXISTS `Countries_Currency` CASCADE
;

DROP TABLE IF EXISTS `Currency` CASCADE
;

DROP TABLE IF EXISTS `Roles` CASCADE
;

DROP TABLE IF EXISTS `Societies` CASCADE
;

DROP TABLE IF EXISTS `States` CASCADE
;

DROP TABLE IF EXISTS `TermsAndConditions` CASCADE
;

DROP TABLE IF EXISTS `TypeDocument` CASCADE
;

DROP TABLE IF EXISTS `TypeDocument_Countries` CASCADE
;

DROP TABLE IF EXISTS `User` CASCADE
;

DROP TABLE IF EXISTS `User_Company` CASCADE
;

DROP TABLE IF EXISTS `User_Roles` CASCADE
;

DROP TABLE IF EXISTS `User_Societies` CASCADE
;

DROP TABLE IF EXISTS `User_TermsAndConditions` CASCADE
;

DROP TABLE IF EXISTS `User_Vendor` CASCADE
;

DROP TABLE IF EXISTS `Vendor` CASCADE
;

DROP TABLE IF EXISTS `VendorCOL` CASCADE
;

DROP TABLE IF EXISTS `VendorCOLPayment` CASCADE
;

DROP TABLE IF EXISTS `VendorUSA` CASCADE
;

/* Create Tables */

CREATE TABLE `Banks`
(
	`id_bank` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`id_countries` VARCHAR(50) NULL,
	CONSTRAINT `PK_Banks` PRIMARY KEY (`id_bank` ASC)
)

;

CREATE TABLE `Centers`
(
	`id_centers` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`zip` VARCHAR(50) NULL,
	`address` VARCHAR(50) NOT NULL,
	`createdAt` DATETIME NOT NULL,
	`updateAt` DATETIME NOT NULL,
	`id_societies` VARCHAR(50) NULL,
	CONSTRAINT `PK_Centers` PRIMARY KEY (`id_centers` ASC)
)

;

CREATE TABLE `Company`
(
	`id_company` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`createdAt` DATETIME NOT NULL,
	`updateAt` DATETIME NOT NULL,
	CONSTRAINT `PK_Company` PRIMARY KEY (`id_company` ASC)
)

;

CREATE TABLE `ContactPerson`
(
	`id_contactperson` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`last_name` VARCHAR(50) NOT NULL,
	`phone` VARCHAR(50) NOT NULL,
	`landline` VARCHAR(50) NOT NULL,
	`address` VARCHAR(50) NOT NULL,
	`role` VARCHAR(50) NOT NULL,
	`email` VARCHAR(50) NOT NULL,
	`id_vendor` VARCHAR(50) NULL,
	CONSTRAINT `PK_ContactPerson` PRIMARY KEY (`id_contactperson` ASC)
)

;

CREATE TABLE `Countries`
(
	`id_countries` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`iso2` VARCHAR(50) NOT NULL,
	`iso3` VARCHAR(50) NOT NULL,
	`phone_code` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_Countries` PRIMARY KEY (`id_countries` ASC)
)

;

CREATE TABLE `Countries_Currency`
(
	`id_countries_currency` VARCHAR(50) NOT NULL,
	`id_currency` VARCHAR(50) NULL,
	`id_countries` VARCHAR(50) NULL,
	CONSTRAINT `PK_Countries_Currency` PRIMARY KEY (`id_countries_currency` ASC)
)

;

CREATE TABLE `Currency`
(
	`id_currency` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`iso` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_Currency` PRIMARY KEY (`id_currency` ASC)
)

;

CREATE TABLE `Roles`
(
	`id_roles` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NULL,
	`createdAt` VARCHAR(50) NULL,
	`updatedAt` VARCHAR(50) NULL,
	CONSTRAINT `PK_Roles` PRIMARY KEY (`id_roles` ASC)
)

;

CREATE TABLE `Societies`
(
	`id_societies` VARCHAR(50) NOT NULL,
	`code` VARCHAR(50) NOT NULL,
	`sap_code` VARCHAR(50) NOT NULL,
	`createdAt` DATETIME NOT NULL,
	`updateAt` DATETIME(4) NOT NULL,
	CONSTRAINT `PK_Societies` PRIMARY KEY (`id_societies` ASC)
)

;

CREATE TABLE `States`
(
	`id_states` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`id_countries` VARCHAR(50) NULL,
	CONSTRAINT `PK_States` PRIMARY KEY (`id_states` ASC)
)

;

CREATE TABLE `TermsAndConditions`
(
	`id_termsandconditions` VARCHAR(50) NOT NULL,
	`data` LONGTEXT NOT NULL,
	`date_init` DATETIME NOT NULL,
	`date_end` DATETIME NOT NULL,
	`createdAt` DATETIME NOT NULL,
	`updateAt` DATETIME NOT NULL,
	CONSTRAINT `PK_TermsAndConditions` PRIMARY KEY (`id_termsandconditions` ASC)
)

;

CREATE TABLE `TypeDocument`
(
	`id_typedocument` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`slug` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_TypeDocument` PRIMARY KEY (`id_typedocument` ASC)
)

;

CREATE TABLE `TypeDocument_Countries`
(
	`id_typedocument_countries` VARCHAR(50) NOT NULL,
	`id_typedocument` VARCHAR(50) NULL,
	`id_countries` VARCHAR(50) NULL,
	CONSTRAINT `PK_TypeDocument_Countries` PRIMARY KEY (`id_typedocument_countries` ASC)
)

;

CREATE TABLE `User`
(
	`id_user` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`last_name` VARCHAR(50) NOT NULL,
	`phone` VARCHAR(50) NOT NULL,
	`address` VARCHAR(50) NOT NULL,
	`language` VARCHAR(0) NOT NULL,
	`createdAt` DATETIME NOT NULL,
	`updatedAt` DATETIME(4) NOT NULL,
	`status` VARCHAR(50) NOT NULL,
	`id_countries` VARCHAR(50) NULL,
	CONSTRAINT `PK_User` PRIMARY KEY (`id_user` ASC)
)

;

CREATE TABLE `User_Company`
(
	`id_user_company` VARCHAR(50) NOT NULL,
	`id_user` VARCHAR(50) NULL,
	`id_company` VARCHAR(50) NULL,
	CONSTRAINT `PK_User_Company` PRIMARY KEY (`id_user_company` ASC)
)

;

CREATE TABLE `User_Roles`
(
	`id_user_roles` VARCHAR(50) NOT NULL,
	`createdAt` DATETIME NOT NULL,
	`updateAt` DATETIME NOT NULL,
	`id_user` VARCHAR(50) NULL,
	`id_roles` VARCHAR(50) NULL,
	CONSTRAINT `PK_User_Roles` PRIMARY KEY (`id_user_roles` ASC)
)

;

CREATE TABLE `User_Societies`
(
	`id_user_societies` VARCHAR(50) NOT NULL,
	`id_societies` VARCHAR(50) NULL,
	`id_user` VARCHAR(50) NULL,
	CONSTRAINT `PK_User_Societies` PRIMARY KEY (`id_user_societies` ASC)
)

;

CREATE TABLE `User_TermsAndConditions`
(
	`id_user_termsandconditions` VARCHAR(50) NOT NULL,
	`value` VARCHAR(50) NOT NULL,
	`createdAt` DATETIME NOT NULL,
	`id_user` VARCHAR(50) NULL,
	`id_termsandconditions` VARCHAR(50) NULL,
	CONSTRAINT `PK_User_TermsAndConditions` PRIMARY KEY (`id_user_termsandconditions` ASC)
)

;

CREATE TABLE `User_Vendor`
(
	`id_user_vendor` VARCHAR(50) NOT NULL,
	`id_user` VARCHAR(50) NULL,
	`id_vendor` VARCHAR(50) NULL,
	CONSTRAINT `PK_User_Vendor` PRIMARY KEY (`id_user_vendor` ASC)
)

;

CREATE TABLE `Vendor`
(
	`id_vendor` VARCHAR(50) NOT NULL,
	`num_doc` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`address` VARCHAR(50) NOT NULL,
	`landline` VARCHAR(50) NOT NULL,
	`phone` VARCHAR(50) NOT NULL,
	`email` VARCHAR(50) NOT NULL,
	`fax` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_Vendor` PRIMARY KEY (`id_vendor` ASC)
)

;

CREATE TABLE `VendorCOL`
(
	`id_vendorcol` VARCHAR(50) NOT NULL,
	`ciiu` VARCHAR(50) NOT NULL,
	`electronic_bill` BOOL NOT NULL,
	`electronic_bill_email_true` VARCHAR(50) NULL,
	`electronic_bill_email_false` VARCHAR(50) NULL,
	`electronic_bill_operator` VARCHAR(50) NULL,
	`electronic_bill_nit` VARCHAR(50) NULL,
	`id_vendor` VARCHAR(50) NULL,
	`id_vendorcolpayment` VARCHAR(50) NULL,
	CONSTRAINT `PK_VendorCOL` PRIMARY KEY (`id_vendorcol` ASC)
)

;

CREATE TABLE `VendorCOLPayment`
(
	`id_vendorcolpayment` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`num_doc` VARCHAR(50) NOT NULL,
	`address` VARCHAR(50) NOT NULL,
	`landline` VARCHAR(50) NOT NULL,
	`phone` VARCHAR(50) NOT NULL,
	`email` VARCHAR(50) NOT NULL,
	`bank_num` VARCHAR(50) NOT NULL,
	`bank_account` VARCHAR(50) NOT NULL,
	`bank_city` VARCHAR(50) NOT NULL,
	`bank_office` VARCHAR(50) NOT NULL,
	`bank_name_legal` VARCHAR(50) NOT NULL,
	`bank_name_payment` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_VendorCOLPayment` PRIMARY KEY (`id_vendorcolpayment` ASC)
)

;

CREATE TABLE `VendorUSA`
(
	`id_vendorusa` VARCHAR(50) NOT NULL,
	`id_vendor` VARCHAR(50) NULL,
	CONSTRAINT `PK_VendorUSA` PRIMARY KEY (`id_vendorusa` ASC)
)

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `Banks` 
 ADD INDEX `IXFK_Banks_Countries` (`id_countries` ASC)
;

ALTER TABLE `Centers` 
 ADD INDEX `IXFK_Centers_Societies` (`id_societies` ASC)
;

ALTER TABLE `ContactPerson` 
 ADD INDEX `IXFK_ContactPerson_Vendor` (`id_vendor` ASC)
;

ALTER TABLE `Countries_Currency` 
 ADD INDEX `IXFK_Countries_Currency_Countries` (`id_countries` ASC)
;

ALTER TABLE `Countries_Currency` 
 ADD INDEX `IXFK_Countries_Currency_Currency` (`id_currency` ASC)
;

ALTER TABLE `States` 
 ADD INDEX `IXFK_States_Countries` (`id_countries` ASC)
;

ALTER TABLE `TypeDocument_Countries` 
 ADD INDEX `IXFK_TypeDocument_Countries_Countries` (`id_countries` ASC)
;

ALTER TABLE `TypeDocument_Countries` 
 ADD INDEX `IXFK_TypeDocument_Countries_TypeDocument` (`id_typedocument` ASC)
;

ALTER TABLE `User` 
 ADD INDEX `IXFK_User_Countries` (`id_countries` ASC)
;

ALTER TABLE `User_Company` 
 ADD INDEX `IXFK_User_Company_Company` (`id_company` ASC)
;

ALTER TABLE `User_Company` 
 ADD INDEX `IXFK_User_Company_User` (`id_user` ASC)
;

ALTER TABLE `User_Roles` 
 ADD INDEX `IXFK_User_Roles_Roles` (`id_roles` ASC)
;

ALTER TABLE `User_Roles` 
 ADD INDEX `IXFK_User_Roles_User` (`id_user` ASC)
;

ALTER TABLE `User_Societies` 
 ADD INDEX `IXFK_User_Societies_Societies` (`id_societies` ASC)
;

ALTER TABLE `User_Societies` 
 ADD INDEX `IXFK_User_Societies_User` (`id_user` ASC)
;

ALTER TABLE `User_TermsAndConditions` 
 ADD INDEX `IXFK_User_TermsAndConditions_TermsAndConditions` (`id_termsandconditions` ASC)
;

ALTER TABLE `User_TermsAndConditions` 
 ADD INDEX `IXFK_User_TermsAndConditions_User` (`id_user` ASC)
;

ALTER TABLE `User_Vendor` 
 ADD INDEX `IXFK_User_Vendor_User` (`id_user` ASC)
;

ALTER TABLE `User_Vendor` 
 ADD INDEX `IXFK_User_Vendor_Vendor` (`id_vendor` ASC)
;

ALTER TABLE `VendorCOL` 
 ADD INDEX `IXFK_VendorCOL_Vendor` (`id_vendor` ASC)
;

ALTER TABLE `VendorCOL` 
 ADD INDEX `IXFK_VendorCOL_VendorCOLPayment` (`id_vendorcolpayment` ASC)
;

ALTER TABLE `VendorUSA` 
 ADD INDEX `IXFK_VendorUSA_Vendor` (`id_vendor` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `Banks` 
 ADD CONSTRAINT `FK_Banks_Countries`
	FOREIGN KEY (`id_countries`) REFERENCES `Countries` (`id_countries`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Centers` 
 ADD CONSTRAINT `FK_Centers_Societies`
	FOREIGN KEY (`id_societies`) REFERENCES `Societies` (`id_societies`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `ContactPerson` 
 ADD CONSTRAINT `FK_ContactPerson_Vendor`
	FOREIGN KEY (`id_vendor`) REFERENCES `Vendor` (`id_vendor`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Countries_Currency` 
 ADD CONSTRAINT `FK_Countries_Currency_Countries`
	FOREIGN KEY (`id_countries`) REFERENCES `Countries` (`id_countries`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Countries_Currency` 
 ADD CONSTRAINT `FK_Countries_Currency_Currency`
	FOREIGN KEY (`id_currency`) REFERENCES `Currency` (`id_currency`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `States` 
 ADD CONSTRAINT `FK_States_Countries`
	FOREIGN KEY (`id_countries`) REFERENCES `Countries` (`id_countries`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `TypeDocument_Countries` 
 ADD CONSTRAINT `FK_TypeDocument_Countries_Countries`
	FOREIGN KEY (`id_countries`) REFERENCES `Countries` (`id_countries`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `TypeDocument_Countries` 
 ADD CONSTRAINT `FK_TypeDocument_Countries_TypeDocument`
	FOREIGN KEY (`id_typedocument`) REFERENCES `TypeDocument` (`id_typedocument`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User` 
 ADD CONSTRAINT `FK_User_Countries`
	FOREIGN KEY (`id_countries`) REFERENCES `Countries` (`id_countries`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_Company` 
 ADD CONSTRAINT `FK_User_Company_Company`
	FOREIGN KEY (`id_company`) REFERENCES `Company` (`id_company`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_Company` 
 ADD CONSTRAINT `FK_User_Company_User`
	FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_Roles` 
 ADD CONSTRAINT `FK_User_Roles_Roles`
	FOREIGN KEY (`id_roles`) REFERENCES `Roles` (`id_roles`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_Roles` 
 ADD CONSTRAINT `FK_User_Roles_User`
	FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_Societies` 
 ADD CONSTRAINT `FK_User_Societies_Societies`
	FOREIGN KEY (`id_societies`) REFERENCES `Societies` (`id_societies`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_Societies` 
 ADD CONSTRAINT `FK_User_Societies_User`
	FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_TermsAndConditions` 
 ADD CONSTRAINT `FK_User_TermsAndConditions_TermsAndConditions`
	FOREIGN KEY (`id_termsandconditions`) REFERENCES `TermsAndConditions` (`id_termsandconditions`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_TermsAndConditions` 
 ADD CONSTRAINT `FK_User_TermsAndConditions_User`
	FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_Vendor` 
 ADD CONSTRAINT `FK_User_Vendor_User`
	FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User_Vendor` 
 ADD CONSTRAINT `FK_User_Vendor_Vendor`
	FOREIGN KEY (`id_vendor`) REFERENCES `Vendor` (`id_vendor`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `VendorCOL` 
 ADD CONSTRAINT `FK_VendorCOL_Vendor`
	FOREIGN KEY (`id_vendor`) REFERENCES `Vendor` (`id_vendor`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `VendorCOL` 
 ADD CONSTRAINT `FK_VendorCOL_VendorCOLPayment`
	FOREIGN KEY (`id_vendorcolpayment`) REFERENCES `VendorCOLPayment` (`id_vendorcolpayment`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `VendorUSA` 
 ADD CONSTRAINT `FK_VendorUSA_Vendor`
	FOREIGN KEY (`id_vendor`) REFERENCES `Vendor` (`id_vendor`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1 
;
