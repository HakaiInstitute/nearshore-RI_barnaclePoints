#================== Introduction ==============================================
# This script is meant to summarize barnacle point count data from 2019-
# surveys. It will split understory and overstory taxa and add a new understory
# overstory column to differentiate between counts.

#================== Setup =====================================================

# Load packages for tidying and summarizing data
library(tidyr)
library(dplyr)

# Load unsummarized survey data (set working directory to data location)
barnacle.data <- read.csv("BarnaclePointIntercepts-Surveys.csv", 
                          stringsAsFactors = FALSE)

#================== Split survey data =========================================

# Split off understory observations and count
barnacle.understory <- barnacle.data %>% 
  select(date, site, observer, plot, total_intercepts_counted, 
         understory_taxon_code, entered_by, checked_by) %>% 
  group_by(date, site, observer, plot, total_intercepts_counted, 
           understory_taxon_code, entered_by, checked_by) %>% 
  count()

#add understory/overstory column and rename columns
barnacle.understory$understory_overstory <- "understory"
colnames(barnacle.understory) <- c("date", "site", "observer", "plot", 
                                   "total_intercepts_counted","taxon_code", 
                                   "entered_by", "checked_by", "count", 
                                   "understory_overstory")

#split off overstory observations, group to taxon code, and count 
barnacle.overstory <- barnacle.data %>% 
  select(date, site, observer, plot, total_intercepts_counted, 
         overstory_taxon_code, entered_by, checked_by) %>% 
  group_by(date, site, observer, plot, total_intercepts_counted, 
           overstory_taxon_code, entered_by, checked_by) %>% 
  count()

#delete blank overstory observations (points with no overstory present)
barnacle.overstory <- barnacle.overstory[!(barnacle.overstory$overstory_taxon_code == ""), ]

#add understory/overstory column and rename columns
barnacle.overstory$understory_overstory <- "overstory"
colnames(barnacle.overstory) <- c("date", "site", "observer", "plot", 
                                  "total_intercepts_counted","taxon_code", 
                                  "entered_by", "checked_by", "count", 
                                  "understory_overstory")

# Bind understory and overstory counts together
barnacle.summarized <- rbind.data.frame(barnacle.understory, barnacle.overstory)