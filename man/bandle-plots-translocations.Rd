% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bandle-plots.R
\name{plotTranslocations}
\alias{plotTranslocations}
\title{Generates a chord diagram or alluvial plot for visualising changes in
localisation between two conditions/datasets}
\usage{
plotTranslocations(
  params,
  type = "alluvial",
  all = FALSE,
  fcol,
  col,
  labels = TRUE,
  labels.par = "adj",
  cex = 1,
  spacer = 4,
  ...
)
}
\arguments{
\item{params}{An instance of class \code{bandleParams} or an instance of
class \code{MSnSetList} of length 2.}

\item{type}{A \code{character} specifying the type of visualisation to plot.
One of \code{"alluvial"} (default) or \code{"chord"}.}

\item{all}{A logical specifying whether to count all proteins or only show
those that have changed in location between conditions. Default is
\code{FALSE}.}

\item{fcol}{If \code{params} is a \code{list} of \code{MSnSets}. Then
\code{fcol} must be defined. This is a \code{character} vector of length 2
to set different labels for each dataset. If only one label is specified,
and the \code{character} is of length 1 then this single label will be
used to identify the annotation column in both datasets.}

\item{col}{A list of colours to define the classes in the data. If not
defined then the default \code{pRoloc} colours in \code{getStockCol()} are
used.}

\item{labels}{Logical indicating whether to display class/organelle labels
for the chord segments or alluvial stratum. Default is \code{TRUE}.}

\item{labels.par}{If \code{type} is \code{"alluvial"}. Label style can be
specified as one of \code{"adj"}, \code{"repel"}. Default is \code{"adj"}.}

\item{cex}{Text size. Default is 1.}

\item{spacer}{A \code{numeric}. Default is 4. Controls the white space around the
circos plotting region.}

\item{...}{Additional arguments passed to the \code{chordDiagram} function.}
}
\value{
Returns a directional circos/chord diagram showing the translocation
of proteins between conditions. If \code{type = "alluvial"} ouput is a
\code{ggplot} object.
}
\description{
Produces a chord diagram (circos plot) or an alluvial plot (also known as a
Sankey diagram) to show changes in location between two conditions or
datasets.
}
\examples{
## Generate some example data
library("pRolocdata")
data("tan2009r1")
set.seed(1)
tansim <- sim_dynamic(object = tan2009r1, 
                      numRep = 4L,
                      numDyn = 100L)
data <- tansim$lopitrep
control <- data[1:2]
treatment <- data[3:4]

## fit GP params
gpParams <- lapply(tansim$lopitrep, function(x) 
fitGPmaternPC(x, hyppar = matrix(c(0.5, 1, 100), nrow = 1)))

## run bandle
res <- bandle(objectCond1 = control,
              objectCond2 = treatment, 
              gpParams = gpParams,
              fcol = "markers",  
              numIter = 5L, 
              burnin = 1L, 
              thin = 2L,
              numChains = 1, 
              BPPARAM = SerialParam(RNGseed = 1),
              seed = 1)
               
## Process the results
bandleres <- bandleProcess(res)

## plot the results
plotTranslocations(bandleres)
plotTranslocations(bandleres, type = "chord")
}
