COVID-19 Data Exploration in SQL
Project Overview

This project explores global COVID-19 data using SQL Server to analyse infection rates, death rates, vaccination progress, and worldwide pandemic trends.

The analysis combines data from COVID deaths and vaccination datasets to generate insights about the spread and impact of the virus across countries and continents.

The project demonstrates the use of SQL for:

Data exploration
Aggregation
Joins
Window functions
Common Table Expressions (CTEs)
Temporary tables
Views
Objectives
Analyse global COVID-19 cases and deaths.
Calculate infection and death percentages.
Identify countries with the highest infection and death rates.
Compare COVID-19 statistics across continents.
Track vaccination progress over time.
Build reusable SQL views for visualisation and reporting.
Tools & Technologies
SQL Server
SQL Server Management Studio (SSMS)
T-SQL
Dataset Description

The project uses two datasets:

COVID Deaths Dataset

Includes:

Location
Date
Total Cases
New Cases
Total Deaths
Population
Continent
COVID Vaccinations Dataset

Includes:

Location
Date
New Vaccinations
Vaccination Metrics
Data Exploration & Analysis
1. Exploring COVID Deaths and Vaccination Data

Initial queries were used to inspect and filter relevant records where continent data was available.

Example:

WHERE continent IS NOT NULL
2. Total Cases vs Total Deaths

The likelihood of dying after contracting COVID-19 was analysed using Nigeria as a case study.

Metrics calculated:

Total Cases
Total Deaths
Death Percentage

Formula used:

(total_deaths / total_cases) * 100
3. Infection Rate Compared to Population

The percentage of the population infected with COVID-19 was calculated.

Metrics:

Total Cases
Population
Infection Percentage
4. Countries with Highest Infection Rates

Countries were ranked based on:

Highest infection count
Percentage of population infected

Techniques used:

GROUP BY
MAX()
Aggregate calculations
5. Countries with Highest Death Counts

Countries with the highest recorded COVID-19 deaths were identified.

Functions used:

MAX(CAST(total_deaths AS int))
6. Continental Analysis

Death counts were aggregated by continent to compare the pandemic’s impact globally.

7. Global COVID Statistics

Global totals were calculated using:

Total Cases
Total Deaths
Global Death Percentage

Daily and overall global summaries were generated using:

SUM()
Aggregations by date
Vaccination Analysis
8. Joining Death and Vaccination Tables

The project combined both datasets using:

Location
Date

Example:

JOIN CovidVaccinations$ vac
ON dea.location = vac.location
AND dea.date = vac.date
9. Rolling Vaccination Totals

A rolling cumulative vaccination count was created using window functions.

Functions used:

SUM() OVER()
PARTITION BY

Example:

SUM(CONVERT(int, vac.new_vaccinations))
OVER (PARTITION BY dea.location ORDER BY dea.date)
10. Using Common Table Expressions (CTEs)

CTEs were used to simplify vaccination analysis and calculate vaccination percentages relative to population.

11. Temporary Tables

Temporary tables were created to store intermediate vaccination calculations for further analysis.

Example:

#percentagePopulationVaccinated
12. Creating SQL Views

A reusable SQL view was created for future data visualisation and reporting.

View created:

percentagePopulationVaccinated
SQL Concepts Demonstrated
Joins
Aggregate Functions
Window Functions
Common Table Expressions (CTEs)
Temporary Tables
Views
Data Filtering
Type Conversion
Rolling Calculations
Key Insights
Some countries recorded significantly higher infection rates relative to population.
Global death percentages varied over time.
Vaccination rollouts showed gradual increases across nations.
Rolling vaccination totals provided clearer insight into vaccination progress.
Continental comparisons revealed differing pandemic impacts globally.

link to dataset: https://ourworldindata.org/covid-deaths
