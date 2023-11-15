/*Explorimng the global death rate*/

Select SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS INT)) AS total_deaths, SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS global_death_rate
From Covidproject.coviddeaths
Where continent is not null
Order by 1,2

/*Exploring total death counts within Europe, International and World*/

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From Covidproject.coviddeaths
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

/*Exploring couintries with highest infection rate*/

Select location, population, MAX(total_cases) AS high_infection_count, MAX((total_cases/population))*100 AS infection_rates
From Covidproject.coviddeaths
Group by location, population
Order by infection_rates DESC

Select location, population, date, MAX(total_cases) AS high_infection_count, MAX((total_cases/population))*100 AS infection_rates
From Covidproject.coviddeaths
Group by location, population, date
Order by infection_rates DESC
