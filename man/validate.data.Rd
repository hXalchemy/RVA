% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate.input.R
\name{validate.data}
\alias{validate.data}
\title{Validate Data Input}
\usage{
validate.data(data)
}
\arguments{
\item{data}{The wide-format dataframe with input data.}
}
\description{
Ensures that the data input has the required formatting.
}
\details{
Specifically, checks if \code{data} has rownaems and that all other
columns can be coerced to numeric.
}
\references{
Xingpeng Li, Tatiana Gelaf Romer & Siddhartha Pachhai RVA - RNAseq Visualization Automation tool.
}
