# pathfindR : An R Package for Pathway Enrichment Analysis Utilizing Active Subnetworks

[![Travis-CI Build Status](https://travis-ci.org/egeulgen/pathfindR.svg?branch=master)](https://travis-ci.org/egeulgen/pathfindR) [![CRAN version](http://www.r-pkg.org/badges/version-ago/pathfindR)](https://cran.r-project.org/package=pathfindR) [![CRAN downloads](https://cranlogs.r-pkg.org/badges/grand-total/pathfindR)](https://cran.r-project.org/package=pathfindR)

`pathfindR` is a tool for pathway enrichment analysis via active subnetworks. The package also offers the option to cluster the enriched pathways and choose representative pathways. The method is described in detail in _Ulgen E, Ozisik O, Sezerman OU. 2018. pathfindR: An R Package for Pathway Enrichment Analysis Utilizing Active Subnetworks. bioRxiv. [https://doi.org/10.1101/272450](https://doi.org/10.1101/272450)_

## Installation

From CRAN (release):
```r
install.packages("pathfindR")
```

From GitHub (devel):
```r
install.packages("devtools") # if you have not installed "devtools" package
devtools::install_github("egeulgen/pathfindR")
```

## Overview of the Enrichment Workflow

![pathfindR Enrichment Workflow](./vignettes/pathfindr.png?raw=true "pathfindr Enrichment Workflow")
This workflow takes in a data frame consisting of Gene Symbol, log-fold-change and adjusted-p values. After input testing, any gene symbol that is not in the protein-protein interaction network (PIN) is converted to an alias symbol if there is an alias that is in the PIN. Next, active subnetwork search is performed. Pathway enrichment analyses are then performed using the genes in each of the identified active subnetworks. Pathways with adjusted p values larger than a given threshold are discarded. The lowest adjusted p value (over all active subnetworks) for each pathway is kept. This process of active subnetwork search and enrichment analyses is repeated for a selected number of iterations, which is done in parallel. Over all iterations, the lowest and the highest adjusted-p values, as well as number of occurrences are reported for each enriched pathway.

This workflow can be run using the function `run_pathfindR`:

```r
result <- run_pathfindR(RA_input)

# to change the PIN (default = Biogrid)
result <- run_pathfindR(RA_input, pin_name = "IntAct")
# to use an external PIN of user's choice
result <- run_pathfindR(RA_input, pin_name = "/path/to/myPIN.sif")

# to change the active subnetwork search algorithm (default = "GR", i.e. greedy algorithm)
# for simulated annealing:
result <- run_pathfindR(RA_input, search_method = "SA")

# to change the number of iterations (default = 10)
result <- run_pathfindR(RA_input, iterations = 5) 

# to manually specify the number processes used during parallel loop by foreach
# defaults to the number of detected cores 
result <- run_pathfindR(RA_input, n_processes = 2) 
```


## Overview of the Clustering Workflow

![Pathway Clustering Workflow](./vignettes/pw_clustering.png?raw=true "Pathway Clustering Workflow")
This workflow first calculates the pairwise distances between the pathways in the resulting data frame. Via a shiny app, presented as an HTML document, the hierarchical clustering dendrogram is visualized. In this HTML document, the user can select the agglomeration method and the distance value at which to cut the tree. The dendrogram with the cut-off value marked with a red line is dynamically visualized and the resulting cluster assignments of the pathways along with annotation of representative pathways (chosen by smallest lowest p value) are presented as a table. This table can be saved as a csv file via pressing the button `Get Pathways w\ Cluster Info`.

The wrapper function for this workflow is `choose_clusters()`.

## Dependencies
For the active subnetwork search component to work, the user must have [JAVA](https://www.java.com/en/download/manual.jsp) installed and path/to/java must be in the PATH environment variable.

### Resources
The PINs were gathered from various resources:
- [Biogrid](https://downloads.thebiogrid.org/BioGRID)
- [GeneMania](http://genemania.org/data/): only interactions with weights >= 0.0006 were kept.
- [IntAct](https://www.ebi.ac.uk/intact/)
- KEGG PIN - created via an in-house script.


