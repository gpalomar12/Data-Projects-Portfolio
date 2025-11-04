SELECT * 
FROM CovidProject..CovidDeaths
WHERE continent IS NOT NULL

ORDER BY location, date;

--SELECT * FROM CovidProject..CovidVaccinations
--ORDER BY location, date

-- Select the data to be used

SELECT
	location,
	date,
	total_cases,
	new_cases,
	total_deaths,
	population

FROM CovidProject..CovidDeaths
ORDER BY location, date; 


-- Looking at total cases vs total deaths
-- Shows the likelihood of dying if you contract covid in your country

SELECT
	location,
	date,
	total_cases,
	total_deaths,
	(total_deaths/total_cases) * 100 AS death_rate

FROM CovidProject..CovidDeaths
WHERE location = 'United States'
ORDER BY location, date; 


-- Look at total cases vs populaton
SELECT
	location,
	date,
	population,
	total_cases,
	(total_cases/population) *100 AS infection_rate

FROM CovidProject..CovidDeaths
WHERE location = 'United States'
ORDER BY location, date; 

-- What countries have the highest infection rate?

SELECT
	location,
	population,
	MAX(total_cases) AS highest_infection_count,
	MAX((total_cases/population)) *100 AS infection_rate

FROM CovidProject..CovidDeaths
GROUP BY location, population
ORDER BY infection_rate desc; 

-- Showing the countries with the highest death count per population
SELECT
	location,
	MAX(cast(total_deaths AS int)) as total_death_count

FROM CovidProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_death_count desc; 


--Break things down by continent
SELECT
	location,
	MAX(cast(total_deaths AS int)) as total_death_count

FROM CovidProject..CovidDeaths
WHERE continent IS NULL AND location != 'World'
GROUP BY location
ORDER BY total_death_count desc; 

-- SHOWING continents with the highest death counts

SELECT
	continent,
	MAX(cast(total_deaths AS int)) as total_death_count

FROM CovidProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count desc; 

-- Showing continets with highest death count
SELECT
	continent,
	MAX(CAST(total_deaths AS INT)) as total_death_count
FROM CovidProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count desc

-- GLOBAL NUMBERS

SELECT
	date,
	SUM(new_cases) AS total_cases,
	SUM(CAST(new_deaths AS INT)) AS total_deaths,
	SUM(CAST(new_deaths AS INT))/SUM(new_cases) * 100 as death_rate
	
FROM CovidProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date 
ORDER BY 1,2; 

SELECT
	
	SUM(new_cases) AS total_cases,
	SUM(CAST(new_deaths AS INT)) AS total_deaths,
	SUM(CAST(new_deaths AS INT))/SUM(new_cases) * 100 as death_rate
	
FROM CovidProject..CovidDeaths
WHERE continent IS NOT NULL 
ORDER BY 1,2; 

-- Total Population vs Vaccinations

SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(CAST(vac.new_vaccinations AS INT)) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_vaccination_count

FROM CovidProject..CovidDeaths AS dea
JOIN CovidProject..CovidVaccinations AS vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3

-- USE CTE
WITH popvsvac (Continent, Location, Date, Population, New_Vaccinations, RollingVacCount)
AS
(
SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(CAST(vac.new_vaccinations AS INT)) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_vaccination_count

FROM CovidProject..CovidDeaths AS dea
JOIN CovidProject..CovidVaccinations AS vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent IS NOT NULL

)
SELECT *, (RollingVacCount/Population) * 100 AS VacRate
FROM popvsvac



-- TEMP TABLE
TRUNCATE TABLE #PercentPopulationVacinated;
DROP TABLE IF EXISTS #PercentPopulationVacinated

CREATE TABLE #PercentPopulationVacinated
(
	Continent nvarchar(255),
	Location nvarchar(255),
	Date datetime,
	Population numeric,
	New_vaccinations numeric,
	RollingVacCount numeric
)


INSERT INTO #PercentPopulationVacinated

SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(CAST(vac.new_vaccinations AS INT)) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_vaccination_count

FROM CovidProject..CovidDeaths AS dea
JOIN CovidProject..CovidVaccinations AS vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT *, (RollingVacCount/Population) * 100 AS PctPopulationVaccinated
FROM #PercentPopulationVacinated


--Create a view 

CREATE VIEW PercentPopulationVacinated AS (
SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(CAST(vac.new_vaccinations AS INT)) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_vaccination_count

FROM CovidProject..CovidDeaths AS dea
JOIN CovidProject..CovidVaccinations AS vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent IS NOT NULL
)