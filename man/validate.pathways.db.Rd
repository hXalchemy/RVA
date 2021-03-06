% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate.input.R
\name{validate.pathways.db}
\alias{validate.pathways.db}
\title{Validate Pathways DB}
\usage{
validate.pathways.db(pathway.db, customized.pathways)
}
\arguments{
\item{pathway.db}{The databse to be used for encrichment analysis. Can be one of the following, "rWikiPathways", "KEGG", "REACTOME", "Hallmark","rWikiPathways_aug_2020"}

\item{customized.pathways}{the customized pathways in the format of two column dataframe (column name as "gs_name" and "entrez_gene") to be used in analysis}
}
\description{
To ensure selected db name is correct.
}
\references{
Xingpeng Li, Tatiana Gelaf Romer & Siddhartha Pachhai RVA - RNAseq Visualization Automation tool.
}
