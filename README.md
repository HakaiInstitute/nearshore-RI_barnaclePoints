# Barnacle Dynamics: Point Intercepts

<div float="left">
<img src=docs/logos/tula-logo.png />
<img src=docs/logos/hakai-logo.png />
</div>


## Data Use
This data is licensed under a Creative Commons Attribution 4.0 International 
License (CC-BY).

In light of the effort required to create data packages, we request that in 
addition to following the CC-BY license terms, that users 1) respect the data 
providers, and provide helpful feedback on data quality, and 2) communicate 
and/or collaborate with Hakai Nearshore researchers if you are considering 
using this dataset for manuscripts or other forms of reporting.

## Summary
This data package is a component of the Hakai Institute’s Nearshore research 
and monitoring program. The overarching objective of Hakai Nearshore research 
is to investigate the role of habitats and their associated communities, in the
face of stress and disturbances from global climate change and local coastal 
perturbations. 

The Rocky Intertidal program is a subset of Hakai Nearshore, and is designed to
quantify change in rocky shore intertidal habitats and their associated 
communities. Please see the list of all Rocky Intertidal program data packages 
here: 
https://docs.google.com/document/d/11uqZNnwSabw0thcbntlTkZpVgVAkjPDJS17_ur6W7S8/edit

## Survey Methods
This data package collects data and information relating to barnacle community 
surveys conducted in the rocky intertidal of Calvert Island BC, starting in 
2019. Surveys were conducted using 5 permanent plots at each site, wherein 
cover was recorded using a 100 point gridded quadrat. For a detailed 
description, please see the Rocky Intertidal protocol contained in this dataset.

**NOTE:** This data package is intrinsically linked to the 
Barnacle Dynamics: Point Intercepts (2016 2018) surveys, which were done using 
the same experimental setup, locations, and methodology, with one key difference:

For barnacle point intercept surveys performed from 2016-2018, the taxon 
recorded at each point intercept was the first "layer" directly under the 
point, with no differentiation between understory/overstory layers as was done
in surveys from 2019 onwards. To compare these two datasets, the following must 
be done:

- Reduce point observations from understory/overstory taxa to a single taxa 
column (see joining example script). Observations with overstory taxa will have 
the overstory taxa mapped to the new column, while those points with no 
overstory will have the understory mapped to the new column.
- Summarize the reduced data into point counts.
- Map variables from summarized data to 2016-2018 data (see example script).

<img src=docs/examples/BarnacleJoiningExample.jpeg />

**Visual demonstration of how to summarize survey data and join with 2016-2018 data**

## Resources
See the data dictionary file for a complete description of data variables, units 
and descriptions.

- ***Data*** 
	- **barnacle_point_intercepts-surveys.csv:** Counts of barnacle species 
quantified within a set area (75cmx50cm) using point-intercept method. 
Individual plots are replicated across time. 
	
- ***Scripts***
	- **barnacle_summary_example.R:** Reference script for summarizing survey
 data into understory/overstory counts.

<img src=docs/examples/BarnacleSummaryExample.jpeg />

**Visual demonstration of how to summarize survey data into overstory/understory counts**

- **barnacle_joining_example.R:** Reference script for summarizing survey data 
into counts and joining with data from 2016-2018 surveys. 

- ***Protocols:***
	- **rocky_intertidal-protocol.pdf:** Detailed description of field survey
 methods and equipment. 

---
Contact Tyrel Froese or Alyssa Gehman at nearshore@hakai.org if you have any 
questions.