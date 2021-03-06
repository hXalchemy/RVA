#' @title Plot qqplot
#' @description This function generates a QQ-plot object with confidence interval from summary statistics table generated by differential expression analysis
#' like \code{limma} or \code{DESeq2}.
#'
#'
#' @param data Summary statistics table or a list that contains multiple summary statistics tables from limma or DEseq2, where each row is a gene.
#' @param comp.names A character vector that contains the comparison names which correspond to the same order as \code{data}. No default.
#' @param p.value.flag The column name of \code{P-VALUE} (NOT FDR, NO multiplicity adjusted p-value) in the summary statistics table. Default = "P.Value".
#' @param ci Confidence interval. Default = 0.95
#' @param plot.save.to The file name and the address where to save the qq-plot "~/address_to_folder/qqplot.png". Default = NULL.
#'
#'
#' @return The function return a ggplot object of qqplot
#'
#'
#' @importFrom ggplot2 ggsave ggplot geom_point geom_abline geom_line geom_ribbon xlab ylab facet_wrap
#' @importFrom rlang .data
#'
#' @export plot_qq
#'
#' @references Xingpeng Li & Tatiana Gelaf Romer & Olya Besedina, RVA - RNAseq Visualization Automation tool.
#'
#' @details The function produces the qqplot to evaluate the result from differential expression analysis. The output is a ggplot object.
#'
#'
#' @examples
#' plot_qq(data = Sample_summary_statistics_table)
#' plot_qq(data = list(Sample_summary_statistics_table, Sample_summary_statistics_table1),
#'         comp.names = c("A","B"))
#'


plot_qq <- function(data = data,
                    comp.names = NULL,
                    p.value.flag = "P.Value",
                    ci = 0.95,
                    plot.save.to = NULL
){

        suppressWarnings({
        suppressMessages({
        validate.pvalflag(data, p.value.flag)

        #validate dataframe or list for data here
        get.value <- function(data){
                n  <- nrow(data)
                ps <- data[,p.value.flag]
                df <- data.frame(
                        observed = -log10(sort(ps)),
                        expected = -log10(stats::ppoints(n)),
                        clower   = -log10(stats::qbeta(p = (1 - ci) / 2, shape1 = 1:n, shape2 = n:1)),
                        cupper   = -log10(stats::qbeta(p = (1 + ci) / 2, shape1 = 1:n, shape2 = n:1))
                )
                return(df)
        }

        if(inherits(data, "list")){
                #check if same length of the data.list names are provided
                if(!is.null(comp.names) & length(data) != length(comp.names)){
                        message("Please make sure the provided summary statistics list 'dat.list' has the same length as 'comp.names'.")
                        return(NULL)
                }

                df <- data %>%
                        set_names(comp.names) %>%
                        map(get.value) %>%
                        bind_rows(, .id = "Comparisons.ID") %>%
                        mutate(Comparisons.ID = factor(.data$Comparisons.ID,levels = comp.names))
        }else{
                df <- get.value(data)
        }

        log10P.exp <- expression(paste("Expected -log"[10], plain(P)))
        log10P.obs <- expression(paste("Observed -log"[10], plain(P)))

        p <-  ggplot(df) +
                geom_point(aes(x = .data$expected, y = .data$observed),shape = 1, size = 1) +
                geom_abline(intercept = 0, slope = 1, linetype =2, color="black", alpha = 0.5) +
                geom_line(aes(.data$expected, .data$cupper), size = 0.5, linetype = 1, color="#00AFBB") +
                geom_line(aes(.data$expected, .data$clower), size = 0.5, linetype = 1, color="#00AFBB") +
                geom_ribbon(mapping = aes(x = .data$expected, ymin = .data$clower, ymax = .data$cupper),alpha = 0.2) +
                xlab(log10P.exp) +
                ylab(log10P.obs)

        if(inherits(data, "list")){
                p <- p + facet_wrap(facets = "Comparisons.ID")
        }

        if(!is.null(plot.save.to)){ #save file if needed
                ggsave(filename = plot.save.to,
                       plot = p,
                       width = 6,
                       height = 6,
                       dpi = 300,
                       units = "in",
                       device='png')
        }

        data.is.list <- inherits(data, "list")

        if(data.is.list) {
                validate.comp.names(comp.names, data)
        }

        return(p)
        })
        })
}




