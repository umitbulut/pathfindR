% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/enrichment.R
\name{enrichment}
\alias{enrichment}
\title{Perform Enrichment Analysis}
\usage{
enrichment(genes_by_pathway, genes_of_interest, pathways_list,
  adj_method = "bonferroni", enrichment_threshold, pin_path)
}
\arguments{
\item{genes_by_pathway}{List that contains genes for each pathway. Names of
this list are KEGG IDs.}

\item{genes_of_interest}{The set of gene symbols to be used for enrichment
analysis. In the scope of this package, these are genes that were
identified for an active subnetwork.}

\item{pathways_list}{List that contains pathway descriptions for KEGG pathway
IDs. Names of this list are KEGG IDs.}

\item{adj_method}{correction method to be used for adjusting p-values.}

\item{enrichment_threshold}{adjusted-p value threshold used when filtering
pathway enrichment results}

\item{pin_path}{path to the Protein-Protein Interaction Network (PIN) file used in
the analysis}
}
\value{
A data frame that contains enrichment results.
}
\description{
Perform Enrichment Analysis
}
\examples{
pin_path <- return_pin_path("KEGG")
enrichment(genes_by_pathway, c("PER1", "PER2", "CRY1", "CREB1"), pathways_list,
           "bonferroni", 0.05, pin_path)
}
\seealso{
\code{\link[stats]{p.adjust}} for adjustment of p values. See
  \code{\link{run_pathfindR}} for the wrapper function of the pathfindR
  workflow.
}
