/*
=================================================================
Create Database and Schemas
=================================================================
Script Purpose:
  This script creates a new database named datawarehouse after checking if it already exists.
  If the database exists, it is dropped and recreated. Additionally the script sets up three schemas within the database: 'bronze','silver' and 'gold'

Warning:
  Running this script will drop the entire 'Datawarehouse' database if it exists. All data in the databae will be permanently deleted. 
  Proceed with caution and ensure you have proper back ups before running this script.
*/

use master;
go
  
-- drop and recreate 'datawarehouse' database
create database datawarehouse2;
go
  
use datawarehouse2;
go
  
-- create schemas
create schema bronze;
go
create schema silver;
go
create schema gold;
go
