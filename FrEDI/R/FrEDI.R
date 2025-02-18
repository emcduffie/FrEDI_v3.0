### This file documents the R temperature binning package
#' README
#' FrEDI: The Framework for Evaluating Damages and Impacts
#'
#' [FrEDI] is an R package being developed by the U.S. Environmental Protection Agency (EPA). The functions and data provided by this package can be used to estimate climate change impacts for the contiguous United States (CONUS) using the Framework for Evaluating Damages and Impacts (FrEDI), developed as part of EPA's [Climate Change Impacts and Risk Analysis](https://epa.gov/cira/) (CIRA) project. [FrEDI] contains R code that implement FrEDI and allow users to project impacts from climate change and sea level rise for a selected set of sectors.
#'
#' For more information on the Framework and the CIRA project, visit <https://epa.gov/cira/>, especially <https://epa.gov/cira/FrEDI/>.
#'
#' @section Overview of Functions:
#' The function [FrEDI::run_fredi()] provided in this package is the primary function implementing FrEDI The main inputs to [FrEDI::run_fredi()] are climate scenarios (temperature in degrees Celsius, global mean sea level rise in centimeters) and socioeconomic scenarios (gross domestic product, regional population). [FrEDI::run_fredi()] projects climate impacts for these scenarios using the temperature binning framework. Users can also specify the levels at which to aggregate the climate impacts.
#'
#' [FrEDI] also contains functions to assist in the pre-processing of input scenarios and the post-processing of outputs. For instance, the pre-processing function [FrEDI::import_inputs()] helps users to import scenarios from user-specified comma-separated value (CSV) files, while the post-processing function [FrEDI::get_plots()] generates a couple of different types of images (creates heatmaps and ribbon plots of climate impacts over time) from the outputs of [FrEDI::run_fredi()].
#'
#' Additional helper functions provided by [FrEDI] include [FrEDI::convertTemps()], [FrEDI::temps2slr()], [FrEDI::get_sectorInfo()], and [FrEDI::aggregate_impacts()].
#'
#' [FrEDI::convertTemps()] helps users to convert between global mean temperature and temperatures for the contiguous United States (CONUS) (both in degrees Celsius). [FrEDI::temps2slr()] helps users to estimate global mean sea level rise (GMSL, in centimeters) from global mean temperature in degrees Celsius.
#'
#' [FrEDI::get_sectorInfo()] allows users to access a list of sectors within FrEDI and related sector information.
#'
#' The post-processing helper function [FrEDI::aggregate_impacts()] helps users to aggregate and/or summarize the outputs of temperature binning (calculates national totals, model averages, impact totals, and interpolations between multiple impact years (for applicable sectors). Users have the option to run [FrEDI::aggregate_impacts()] on the outputs of [FrEDI::run_fredi()]. However, users can alternatively specify aggregation levels as arguments to the main function, [FrEDI::run_fredi()], which will run [FrEDI::aggregate_impacts()] for specified levels before returning outputs (by default, [FrEDI::run_fredi()] returns results aggregated to all aggregation levels).
#'
#' Version 2.3.0 includes a module, the FrEDI Social Vulnerability (SV) module for estimating impacts on socially vulnerable populations for select sectors. [FrEDI::get_sv_sectorInfo()] allows users to access a list of sectors within the FrEDI SV module and related sector information. The function [FrEDI::run_fredi_sv()] is the main function for the FrEDI SV module. [FrEDI::run_fredi_sv()] is designed to calculate impacts for a single sector at a time for a custom population scenario or one or more custom temperature or sea level rise scenarios. When running [FrEDI::run_fredi_sv()], users have the option to save results to an Excel file that provides basic data visualization for the module outputs. For more information on the data underlying the FrEDI SV module, visit <https://www.epa.gov/cira/social-vulnerability-report/>.
#'
#'  @section Overview of Package Contents:
#' [FrEDI] consists of files in the following directories:
#' * __R__. Contains function definitions (files ending in `".R"`) and configuration files (ending in `".rda"`).
#' * __data__. Contains R Data files ending in `".rdb"`, `".rds"`, and `".rdx"`, containing data included with the package.
#' * __help__ and __html__. Contain documentation for functions available to the user, including function descriptions, lists of arguments and outputs, and examples. See `"html/00Index.html"` or the individual R help functions for more information about individual functions.
#' * __Meta__. Contains RDS files (ending in `".rds"`) with information about the package contents.
#' * __extdata__. __extdata/scenarios__ Contains three CSV files for users to test the function for importing data. (`"pop_scenario.csv"`, `"slr_from_GCAM.csv"`, and `"GCAM_scenario.csv"`) respectively contain examples of a population scenario, sea level rise scenario, and temperature scenario. For more information, refer to documentation for the function `"import_inputs()"`. __extdata/sv__ contains files used by the FrEDI SV module.
#'
#' The FrEDI R package contains a dataset with default results `defaultResults`, which contains annual impacts produced by [FrEDI::run_fredi()] for the default scenarios (i.e., default temperature, GDP and regional population trajectories), and can be loaded into the R workspace (`data(defaultResults))`. rEDI R package also provides a set of driver scenarios (`gcamScenarios`) and a population scenario (`popScenario`) for use with the FrEDI SV Module (which can be loaded into the workspace using the `data()` function).
#'
#' Typical use will involve `library(FrEDI)` or `require(FrEDI)`.
#'
#'
#' @section Status:
#' All code in this repository is being provided in a "draft" state and has not been reviewed or cleared by U.S. EPA. This status will be updated as models are reviewed.
#'
#' @section Dependencies:
#' [FrEDI] requires R (>= 3.5.0).
#'
# Installing [FrEDI] requires [devtools] (Tools to Make Developing R Packages Easier). More information on [devtools] can be found [here.](https://cran.r-project.org/web/packages/devtools/index.html) [devtools] can be installed using `install.packages("devtools")`, or see [link](https://www.r-project.org/nosvn/pandoc/devtools.html) for more information.
#'
#' [FrEDI] depends on:
#' * [tidyr] (Tidy Messy Data). The official documentation for [tidyr] can be found [here](https://cran.r-project.org/web/packages/tidyr/index.html). [tidyr] can be installed using `install.packages("tidyr")`, or see [link](https://tidyr.tidyverse.org/) for more information.
#' * [dplyr] (A Grammar of Data Manipulation). The official documentation for [dplyr] can be found [here](https://cran.r-project.org/web/packages/dplyr/index.html). [dplyr] can be installed using `install.packages("dplyr")`, or see [link](https://dplyr.tidyverse.org/) for more information.
#' * [ggplot2] (Create Elegant Data Visualisations Using the Grammar of Graphics). The official documentation for [ggplot2] can be found [here](https://cran.r-project.org/web/packages/ggplot2/index.html). [ggplot2] can be installed using `install.packages("ggplot2")`, or see [link](https://ggplot2.tidyverse.org/) for more information.
#' [openxlsx] (Read, Write and Edit `xlsx` Files). The official documentation for [openxlsx] can be found [here](https://cran.r-project.org/web/packages/openxlsx/openxlsx.pdf). [openxlsx] can be installed using `install.packages("openxlsx")`.
#'
#' @section License:
#' This repository is released under the MIT License.
#'
#' @section EPA Disclaimer:
#' The United States Environmental Protection Agency (EPA) GitHub project code is provided on an "as is" basis and the user assumes responsibility for its use. EPA has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by EPA. The EPA seal and logo shall not be used in any manner to imply endorsement of any commercial product or activity by EPA or the United States Government.
#'
#' By submitting a pull request to the GitHub and/or by installing this package, you make an agreement with EPA that you will not submit a claim of compensation for services rendered to EPA or any other federal agency. Further, you agree not to charge the time you spend developing software code related to this project to any federal grant or cooperative agreement.
#'
#'
#' @docType package
#' @name FrEDI
#' @md
NULL
#> NULL
