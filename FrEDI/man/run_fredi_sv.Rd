% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_fredi_sv.R
\name{run_fredi_sv}
\alias{run_fredi_sv}
\title{FrEDI Social Vulnerability (SV) Module: calculates climate change impacts on socially vulnerable populations throughout the 21st century for available sectors}
\usage{
run_fredi_sv(
  sector = NULL,
  driverInput = NULL,
  popInput = NULL,
  silent = TRUE,
  save = FALSE,
  outpath = getwd(),
  overwrite = FALSE,
  addDate = FALSE
)
}
\arguments{
\item{sector=NULL}{A character vector indicating for which sector(s) to run the FrEDI SV module.}

\item{driverInput=NULL}{A data frame of up to four custom scenarios for drivers (temperature or global mean sea level rise). \code{driverInput} requires a data frame with columns of \code{"year"} and \code{"scenario"}. The data frame must also include at least one of the following columns: \code{"temp_C"} or \code{"slr_cm"} (depending on whether the sector impacts are driven primarily by temperature or sea level rise, respectively...use \code{\link[=get_sv_sectorInfo]{get_sv_sectorInfo()}} to get information on driver types). If users include all four columns (\verb{c(} \code{"year"}, \code{"scenario"}, \code{"temp_C"}, \code{"slr_cm"} \verb{)}) then \code{\link[=run_fredi_sv]{run_fredi_sv()}} will determine which driver column (\code{"temp_C"} or \code{"slr_cm"}) to use based on the specified sector. Driver inputs (temperature and sea level rise) should start in the year 2000 or earlier. Temperature inputs must be temperature change in degrees Celsius for the CONUS region (if starting from global temperature change, use \code{\link[=convertTemps]{convertTemps()}} to convert global temperatures to CONUS temperatures before passing to \code{driverInput}). Sea level rise inputs must be change in sea level in centimeters. All scenarios must include at least two non-missing values. If any required columns are missing, \code{\link[=run_fredi_sv]{run_fredi_sv()}} will use the default temperature or sea level rise scenario from \code{\link[=run_fredi]{run_fredi()}}. If the data frame passed to \code{driverInput} has more than four unique scenarios, \code{\link[=run_fredi_sv]{run_fredi_sv()}} will only run the first four scenarios.}

\item{popInput=NULL}{A data frame containing a custom scenario for regional population, with columns \verb{c(} \code{"year"}, \code{"region"}, \code{"reg_pop"} \verb{)} (containing the year, region, and regional population, respectively). The data frame passed to \code{popInput} can be imported using \code{\link[=import_inputs]{import_inputs()}} (for more information, see \code{\link[=import_inputs]{import_inputs()}}). Note that, in contrast to the data frame passed to \code{driverInput}, the \code{popInput} data frame must be a single scenario (i.e., \code{\link[=run_fredi_sv]{run_fredi_sv()}} uses the same population scenario for all driver scenarios in \code{driverInput}). Region names in the \code{"region"} column must match those in \verb{c(} \code{"Midwest"}, \code{"Northeast"}, \code{"Northwest"}, \code{"Northern Plains"}, \code{"Southeast"}, \code{"Southwest"}, \code{"Southern Plains"} \verb{)} or \verb{c(} \code{"Midwest"}, \code{"Northeast"}, \code{"Northwest"}, \code{"Northern.Plains"}, \code{"Southeast"}, \code{"Southwest"}, \code{"Southern.Plains"} \verb{)}.}

\item{silent=TRUE}{A \code{TRUE/FALSE} value indicating the level of messaging desired by the user (default=\code{TRUE}).}

\item{save=FALSE}{A \code{TRUE/FALSE} value indicating whether to save the results to an Excel file (default=\code{FALSE}).}

\item{outpath=getwd()}{A character string indicating a file directory to save the Excel file (created if \code{save=TRUE}). By default, if \code{save=TRUE}, the Excel file will be saved to the working directory (with a file name determined by the sector).}

\item{overwrite=FALSE}{A \code{TRUE/FALSE} value indicating whether to overwrite an existing Excel file if \code{save=TRUE} (default=\code{FALSE}). By default, if \code{save=TRUE}, \code{overwrite=FALSE}. If \code{overwrite=FALSE}, \code{\link[=run_fredi_sv]{run_fredi_sv()}} will not write over an existing file. If \code{overwrite=FALSE}, and the file already exists, \code{\link[=run_fredi_sv]{run_fredi_sv()}} will provide the user with the option to write over the existing file: in this case, when \code{\link[=run_fredi_sv]{run_fredi_sv()}} is ready to save the file, it will message the user and prompt them if they would like to write over the existing file.}

\item{addDate=FALSE}{A \code{TRUE/FALSE} value indicating whether to add the date to the name of the output Excel file if \code{save=TRUE} (default=\code{FALSE}). By default, if \code{save=TRUE}, \code{\link[=run_fredi_sv]{run_fredi_sv()}} will not add the date to the Excel file name (\code{addDate=FALSE}). If \code{addDate=TRUE} (and \code{save=TRUE}), \code{\link[=run_fredi_sv]{run_fredi_sv()}} will append the system date to the beginning of the name of the outputs Excel file using the format \code{"\%Y\%m\%d"} (see \code{\link[base:format]{base::format()}} and \code{\link[base:Sys.time]{base::Sys.Date()}} for additional information).}
}
\value{
The output of \code{\link[=run_fredi_sv]{run_fredi_sv()}} is an R data frame object containing annual average impacts, by year (2010-2090), for each sector, variant, model (GCM or SLR scenario), and region.
}
\description{
This function allows users to project annual average climate change impacts throughout the 21st century (2010-2090) for socially vulnerable populations for available sectors (see \code{\link[=get_sv_sectorInfo]{get_sv_sectorInfo()}}). Users must pass a data frame of custom driver scenarios to \code{\link[=run_fredi_sv]{run_fredi_sv()}} using the \code{driverInput} argument (required) and have the option to pass a population scenario to \code{\link[=run_fredi_sv]{run_fredi_sv()}} via the \code{popInput} argument (optional). The output is an R data frame object containing annual average impacts at five-year increments between 2010 and 2090. Users have the option to write results to an Excel file by setting \code{save=TRUE}. Additional arguments provide more control over how the outputs are saved if \code{save=TRUE}.
}
\details{
This function allows users to project annual average climate change impacts throughout the 21st century (2010-2090) for socially vulnerable populations for available sectors (see \code{\link[=get_sv_sectorInfo]{get_sv_sectorInfo()}}). \code{\link[=run_fredi_sv]{run_fredi_sv()}} is the main function for the FrEDI Social Vulnerability (SV) Module in the \link{FrEDI} R package, described elsewhere (See \url{https://epa.gov/cira/FrEDI} for more information). Users have the option to pass a data frame of custom driver scenarios to \code{\link[=run_fredi_sv]{run_fredi_sv()}} using the \code{driverInput} argument (required) and have the option to pass a population scenario to \code{\link[=run_fredi_sv]{run_fredi_sv()}} via the \code{popInput} argument (optional). The output is an R data frame object containing annual average impacts at five-year increments between 2010 and 2090. Users have the option to write results to an Excel file by setting \code{save=TRUE}. Additional arguments provide more control over how the outputs are saved if \code{save=TRUE}.

\code{driverInput} requires a data frame of up to four custom scenarios for drivers (temperature or global mean sea level rise). \code{driverInput} requires a data frame with columns of \code{"year"} and \code{"scenario"}. The data frame must also include at least one of the following columns: \code{"temp_C"} or \code{"slr_cm"} (depending on whether the sector impacts are driven primarily by temperature or sea level rise, respectively). If users include all four columns (\verb{c(} \code{"year"}, \code{"scenario"}, \code{"temp_C"}, \code{"slr_cm"} \verb{)}) then \code{\link[=run_fredi_sv]{run_fredi_sv()}} will determine which driver column (\code{"temp_C"} or \code{"slr_cm"}) to use based on the specified sector. Driver inputs (temperature and sea level rise) should start in the year 2000 or earlier. Temperature inputs must be temperature change in degrees Celsius for the CONUS region (if starting from global temperature change, use \code{\link[=convertTemps]{convertTemps()}} to convert global temperatures to CONUS temperatures before passing to \code{driverInput}). Sea level rise inputs must be change in sea level in centimeters. All scenarios must include at least two non-missing values. If any required columns are missing, \code{\link[=run_fredi_sv]{run_fredi_sv()}} will use the default temperature or sea level rise scenario from \code{\link[=run_fredi]{run_fredi()}}. If the data frame passed to \code{driverInput} has more than four unique scenarios, \code{\link[=run_fredi_sv]{run_fredi_sv()}} will only run the first four scenarios.

\code{popInput} is an optional input that takes a data frame containing a custom scenario for regional population, with columns \verb{c(} \code{"year"}, \code{"region"}, \code{"reg_pop"} \verb{)} (containing the year, region, and regional population, respectively). If \code{popInput=NULL} (default), \code{\link[=run_fredi_sv]{run_fredi_sv()}} will use the default regional population scenario from the Integrated Climate and Land Use Scenarios version 2 (ICLUSv2) model (Bierwagen et al, 2010; EPA 2017) under the Median variant projection of United Nations (United Nations, 2015). The data frame passed to \code{popInput} can be imported using \code{\link[=import_inputs]{import_inputs()}} (for more information, see \code{\link[=import_inputs]{import_inputs()}}). Note that, in contrast to the data frame passed to \code{driverInput}, the \code{popInput} data frame must be a single scenario (i.e., \code{\link[=run_fredi_sv]{run_fredi_sv()}} uses the same population scenario for all driver scenarios in \code{driverInput}). Region names in the \code{"region"} column must match those in \verb{c(} \code{"Midwest"}, \code{"Northeast"}, \code{"Northwest"}, \code{"Northern Plains"}, \code{"Southeast"}, \code{"Southwest"}, \code{"Southern Plains"} \verb{)} or \verb{c(} \code{"Midwest"}, \code{"Northeast"}, \code{"Northwest"}, \code{"Northern.Plains"}, \code{"Southeast"}, \code{"Southwest"}, \code{"Southern.Plains"} \verb{)}.
}
\examples{
### Run SV Module with defaults without specifying sector
df_sv <- run_fredi_sv()

### Return a character vector with the names of all of the sectors in the FrEDI SV Module:
get_sv_sectorInfo()

### Return a data frame of all of the sectors in the FrEDI SV Module (sector names and additional information)
get_sv_sectorInfo(description=T)

### Run SV Module with defaults for "Coastal Properties" without saving
df_sv <- run_fredi_sv(sector="Coastal Properties")

### Run SV Module with defaults for "Extreme Temperature" without saving
df_sv <- run_fredi_sv(sector="Extreme Temperature")

### Run SV Module with defaults for "Extreme Temperature" with saving and add date to file name
df_sv <- run_fredi_sv(sector="Extreme Temperature", save=T, addDate=T)

### Load temperature scenarios
load(gcamScenarios)

### Load population scenario
load(popScenario)

### Run SV Module for "Extreme Temperature" with custom population and temperature scenarios. Save and overwrite previous results
df_sv <- run_fredi_sv(sector="Extreme Temperature", driverInput = gcamScenarios, popInput = popScenario, save=T, addDate=T, overwrite = T)

}
\references{
Bierwagen, B., D. M. Theobald, C. R. Pyke, A. Choate, P. Groth, J. V. Thomas, and P. Morefield. 2010. “National housing and impervious surface scenarios for integrated climate impact assessments.” Proc. Natl. Acad. Sci. 107 (49): 20887–20892. https://doi.org/10.1073/pnas.1002096107.

EPA. 2017. Multi-Model Framework for Quantitative Sectoral Impacts Analysis: A technical report for the Fourth National Climate Assessment. U.S. Environmental Protection Agency, EPA 430-R-17-001.

EPA. 2021. Technical Documentation on the Framework for Evaluating Damages and Impacts (FrEDI). U.S. Environmental Protection Agency, EPA 430-R-21-004. Available at \url{https://epa.gov/cira/FrEDI/}.

EPA. 2021. Climate Change and Social Vulnerability in the United States: A Focus on Six Impacts. U.S. Environmental Protection Agency, EPA 430-R-21-003. Available at \url{https://www.epa.gov/cira/social-vulnerability-report/}.

United Nations. 2015. World population prospects: The 2015 revision. New York: United Nations, Department of Economic and Social Affairs, Population Division.
}
