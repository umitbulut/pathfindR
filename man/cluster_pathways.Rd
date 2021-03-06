% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cluster_pws.R
\name{cluster_pathways}
\alias{cluster_pathways}
\title{Calculate Pairwise Distances Between Given Pathways}
\usage{
cluster_pathways(pathway_ids, agg_method = "average", plot_heatmap = FALSE)
}
\arguments{
\item{pathway_ids}{Vector of IDs of pathways selected to be clustered.}

\item{agg_method}{the agglomeration method to be used if plotting heatmap
(see next argument, default: average).}

\item{plot_heatmap}{boolean value indicating whether or not to plot the heat
map of pathway clustering (default: FALSE).}
}
\value{
Pairwise distance matrix. Optionally plots a heatmap of pathway
  clustering.
}
\description{
Calculate Pairwise Distances Between Given Pathways
}
\details{
See "Chen, Y. A. et al. Integrated pathway clusters with coherent
  biological themes for target prioritisation. PLoS One 9, e99030,
  doi:10.1371/journal.pone.0099030 (2014)." for details on the method of
  pathway clustering.
}
\examples{
cluster_pathways(RA_output$ID)
}
\seealso{
\code{\link[stats]{hclust}} for hierarchical clustering,
  \code{\link[stats]{heatmap}} for drawing a heatmap.
}
