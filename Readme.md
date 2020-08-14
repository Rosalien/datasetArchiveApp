# datasetArchiveApp

<!-- badges: start -->
[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->

Shiny app to extract dataset archive from SNO-Tourbières database with two formats : 

	- Theia/OZCAR : zip file of data by variable and metadata (ISO19115/INSPIRE, O&M and DataCite)
	- Zenodo : zip file by dataset and metadata (ISO19115/INSPIRE, O&M and DataCite). Use to create DOI in [ZENODO](https://www.zenodo.org/communities/sno_tourbieres_data)

## Installation

You can install the released version of datasetArchiveApp with:

``` r
devtools::install_github("Rosalien/datasetArchiveApp")
```

## Database configuration

dataAccessApp works with a postgresql database build with [data-snot.cnrs.fr](https://data-snot.cnrs.fr/). To test dataAccessApp, you can used a [dump of database test](https://github.com/Rosalien/dataAccessApp/tree/master/inst/extdata) with these parameters :

- dbname: "sno"
- host: "localhost"
- port: "5432"
- user : "snouser"
- password: "sno001"

## Deploy

### Deploy in local

``` r
language <- "en" #'en' or 'fr'
pool <- "dbconfProd.yaml" #yaml of database configuration 
dataAccessApp::run_app(language,pool)
```

### Shiny-server

Copy/paste package folder into shiny-server folder

``` r
git clone https://github.com/Rosalien/datasetArchiveApp.git
cp -r datasetArchiveApp/* to/the/Shiny-server/folder/
```

Modify `app.R` for language and database configuration :

- language : 'en' or 'fr'
- pool : database configuration

``` r
datasetArchiveApp::run_app(language,pool)
```

### Docker

Build and run database test :

```bash
cd inst/extdata/
docker build -t snodb .
docker run -d --name snodbrun -p 5433:5432 snodb:latest
docker exec -i snodbrun pg_restore --clean --dbname sno -h localhost -p 5432 -U snouser < snotest.dump
```

Build dataAccessApp :

```bash
docker build -t datasetarchiveapp .
```

Deploy dataAccessApp :

```bash
docker run --net=host datasetarchiveapp
```