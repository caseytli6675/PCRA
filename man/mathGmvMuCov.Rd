% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mathGmv.R
\name{mathGmvMuCov}
\alias{mathGmvMuCov}
\title{Global Minimum Variance (GMV) Portfolio}
\usage{
mathGmvMuCov(muRet, volRet, corrRet, digits = 3)
}
\arguments{
\item{digits}{integer indicating the number of decimal places}

\item{returns}{matrix of asset returns}
}
\description{
Compute the weights, mean return and volatility of a GMV portfolio.
}
\examples{
data(midcap.ts)
returns = midcap.ts[, 1:10]
mathGmv(returns)
}
