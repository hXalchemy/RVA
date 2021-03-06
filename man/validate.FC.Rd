% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate.input.R
\name{validate.FC}
\alias{validate.FC}
\title{Validate Foldchange}
\usage{
validate.FC(FCmin, FCmax, FCstep)
}
\arguments{
\item{FCmin}{The minimum starting fold change cutoff to be checked, so the minimum fold change cutoff to be evaluated
will be FCmin + FCstep, FCmin default = 1.}

\item{FCmax}{The maximum fold change cutoff to be checked, default = 2.}

\item{FCstep}{The step from the minimum to maximum fold change cutoff, one step increase at a time, default = 0.01.}
}
\description{
This function ensures the fold change minimum, maximum, and step
are valid.
}
\details{
Specifically it checks that the FCmax is greater than the FCmin,
that at least 1 FCstep can fit within the FCmax and FCmin, that
FCmax and FCmin values are non-negative, and that FCstep is positive.
}
\references{
Xingpeng Li, Tatiana Gelaf Romer & Siddhartha Pachhai RVA - RNAseq Visualization Automation tool.
}
