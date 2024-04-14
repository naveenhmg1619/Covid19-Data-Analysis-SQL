# COVID-19 Data Analysis Project

## About
This project analyzes COVID-19 data to extract meaningful insights related to cases, deaths, testing, and vaccinations. The analysis is performed using SQL queries on a dataset that includes detailed records of the pandemic's impact on a global scale.

## Business Problem
The ongoing COVID-19 pandemic has posed significant challenges to public health systems worldwide. Understanding the spread of the virus, the effectiveness of testing, and the impact of vaccinations is crucial for policymakers and health professionals to make informed decisions.

## Skills Used
- Advanced **SQL** querying for data manipulation and extraction, including:
  - **Joins**: Utilizing inner joins to combine rows from different tables based on related columns.
  - **Window Functions**: Employing functions like `SUM()` and `AVG()` over specific partitions of the dataset to calculate running totals and averages.
  - **Aggregation**: Grouping data to calculate totals and averages for cases, deaths, tests, and vaccinations.
  - **Ordering and Grouping**: Sorting and grouping data to identify trends and patterns.
  - **Views**: Creating views for efficient data access and reusable queries.
- Data analysis and aggregation to identify key metrics and trends.
- Data visualization with **Tableau** for creating interactive dashboards.
- Initial data processing with **Excel** to clean and split the dataset into manageable CSV files for SQL Server import.

## About the Dataset
The dataset began as a comprehensive Excel file containing daily counts of new cases, deaths, tests, and vaccinations, along with population figures. Initial analysis was conducted in Excel, where the dataset was split into two CSV files for detailed examination and then added to the SQL server. It is now stored in a SQL database and is accessed through the `[PortfolioProject].[dbo].[CovidDeaths]` and `[PortfolioProject].[dbo].[CovidVaccinations]` tables.

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

## Dashboard Visualization
The SQL views created are utilized to build an interactive dashboard in Tableau, providing a visual representation of the pandemic's data. This dashboard allows users to quickly grasp complex information through charts and graphs.

**Tableau Dashboard Image Placeholder**
![Dashboard](https://github.com/naveenhmg1619/Covid19-Data-Analysis/assets/119645691/288c94ad-0b70-4513-98b2-396a16af7d3a)

[**Link to Tableau Public Dashboard**](https://public.tableau.com/views/CovidCaseTableauAnalysis/Dashboard1?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)
View the Tableau Dashboard on Tableau Public

## Conclusion
The SQL queries and views created in this project provide a robust framework for analyzing the COVID-19 dataset. The insights gained can help in understanding the pandemic's trajectory and evaluating the response efforts. The Tableau dashboard further enhances the ability to visualize and interpret the data effectively.

