% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/table.Performance.R
\name{table.Performance}
\alias{table.Performance}
\title{Generate general performance table for returns}
\usage{
table.Performance(
  R,
  metrics = NULL,
  metricsNames = NULL,
  verbose = FALSE,
  interactive = TRUE,
  arg.list = NULL,
  digits = 4,
  latex = FALSE,
  exportFun = NULL,
  exportXLS = FALSE,
  ExcelFileName = "PerformanceReport.xls",
  flag.pre.arg.list = FALSE,
  ...
)
}
\arguments{
\item{R}{an xts, vector, matrix, data frame, timeSeries or zoo object of
asset returns}

\item{metrics}{a character vector of input metrics, use table.Performance.pool() to see 
all the condicate metrics}

\item{metricsNames}{options argument to specify metricsNames, default is NULL, 
the same as the metrics}

\item{interactive}{logical, default is TRUE, optional argument to trigger data editor window}

\item{arg.list}{optional argument to specify input optional argument for each metric, uses 
only interactive=FALSE}

\item{digits}{optional argument to specify the significant digits in printed table, default is 4}

\item{latex}{logical, default is FALSE, optional argument to output latex code}

\item{exportFun}{logical, default is NULL, optional argument to export function, see details}

\item{exportXLS}{logical, default is FALSE, optional argument to export resulting table to excel file}

\item{ExcelFileName}{The name of the Excel file to be created, default is "PerformanceReport.XLSX"}
}
\description{
Main function to produce summary table. user can 
choose a set of metrics and corresponding optional arguments, 
modify metricsnames in output table, all together in data editor 
window from R console. For example, to include SharpeRatio, 
inside the data editor window, locate the row with SharpeRatio, 
and change "include" column from 0 to 1 to include the metric, and then 
change its optional arguments on the right that not with "#" sign. 
"#" sign simply means the argument (column index) is not defined 
for this metric (row index).
}
\details{
use \code{table.Performance.pool} to check available metrics. recoded SharpeRatio.
Both interactive and fixed input on metric set and optional arguments. Output latex code for resulting table. Export function that uses the same metrics and optional argument from interactive input.
}
\examples{
 \dontrun{
data(edhec)

# Example 1: start with NULL specification
res <- table.Performance(R=edhec,verbose=T, interactive=TRUE)

# Example 2: start with Var and ES
res.ex2 <- table.Performance(edhec,metrics=c("VaR", "ES"), 
metricsNames=c("Modified VaR","Modified Expected 
Shortfall"),interactive=FALSE, verbose=T)

# Example 3: Non-interactive
arg.list <- list(
		ES=list(method=c("modified","test"),
				p=0.9),
		VaR=list(method=c("gaussian"))
)
res.ex3 <- table.Performance(R=edhec,metrics=c("VaR", "ES"), interactive=FALSE,
 arg.list=arg.list, verbose=T, digits=4)

# Example 4: Latex code 
arg.list <- list(
		ES=list(method=c("modified"),
				p=0.9),
		VaR=list(method=c("gaussian"))
)
res.ex4 <- table.Performance(R=edhec,metrics=c("VaR", "ES"), interactive=FALSE, 
arg.list=arg.list, verbose=T, digits=4, latex=TRUE)

# Example 5: Export function 
res.ex5 <- table.Performance(R=edhec,metrics=c("VaR", "ES"), interactive=TRUE, verbose=T,
digits=4, latex=FALSE, exportFun="myfun1", flag.pre.arg.list=FALSE)
myfun1(R=edhec)  
# myfun1 uses res.ex5's metrics and optional arguments 
args(myfun1)

# Example 6: Export XLSX 
res.ex6 <- table.Performance(R=edhec,metrics=c("VaR", "ES"), interactive=FALSE, 
arg.list=arg.list, verbose=T, digits=4, latex=TRUE, exportXLS=TRUE,ExcelFileName="PerformanceReport.xls")
}

}
\seealso{
\code{\link{table.Performance.pool}},\code{\link{table.Performance.pool.cran}},\code{\link{table.Arbitrary}}
}
\author{
Kirk Li  \email{kirkli@stat.washington.edu}
}
\keyword{measure}
\keyword{metrics}
\keyword{performance}
\keyword{table}
