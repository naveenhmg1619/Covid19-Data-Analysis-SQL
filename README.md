# COVID-19 Data Analysis Project

## About
This project aims to analyze the COVID-19 data to extract meaningful insights related to cases, deaths, testing, and vaccinations. The analysis is performed using SQL queries on a dataset that includes detailed records of the pandemic's impact on a global scale.

## Business Problem
The ongoing COVID-19 pandemic has posed significant challenges to public health systems worldwide. Understanding the spread of the virus, the effectiveness of testing, and the impact of vaccinations is crucial for policymakers and health professionals to make informed decisions.

## Skills Used
- SQL querying for data manipulation and extraction
- Data analysis and aggregation
- Creating views for reusable queries
- Calculating statistical measures such as averages and percentages

## About the Dataset
The dataset is a comprehensive collection of COVID-19 related data, including daily counts of new cases, deaths, tests, and vaccinations, along with population figures. It is stored in a SQL database and is accessed through the `[PortfolioProject].[dbo].[CovidDeaths]` and `[PortfolioProject].[dbo].[CovidVaccinations]` tables.

## Analysis Objectives
- To determine the total number of cases, deaths, tests, and vaccinations.
- To calculate the percentage of the population infected, vaccinated, and deceased due to COVID-19.
- To analyze trends over time, including weekly averages and month-wise summaries.

## Problems and Solutions
- **Problem**: Incomplete data for certain records, particularly missing continent information.
  **Solution**: Exclusion of rows with null continent values to maintain data integrity.
- **Problem**: Need for a quick reference to key statistics.
  **Solution**: Creation of views such as `ContryView`, `CountryPercentInfected`, `CountryPercentDeath`, and `Percent_Vaccinated` for easy access to aggregated data.
- **Problem**: Understanding long-term trends.
  **Solution**: Calculation of 7-week rolling averages for cases, deaths, tests, and vaccinations to smooth out short-term fluctuations and reveal trends.

## Conclusion
The SQL queries and views created in this project provide a robust framework for analyzing the COVID-19 dataset. The insights gained can help in understanding the pandemic's trajectory and evaluating the response efforts.
