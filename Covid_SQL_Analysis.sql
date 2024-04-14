SELECT TOP (1000) *
FROM [PortfolioProject].[dbo].[CovidDeaths]


SELECT
	continent,
	location,
	sum(new_deaths) as Total_Deaths
FROM [PortfolioProject].[dbo].[CovidDeaths]
GROUP BY continent, location
order by 3 desc

--Exlude the rows where we don't have any continent information

SELECT
	location as Country,
	sum(new_deaths) as Total_Deaths,
	sum(new_cases) as Total_Cases,
	max(Population) as Population
FROM [PortfolioProject].[dbo].[CovidDeaths]
where continent is not null
GROUP BY location
order by 2 desc

CREATE VIEW ContryView as
SELECT
	location as Country,
	sum(new_deaths) as Total_Deaths,
	sum(new_cases) as Total_Cases,
	max(Population) as Population
FROM [PortfolioProject].[dbo].[CovidDeaths]
where continent is not null
GROUP BY location


SELECT TOP (1000) *
FROM [PortfolioProject].[dbo].[CovidDeaths]


-- Percentage of the Population Infected

SELECT
	location as Country,
	max(population),
	sum(new_cases) as Total_cases,
	sum(new_cases)/max(population)*100 as Percent_infected
FROM [PortfolioProject].[dbo].[CovidDeaths]
where continent is not null
group by location
order by 4 desc

CREATE VIEW CountryPercentInfected as 
SELECT
	location as Country,
	max(population) as Population,
	sum(new_cases) as Total_cases,
	sum(new_cases)/max(population)*100 as Percent_infected
FROM [PortfolioProject].[dbo].[CovidDeaths]
where continent is not null
group by location

-- Percentage of the Population Died

SELECT
	location as Country,
	max(population) as Population,
	sum(new_deaths) as Total_deaths,
	sum(new_deaths)/max(population)*100 as Percent_deaths
FROM [PortfolioProject].[dbo].[CovidDeaths]
where continent is not null
group by location
order by 4 desc

CREATE VIEW CountryPercentDeath as
SELECT
	location as Country,
	max(population) as Population,
	sum(new_deaths) as Total_deaths,
	sum(new_deaths)/max(population)*100 as Percent_deaths
FROM [PortfolioProject].[dbo].[CovidDeaths]
where continent is not null
group by location


-- Vaccination Data

SELECT TOP (1000) *
FROM [PortfolioProject].[dbo].[CovidVaccinations]


-- Percent Population Vaccinated

SELECT
	cd.location as Country,
	max(Population) as Population,
	coalesce(sum(new_vaccinations),0) as Total_Vaccinations,
	coalesce(sum(new_vaccinations)/max(Population),0)*100 as Percent_Vaccinated
FROM [PortfolioProject].[dbo].[CovidDeaths] As CD
JOIN [PortfolioProject].[dbo].[CovidVaccinations] As CV
ON CD.iso_code = CV.ISO_CODE
AND CD.date = CV.DATE
where cd.continent is not null
group by cd.location
order by 4 desc

CREATE VIEW Percent_Vaccinated AS
SELECT
	cd.location as Country,
	max(Population) as Population,
	coalesce(sum(new_vaccinations),0) as Total_Vaccinations,
	coalesce(sum(new_vaccinations)/max(Population),0)*100 as Percent_Vaccinated
FROM [PortfolioProject].[dbo].[CovidDeaths] As CD
JOIN [PortfolioProject].[dbo].[CovidVaccinations] As CV
ON CD.iso_code = CV.ISO_CODE
AND CD.date = CV.DATE
where cd.continent is not null
group by cd.location

-- Total Cases with Month-wise

SELECT
	format(CD.date, 'yyyy-MM') as Month,
	sum(new_cases) as Total_Cases,
	SUM(new_deaths) as Total_Deaths,
	SUM(new_tests) as Total_Tests
FROM [PortfolioProject].[dbo].[CovidDeaths] As CD
JOIN [PortfolioProject].[dbo].[CovidVaccinations] As CV
ON CD.iso_code = CV.ISO_CODE
AND CD.date = CV.DATE
group by format(CD.date, 'yyyy-MM')
order by 1

CREATE VIEW MonthlyReport AS
SELECT
	format(CD.date, 'yyyy-MM') as Month,
	sum(new_cases) as Total_Cases,
	SUM(new_deaths) as Total_Deaths,
	SUM(new_tests) as Total_Tests
FROM [PortfolioProject].[dbo].[CovidDeaths] As CD
JOIN [PortfolioProject].[dbo].[CovidVaccinations] As CV
ON CD.iso_code = CV.ISO_CODE
AND CD.date = CV.DATE
group by format(CD.date, 'yyyy-MM')


--- 7-week average reports

select TOP (1000)
	year(CD.date) as year, 
	datepart(week, CD.date) as week,
	SUM(new_cases) as Total_Cases,
	AVG(SUM(new_cases)) OVER(ORDER BY year(CD.date),datepart(week, CD.date) ROWS 7 PRECEDING) as average_cases_7weeks,
	SUM(new_deaths) as Total_Deaths,
	AVG(SUM(new_deaths)) OVER(ORDER BY year(CD.date),datepart(week, CD.date) ROWS 7 PRECEDING) as average_deaths_7weeks,
	SUM(new_tests) as Total_Tests,
	AVG(SUM(new_tests)) OVER(ORDER BY year(CD.date),datepart(week, CD.date) ROWS 7 PRECEDING) as average_tests_7weeks,
	SUM(new_vaccinations) as Total_Vaccinations,
	AVG(SUM(new_vaccinations)) OVER(ORDER BY year(CD.date),datepart(week, CD.date) ROWS 7 PRECEDING) as average_vaccination_7weeks
FROM [PortfolioProject].[dbo].[CovidDeaths] As CD
JOIN [PortfolioProject].[dbo].[CovidVaccinations] As CV
ON CD.iso_code = CV.ISO_CODE
AND CD.date = CV.DATE
GROUP BY year(CD.date), datepart(week, CD.date)
order by 1,2

DROP VIEW IF EXISTS weekly_average
CREATE VIEW weekly_average as
select 	
	year(CD.date) as year, 
	datepart(week, CD.date) as week,
	SUM(new_cases) as Total_Cases,
	AVG(SUM(new_cases)) OVER(ORDER BY year(CD.date),datepart(week, CD.date) ROWS 7 PRECEDING) as average_cases_7weeks,
	SUM(new_deaths) as Total_Deaths,
	AVG(SUM(new_deaths)) OVER(ORDER BY year(CD.date),datepart(week, CD.date) ROWS 7 PRECEDING) as average_deaths_7weeks,
	SUM(new_tests) as Total_Tests,
	AVG(SUM(new_tests)) OVER(ORDER BY year(CD.date),datepart(week, CD.date) ROWS 7 PRECEDING) as average_tests_7weeks,
	SUM(new_vaccinations) as Total_Vaccinations,
	AVG(SUM(new_vaccinations)) OVER(ORDER BY year(CD.date),datepart(week, CD.date) ROWS 7 PRECEDING) as average_vaccination_7weeks
FROM [PortfolioProject].[dbo].[CovidDeaths] As CD
JOIN [PortfolioProject].[dbo].[CovidVaccinations] As CV
ON CD.iso_code = CV.ISO_CODE
AND CD.date = CV.DATE
GROUP BY year(CD.date), datepart(week, CD.date)
