Nashville Housing Data Cleaning in SQL
Project Overview

This project focuses on cleaning and transforming a housing dataset using SQL Server. The goal was to prepare raw Nashville housing data for analysis by handling missing values, standardising formats, splitting columns, removing duplicates, and improving overall data quality.

The project demonstrates practical SQL data cleaning techniques commonly used in real-world data analytics workflows.

Objectives
Clean and prepare raw housing data for analysis.
Standardise inconsistent date formats.
Populate missing property address values.
Split address fields into separate columns.
Convert abbreviated categorical values into readable formats.
Identify and remove duplicate records.
Remove unnecessary columns to improve dataset structure.
Demonstrate advanced SQL data import techniques.
Tools & Technologies
SQL Server
SQL Server Management Studio (SSMS)
T-SQL
Dataset Description

The dataset contains housing sales information including:

Parcel ID
Property Address
Owner Address
Sale Date
Sale Price
Legal Reference
Tax District
Sold As Vacant Status
Data Cleaning Process
1. Standardising Date Format

The sale date column was converted into a standard SQL DATE format for consistency and easier analysis.

Example:

CONVERT(Date, SaleDate)

A new column called SaleDateConverted was created when direct updates were not suitable.

2. Handling Missing Property Addresses

Missing property addresses were populated using self joins based on matching ParcelID values.

Techniques used:

Self Join
ISNULL()

Example:

ISNULL(a.PropertyAddress, b.PropertyAddress)
3. Splitting Address Columns

Address fields were separated into individual columns for improved usability.

Property Address Split Into:
Property Address
City

Functions used:

SUBSTRING()
CHARINDEX()
Owner Address Split Into:
Owner Address
City
State

Functions used:

PARSENAME()
REPLACE()
4. Standardising Categorical Values

The SoldAsVacant field originally contained:

Y
N

These were transformed into:

Yes
No

Using:

CASE WHEN
5. Removing Duplicate Records

Duplicate rows were identified using a Common Table Expression (CTE) and ROW_NUMBER().

Columns used for duplicate detection:

ParcelID
PropertyAddress
SalePrice
SaleDate
LegalReference

Example:

ROW_NUMBER() OVER (
PARTITION BY ...
)
6. Removing Unused Columns

Unused and redundant columns were dropped to improve dataset cleanliness and structure.

Removed columns:

OwnerAddress
TaxDistrict
PropertyAddress
SaleDate
SQL Concepts Demonstrated
Data Type Conversion
Self Joins
Common Table Expressions (CTEs)
Window Functions
String Functions
Conditional Logic
Table Alterations
Data Standardisation
Advanced Techniques Included

The project also explored advanced SQL data import methods such as:

BULK INSERT
OPENROWSET

These techniques allow importing external CSV and Excel files directly into SQL Server.

Key Outcomes
Improved dataset consistency and structure.
Reduced duplicate and incomplete records.
Enhanced data usability for future analysis and reporting.
Demonstrated practical SQL data cleaning workflows used in data analytics.