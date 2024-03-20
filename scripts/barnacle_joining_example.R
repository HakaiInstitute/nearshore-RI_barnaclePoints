#================== Introduction ==============================================
# Author: Tyrel Froese
# Project: Rocky Intertidal
# Last Modified: 2024-03-20
#
# This script provides an example for summarizing Barnacle point counts from
# the Hakai Institute's Rocky Intertidal surveys on Calvert Island BC. The
# script manipulates point count data from 2019 onwards into a form which can 
# be compared to Barnacle point counts from 2016-2018 surveys, and combines the
# two datasets together.
#
#================== Setup =====================================================

# Load packages for tidying and summarizing data
library(tidyr)
library(dplyr)

# Load unsummarized survey data (set working directory to data location)
barnacle.data <- read.csv("BarnaclePointIntercepts-Surveys.csv", 
                          stringsAsFactors = FALSE)

# Load 2016-2018 data (ensure data is in working directory)
barnacle.arch <- read.csv("BarnaclePointIntercepts2016-2018-Surveys.csv",
                          stringsAsFactors = FALSE)

#================== Reformat Unsummarized Data ================================
# This section of code will reformat understory/overstory observations into a
# single column. Observations with both understory and overstory will have the
# overstory observation added to the new column, while observations with no
# overstory will remain unchanged.

# Add new column to unsummarized data
barnacle.data$taxon_code <- ''

# Split off observations with no overstory & set taxon code to understory
barnacle.understory <- barnacle.data[barnacle.data$overstory_taxon_code == '',]
barnacle.understory$taxon_code <- barnacle.understory$understory_taxon_code

# Split off observations with overstory & set taxon code to overstory
barnacle.overstory <- barnacle.data[barnacle.data$overstory_taxon_code != '',]
barnacle.overstory$taxon_code <- barnacle.overstory$overstory_taxon_code

# Recombine barnacle data, group, and count observations
barnacle.data2 <- rbind(barnacle.overstory, barnacle.understory)

barnacle.data2 <- barnacle.data2 %>% 
  select(date, site, observer, plot, total_intercepts_counted, taxon_code, 
         entered_by, checked_by) %>% 
  group_by(date, site, observer, plot, total_intercepts_counted, taxon_code, 
           entered_by, checked_by) %>% 
  count()

#================== Combine Data Sets =========================================

# rename 'n' column from summarized data to 'count' for compatibility
colnames(barnacle.data2)[9] <- 'count'

# Add empty notes column to summarized 2019- data (lost during summarization)
barnacle.data2$notes <- NA

# Combine datasets together
barnacle.joined <- dplyr::bind_rows(barnacle.arch, barnacle.data2)