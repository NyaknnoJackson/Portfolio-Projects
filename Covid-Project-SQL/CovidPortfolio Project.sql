Select *
from CovidPortfolio..CovidDeaths
where continent is not null
order by 3,4

Select *
from CovidPortfolio..CovidVaccinations$
where continent is not null
order by 3,4

select location, date, total_cases, new_cases, population 
from CovidDeaths
where continent is not null
order by 1,2


-- total cases vs total deaths
--likelihood of dying if you are Nigeria 
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths
where location like '%nigeria%'
order by 1,2


-- total cases vs population
--infected pouplation in percentage

select location, date, total_cases, population, (total_cases/population)*100 as PercentofInfectedPopulation
from CovidDeaths
where location like '%nigeria%'
and continent is not null
order by 1,2


--country with highest infection rate per population

select location, population, max(total_cases) as HighestInfectionCount, max(total_cases/population)*100 as PercentofInfectedPopulation
from CovidDeaths
--where location like '%nigeria%'
where continent is not null
group by location, population
order by PercentofInfectedPopulation desc


--country with highest death count per population

select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from CovidDeaths
--where location like '%nigeria%'
where continent is not null
group by location
order by TotalDeathCount desc


--LOOKING AT CASES BY CONTINENT

select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from CovidDeaths
--where location like '%nigeria%'
where continent is not null
group by continent
order by TotalDeathCount desc


--Global Numbers
--Total global death, new cases and death percetage by date

select date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(New_Deaths as int))/sum(New_Cases)*100 as DeathPercentage
from CovidDeaths
--where location like '%nigeria%'
where continent is not null
group by date
order by 1,2


--Total Global Death, New Cases and Death Percentage

select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(New_Deaths as int))/sum(New_Cases)*100 as DeathPercentage
from CovidDeaths
--where location like '%nigeria%'
where continent is not null
--group by date
order by 1,2


--JOINING TWO TABLES (DEATH AND VACCINATION)

select *
from CovidDeaths dea
join CovidVaccinations$ vac
	on dea.location = vac.location
	and dea.date = vac.date


	-- Looking at TOTAL POPULATION VS VACCINATION

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(Convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from CovidDeaths dea
join CovidVaccinations$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3


--Using CTE

with PopvsVac (continent, location, date, population, new_Vaccinations, RollingPeopleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(Convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from CovidDeaths dea
join CovidVaccinations$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
select *,(RollingPeopleVaccinated/population)*100
from PopvsVac



-- TEMP TABLE

Drop Table if exists #percentagePopulationVaccinated
create table #percentagePopulationVaccinated
(
continent nvarchar(255),
location nvarchar(225),
date datetime,
Population numeric,
New_Vaccination numeric,
RollingPeopleVaccinated numeric
)

insert into #percentagePopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(Convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from CovidDeaths dea
join CovidVaccinations$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

select *,(RollingPeopleVaccinated/population)*100
from #percentagePopulationVaccinated



--creating view for later vilualization

create view percentagePopulationVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(Convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from CovidDeaths dea
join CovidVaccinations$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3


select *
from percentagePopulationVaccinated