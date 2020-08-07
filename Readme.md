# datasetArchiveApp

<!-- badges: start -->
[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->

Shiny app to extract dataset archive from SNO-Tourbières database with two formats : 
	- Theia/OZCAR : zip file of data by variable and metadata (ISO19115/INSPIRE, O&M and DataCite)
	- Zenodo : zip file by dataset and metadata (ISO19115/INSPIRE, O&M and DataCite)

## Installation

You can install the released version of dataAccessApp with:

``` r
devtools::install_github("Rosalien/datasetArchiveApp")
```

## Deploy

### Depencies

### Deploy in local

``` r
library(toolboxApp)
datasetArchiveApp::run_app(language="en",pool="dbconfProd.yaml")
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

```bash
docker build -t dataaccessapp
```

```bash
docker run --net=host dataaccessapp
```
