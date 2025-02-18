% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils_sv.R
\name{get_sv_sectorInfo}
\alias{get_sv_sectorInfo}
\title{This function provides information about the sectors in the FrEDI SV Module.}
\usage{
get_sv_sectorInfo(description = F, gcmOnly = F, slrOnly = F)
}
\arguments{
\item{description=FALSE.}{Logical value indicating whether to include information about each sector. Returns a data frame if \code{description=TRUE} and returns a character vector of sector names if \code{description=FALSE} (default).}

\item{gcmOnly=FALSE.}{Logical value indicating whether to return only sectors with climate impacts modeled using global climate model (GCM) results.}

\item{slrOnly=FALSE.}{Logical value indicating whether to return only sectors with climate impacts modeled using sea level rise (SLR) scenarios.}
}
\value{
\itemize{
\item If \code{description=FALSE} (default), outputs a character vector containing the names of sectors available for the FrEDI SV Module.
\item If \code{description=TRUE}, `, outputs a data frame containing the names of sectors available for the FrEDI SV Module in one column, with information about the sector model type, model type ("GCM" or "SLR") and associated driver unit ("degrees Celsius" or "cm", respectively ),  impact units (e.g., mortality, etc.), and available variants in the remaining columns.
}
}
\description{
This helper function returns a character vector with the names of sectors in the FrEDI SV module (default) \emph{or} a data frame of those sectors with related information (\code{description=TRUE}). If \code{description=TRUE}, \link{get_sv_sectorInfo} will return a data frame with sector names, model type ("GCM" or "SLR") and associated driver unit ("degrees Celsius" or "cm", respectively ), impact units (e.g., mortality, etc.), available variants. Users can use \link{get_sv_sectorInfo} to determine which sectors can be passed to the \code{\link[=run_sv_fredi]{run_sv_fredi()}} \code{sector} argument and/or to determine whether a particular sector is driven primarily by temperature (\code{modelType="GCM"}) or sea level rise (\code{modelType="SLR"}).
}
\details{
This helper function returns a character vector with the names of sectors in FrEDI (default) \emph{or} a data frame of those sectors with related information (\code{description=TRUE}). If \code{description=TRUE}, \link{get_sv_sectorInfo} will return a data frame with sector names, model type ("GCM" or "SLR") and associated driver unit ("degrees Celsius" or "cm", respectively ), impact units (e.g., mortality, etc.), and available variants. Users can use \link{get_sv_sectorInfo} to determine which sectors can be passed to the \code{\link[=run_sv_fredi]{run_sv_fredi()}} \code{sector} argument and/or to determine whether a particular sector is driven primarily by temperature (\code{modelType="GCM"}) or sea level rise (\code{modelType="SLR"}).

If \code{description=FALSE} (default), this helper function returns a character vector of names of sectors that can be passed to the \code{\link[=run_sv_fredi]{run_sv_fredi()}} \code{sector} argument. If \code{description=TRUE}, \code{get_sv_sectorInfo()} returns a data frame of sectors with related information, such as whether a particular sector is driven primarily by temperature (\code{modelType="GCM"}) or sea level rise (\code{modelType="SLR"}).

Users can specify whether to return only GCM sectors \emph{or} SLR sectors by setting \code{gcmOnly=TRUE} or \code{slrOnly=TRUE}, respectively. \code{\link[=get_sv_sectorInfo]{get_sv_sectorInfo()}} will return the sectors in the form specified by \code{description} (see above).
}
\examples{

### Return a character vector with the names of all of the sectors in the FrEDI SV Module:
get_sv_sectorInfo()

### Return a data frame of all of the sectors in the FrEDI SV Module (sector names and additional information)
get_sv_sectorInfo(description=T)

### Return a character vector with only the names of the temperature-driven sectors:
get_sv_sectorInfo(gcmOnly=T)

### Return a character vector with only the names of the temperature-driven sectors:
get_sv_sectorInfo(slrOnly=T)

}
\references{
Environmental Protection Agency (EPA). 2021. Technical Documentation on The Framework for Evaluating Damages and Impacts (FrEDI). Technical Report EPA 430-R-21-004, EPA, Washington, DC. Available at \url{https://epa.gov/cira/FrEDI/}.
}
