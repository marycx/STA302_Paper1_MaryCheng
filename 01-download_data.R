---
Purpose: Download and clean data from opendatatoronto # change this
author: "Mary Cheng"
Date: 19 January 2024
Contact: maryc.cheng@mail.utoronto.ca
---

```{r}
install.packages("gitcreds")
```

```{r}
library(gitcreds)
```

```{r}
gitcreds_set()
```

```{r}
install.packages("tidyverse")
install.packages("janitor")
install.packages("dplyr")
install.packages("tidyr")
install.packages("opendatatoronto")
install.packages("knitr")
install.packages("lubridate")
install.packages("patchwork")
```

```{r}
# workspace setup
library(tidyverse)
library(janitor)
library(dplyr)
library(tidyr)
library(opendatatoronto)
library(knitr)
library(lubridate)
library(patchwork)
```

```{r}
# get package
package <- show_package("mental-health-apprehensions")
	
package
	
# get all resources for this package
resources <- list_package_resources("mental-health-apprehensions")
	
# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
	
# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
	
data
```

```{r}
write.csv(x = monthly_shelter_usage,
          file = "inputs/data/raw.csv")
```
