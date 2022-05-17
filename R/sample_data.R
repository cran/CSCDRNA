#' Example data
#'
#' A sample data containing synthetic bulk and single-cell datasets. The example in this sample
#' data illustrates how to build ExpressionSets and run \code{\link{CSCD}}.
#' @examples
#' # Load sample data.
#' data(sample_data)
#'
#' # Build ExpressionSet with bulk data.
#' bulk.eset <- Biobase::ExpressionSet(assayData = sample_data$bulk.matrix)
#'
#' # Build ExpressionSet with single-cell data.
#' sc.counts.matrix=sample_data$sc.counts.matrix
#' individual.labels=sample_data$individual.labels
#' cell.type.labels=sample_data$cell.type.labels
#' sample.ids <- colnames(sc.counts.matrix)
#' # individual.labels and cell.types should be in the same order as in sample.ids.

#' sc.pheno <- data.frame(check.names=FALSE, check.rows=FALSE,
#'                        stringsAsFactors=FALSE,row.names=sample.ids,
#'                        SubjectName=individual.labels,cellType=cell.type.labels)
#' sc.meta <- data.frame(labelDescription=c("SubjectName","cellType"),
#'                       row.names=c("SubjectName","cellType"))
#' sc.pdata <- new("AnnotatedDataFrame",data=sc.pheno, varMetadata=sc.meta)
#' sc.eset <- Biobase::ExpressionSet(assayData=sc.counts.matrix,phenoData=sc.pdata)
#'
#' # Run CSCD on the example data.
#' analysis <- CSCD(bulk.eset=bulk.eset,sc.eset= sc.eset,
#'                  min.p=0.3,markers=NULL,cell.types="cellType",
#'                  subj.names="SubjectName",verbose=TRUE)
#'
#' # Estimated cell-type proportions.
#' analysis$bulk.props
#'
#' # Cell-type proportions estimated directly by counting single-cell data.
#' analysis$sc.props
#'
#' # The covariance based transformed bulk expression used for decomposition.
#' analysis$transformed.bulk.
#'
#' # Genes used in the decomposition.
#' analysis$genes.used
#'
#' # Euclidean norm of the residuals for each individual's proportion estimates.
#' analysis$rnorm
#'
#' @format A list. Slot \strong{bulk.matrix} contains a sample bulk data matrix with
#' 100 rows (genes) and 5 columns (individuals). Slot \strong{sc.counts.matrix} contains
#' a sample single-cell data matrix with 100 rows (genes) and 20 columns (a combination of
#' cells assigned to 4 different cell types and 5 individuals). Slot \strong{individual.labels}
#' contains individual labels in the single-cell data. Slot \strong{cell.type.labels} contains
#' cell-type labels in the single-cell data. Slot \strong{sample.ids} contains sample ids in the
#' single-cell data. Note that individual.labels and cell.types should be in the same order as in sample.ids.
"sample_data"
