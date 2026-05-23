Movie Industry Correlation Analysis
Project Overview

This project explores movie industry data to identify the factors that influence box office gross revenue. Using Python for data cleaning, analysis, and visualisation, the project investigates relationships between movie budget, gross earnings, ratings, companies, and other film attributes.

The analysis focuses heavily on correlation analysis to determine which variables have the strongest impact on movie success.

Objectives
Analyse movie industry data using Python.
Identify relationships between movie budget and gross revenue.
Determine which variables strongly correlate with financial success.
Explore trends among movie companies and yearly revenues.
Visualise correlations and patterns using charts and heatmaps.
Perform data cleaning and preprocessing for accurate analysis.
Tools & Technologies
Python
Pandas
NumPy
Matplotlib
Seaborn
Jupyter Notebook
Dataset Features

The dataset includes information such as:

Movie Name
Budget
Gross Revenue
Score/Rating
Company
Genre
Release Year
Votes
Runtime
Data Cleaning & Preparation

The following preprocessing steps were performed before analysis:

Imported and inspected the dataset using Pandas.
Checked for missing/null values across all columns.
Reviewed and corrected data types where necessary.
Removed duplicate records.
Converted categorical variables into numerical values using factorisation.
Extracted release year information from the release date column.
Sorted and filtered relevant columns for better analysis.

Example cleaning tasks:

df.drop_duplicates()

df['Year'] = df['released'].astype(str).str[:4]


Exploratory Data Analysis (EDA)
Revenue & Budget Analysis
Analysed the relationship between movie budgets and gross earnings.
Used scatterplots and regression plots to visualise trends.
Correlation Analysis

Correlation matrices were generated using:

Pearson Correlation
Kendall Correlation
Spearman Correlation

Heatmaps were used to visualise relationships between variables.

Company Revenue Analysis
Identified the top movie production companies by gross revenue.
Compared yearly revenue trends across companies.
Key Insights
Budget and gross earnings showed a strong positive correlation.
Votes also had a noticeable relationship with gross revenue.
Higher-budget movies generally generated higher earnings.
Some production companies consistently outperformed others financially.
Correlation heatmaps helped identify the strongest predictors of movie success.
Visualisations Included
Scatterplots
Regression plots
Correlation heatmaps
Boxplots
Revenue comparisons by company