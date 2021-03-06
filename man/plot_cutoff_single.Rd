% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_cutoff.R
\name{plot_cutoff_single}
\alias{plot_cutoff_single}
\title{Create plotly object for number of DE genes at different cutoff combinations}
\usage{
plot_cutoff_single(datin, FCflag, FDRflag, FCs, pvalues)
}
\arguments{
\item{datin}{Summary statistics table from limma or DEseq2, where each row is a gene.}

\item{FCflag}{The column name of the log2FC in the summary statistics table.}

\item{FDRflag}{The column name of the False Discovery Rate (FDR) in the summary statistics table.}

\item{FCs}{A set of fold change cutoff to be checked.}

\item{pvalues}{A set of p-values for FDR cutoff to be checked.}
}
\description{
This function processes summary statistics table generated by differential expression analysis
like \code{limma} or \code{DESeq2} and produces a table which contains gene counts
for each of the pvalue and FC combination
}
