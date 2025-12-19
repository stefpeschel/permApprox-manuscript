
#' Test for differential proportions of zero gene expression
#'
#' Test for differential proportions of zero expression between two conditions
#' for a specified set of genes; adapted from the R/Bioconductor package \code{scDD} by Korthauer et al. (2016)
#'
#' @details Test for differential proportions of zero gene expression between two
#' conditions using a logistic regression model accounting for the cellular detection rate. Adapted from the R/Bioconductor package \code{scDD} by Korthauer et al. (2016).
#'
#' In the test, the null hypothesis that there are no differential proportions of zero gene expression (DPZ) is tested against the alternative that there are DPZ.
#'
#' @param x matrix of single-cell RNA-sequencing expression data with genes in
#'   rows and cells (samples) in columns [alternatively, a \code{SingleCellExperiment} object for condition \eqn{A}, where the matrix of the single-cell RNA sequencing expression data has to be supplied via the \code{counts} argument in \code{SingleCellExperiment}] 
#' @param y vector of condition labels [alternatively, a \code{SingleCellExperiment} object for condition \eqn{B}, where the matrix of the single-cell RNA sequencing expression data has to be supplied via the \code{counts} argument in \code{SingleCellExperiment}] 
#' @param these vector of row numbers (i.e. gene numbers) employed to test for
#'   differential proportions of zero expression; default is seq_len(nrow(dat))
#'
#' @return A vector of (unadjusted) p-values
#'
#' @references Korthauer, K. D.,  Chu, L.-F.,  Newton, M. A.,  Li, Y.,  Thomson, J.,  Stewart, R., and Kendziorski, C. (2016). A statistical approach for identifying differential distributions in single-cell RNA-seq experiments. Genome Biology, 17:222.
#'
#' @examples
#' #simulate scRNA-seq data
#' set.seed(24)
#' nb.sim1<-rnbinom(n=(750*250),1,0.7)
#' dat1<-matrix(data=nb.sim1,nrow=750,ncol=250)
#' nb.sim2a<-rnbinom(n=(250*100),1,0.7)
#' dat2a<-matrix(data=nb.sim2a,nrow=250,ncol=100)
#' nb.sim2b<-rnbinom(n=(250*150),5,0.2)
#' dat2b<-matrix(data=nb.sim2b,nrow=250,ncol=150)
#' dat2<-cbind(dat2a,dat2b)
#' dat<-rbind(dat1,dat2)*0.25
#' #randomly shuffle the rows of the matrix to create the input matrix
#' set.seed(32)
#' dat<-dat[sample(nrow(dat)),]
#' condition<-c(rep("A",100),rep("B",150))
#'
#' #call testZeroes with a matrix and a vector including conditions
#' #test for differential proportions of zero expression over all rows (genes)
#' testZeroes(dat, condition)
#' #test for differential proportions of zero expression only for the second row (gene)
#' testZeroes(dat, condition, these=2)
#'
#' #alternatively, call testZeroes with two SingleCellExperiment objects
#' #note that the possibly pre-processed and normalized expression matrices need to be
#' #included using the "counts" argument
#' sce.A <- SingleCellExperiment::SingleCellExperiment(
#'   assays=list(counts=dat[,1:100]))
#' sce.B <- SingleCellExperiment::SingleCellExperiment(
#'   assays=list(counts=dat[,101:250]))
#' #test for differential proportions of zero expression over all rows (genes)
#' testZeroes(sce.A,sce.B,these=seq_len(nrow(sce.A)))
#' #test for differential proportions of zero expression only for the second row (gene)
#' testZeroes(sce.A,sce.B,these=2)
#'
#' @name testZeroes
#' @export
#' @docType methods
#' @rdname testZeroes-method
setGeneric("testZeroes",
    function(x, y, these=seq_len(nrow(x))) standardGeneric("testZeroes"))


#'@rdname testZeroes-method
#'@aliases testZeroes,matrix,vector,ANY-method
setMethod("testZeroes",
    c(x="matrix", y="vector"),
    function(x, y, these=seq_len(nrow(x))) {
        detection <- colSums(x > 0) / nrow(x)
        onegene <- function(j, dat, detection, cond, these) {
            trow = dat[these[j], ]
            if (sum(trow == 0) > 0) {
                M1 <- suppressWarnings(
                            bayesglm(   trow > 0 ~ detection + factor(cond),
                                        family=binomial(link="logit"),
                                        Warning=FALSE))
                return(summary(M1)$coefficients[3, 4])
            } else {
                return(NA)
            }
        }
        
        pval <- unlist(bplapply(seq_along(these), onegene, dat=x,
                                detection=detection, cond=y, these=these))
        return(pval)
    })


#'@rdname testZeroes-method
#'@aliases testZeroes,SingleCellExperiment,SingleCellExperiment,vector-method
setMethod("testZeroes",
    c(x="SingleCellExperiment", y="SingleCellExperiment", these="vector"),
    function(x, y, these=seq_len(nrow(x))) {
        dat <- cbind(counts(x), counts(y))
        condition <- c(rep(1, dim(counts(x))[2]), rep(2, dim(counts(y))[2]))
        return(testZeroes(dat, condition, these))
    })


#'Check for differential distributions in single-cell RNA sequencing data via a semi-paramteric test using the 2-Wasserstein distance
#'           
#'@description Two-sample test for single-cell RNA-sequencing data to check for differences
#'between two distributions using the 2-Wasserstein distance:
#'Semi-parametric implementation using a permutation test with a generalized 
#'Pareto distribution (GPD) approximation to estimate small p-values accurately
#'
#'@details Details concerning the testing procedure for
#' single-cell RNA-sequencing data can be found in Schefzik et al. (2021) and in the description of the details of the function \code{wassersteinEdit.sc}.
#'
#'@param dat matrix of single-cell RNA-sequencing expression data, with rowas corresponding to genes and columns corresponding to cells (samples)
#'@param condition vector of condition labels
#'@param permnum number of permutations used in the permutation testing
#' procedure
#'@param inclZero logical; if TRUE, a one-stage method is performed, i.e. the semi-parametric
#' test based on the 2-Wasserstein distance is applied to all (zero and non-zero) expression values;
#' if FALSE, a two-stage method is performed, i.e. the semi-parametric test based on the 2-Wasserstein distance is applied to
#' non-zero expression values only, and a separate test for
#' differential proportions of zero expression using logistic regression is conducted; default is TRUE
#'@param seed Number to be used as a L'Ecuyer-CMRG seed, which itself
#' seeds the generation of an nextRNGStream() for each gene. Internally, when
#' this argument is given, a seed is specified by calling
#' `RNGkind("L'Ecuyer-CMRG")` followed by `set.seed(seed)`.
#' The `RNGkind` and `.Random.seed` will be reset on termination of this
#' function. Default is NULL, and no seed is set.
#'@return Matrix, where each row contains the testing results of the respective gene from \code{dat}.
#'  For the corresponding values of each row (gene), see the description of the function
#' \code{wassersteinEdit.sc}, where the argument \code{inclZero=TRUE} in \code{.testWassEdit} has to be
#' identified with the argument \code{method="OS"}, and the argument \code{inclZero=FALSE} with the argument \code{method="TS"}.
#' 
#'@references Schefzik, R., Flesch, J., and Goncalves, A. (2021). Fast identification of differential distributions in single-cell RNA-sequencing data with waddR.
#'

.testWassEdit <- function(dat, condition, permnum, inclZero = TRUE, seed = NULL,
                          workers = 1, show_progress = TRUE) {
    ngenes <- nrow(dat)
    seeds <- NULL
    
    if (!is.null(seed)) {
        if (exists(".Random.seed")) {
            oseed <- .Random.seed
        } else {
            oseed <- NULL
        }
        
        okind <- RNGkind("L'Ecuyer-CMRG")[1]
        set.seed(seed)
        seed <- .Random.seed
        
        seeds <- replicate(ngenes, { seed <<- nextRNGStream(seed) }, 
                           simplify = FALSE)
        
        on.exit({
            RNGkind(okind)
            if (is.null(oseed)) {
                rm(.Random.seed)
            } else {
                .Random.seed <<- oseed
            }
        })
    }
    
    # Parallel worker function
    onegene <- function(x, seed = NULL) {
        if(x %% 100 == 0) print(paste0("Iteration: ", x))
        x1 <- dat[x, condition == unique(condition)[1]]
        x2 <- dat[x, condition == unique(condition)[2]]
        
        if (!inclZero) {
            x1 <- x1[x1 > 0]
            x2 <- x2[x2 > 0]
        }
        
        if (!is.null(seed)) {
            .Random.seed <<- seed
        }
        
        suppressWarnings(.wassersteinTestSp(x1, x2, permnum))
    }
    
    # Run worker
    if (!is.null(seeds)) {
        wass.res.list <- bpmapply(onegene, seq(ngenes), seeds, SIMPLIFY = FALSE)
    } else {
        wass.res.list <- bpmapply(onegene, seq(ngenes), SIMPLIFY = FALSE)
    }
    
    # Convert list of named lists to data.frame/matrix
    wass.res.mat <- do.call(rbind, lapply(wass.res.list, function(x) {
        as.numeric(x[names(x) != "wass.values"])  # exclude permutation values
    }))
    colnames(wass.res.mat) <- names(wass.res.list[[1]])[names(wass.res.list[[1]]) != "wass.values"]
    
    wass.pval.adj <- p.adjust(wass.res.mat[, "pval"], method = "BH")
    
    if (!inclZero) {
        pval.zero <- testZeroes(dat, condition)
        pval.adj.zero <- p.adjust(pval.zero, method = "BH")
        pval.combined <- .combinePVal(wass.res.mat[, "pval"], pval.zero)
        pval.adj.combined <- p.adjust(pval.combined, method = "BH")
        
        RES <- cbind(wass.res.mat, pval.zero, pval.combined, wass.pval.adj,
                     pval.adj.zero, pval.adj.combined)
        rownames(RES) <- rownames(dat)
        colnames(RES) <- c(colnames(wass.res.mat), "p.zero", "p.combined",
                           "p.adj.nonzero", "p.adj.zero", "p.adj.combined")
    } else {
        RES <- cbind(wass.res.mat, pval.adj = wass.pval.adj)
        rownames(RES) <- rownames(dat)
    }
    
    # Extract the 'wass.values' entry from each gene's result
    wass.vals.list <- lapply(wass.res.list, function(x) x$wass.values)
    
    # Convert list to matrix: genes = rows, permutations = columns
    wass.vals.mat <- do.call(rbind, wass.vals.list)
    rownames(wass.vals.mat) <- rownames(dat)
    
    # Optionally, return full list with permutation statistics if needed
    attr(RES, "wass.values") <- wass.vals.mat
    
    return(RES)
}

#'Two-sample semi-parametric test for single-cell RNA-sequencing data to check for differences between two distributions using the 2-Wasserstein distance
#'
#' Two-sample test for single-cell RNA-sequencing data to check for differences
#' between two distributions using the 2-Wasserstein distance:
#' Semi-parametric implementation using a permutation test with a generalized
#' Pareto distribution (GPD) approximation to estimate small p-values
#' accurately
#'
#' @details Details concerning the testing procedure for
#' single-cell RNA-sequencing data can be found in Schefzik et al.
#' (2020). Corresponds to the function \code{.testWassEdit} when identifying the argument
#' \code{inclZero=TRUE} in \code{.testWassEdit} with the argument \code{method="OS"} and the argument
#' \code{inclZero=FALSE} with the argument \code{method="TS"}.
#'           
#' The input data matrix \eqn{x} [alternatively, the input data matrices to form the \code{SingleCellExperiment} objects \eqn{x} and \eqn{y}, respectively] as the starting point of the test is supposed to contain the single-cell RNA-sequencing expression data after several pre-processing steps. In particular, note that as input for scRNA-seq analysis, waddR expects a table of pre-filtered and normalised count data. As filtering and normalisation are important steps that can have a profound impact in a scRNA-seq workflow (Cole et al., 2019), these should be tailored to the specific question of interest before applying waddR. waddR is applicable to data from any scRNA-seq platform (demonstrated in our paper for 10x Genomics and Fluidigm C1 Smart-Seq2) normalised using most common methods, such as those implemented in the Seurat (Butler et al., 2018) or scran (Lun et al., 2016) packages. Normalisation approaches that change the shape of the gene distributions (such as quantile normalisation) and gene-wise scaling or standardizing should be avoided when using waddR.
#'           
#' For the two-stage approach (\code{method="TS"}) according to Schefzik et al. (2021), two separate tests for differential proportions of zero expression (DPZ) and non-zero differential distributions (non-zero DD), respectively, are performed. In the DPZ test using logistic regression, the null hypothesis that there are no DPZ is tested against the alternative that there are DPZ. In the non-zero DD test using the semi-parametric 2-Wasserstein distance-based procedure, the null hypothesis that there is no difference in the non-zero expression distributions is tested against the alternative that the two non-zero expression distributions are differential.
#'           
#' The current implementation of the test assumes that the expression data matrix is based on one replicate per condition only. For approaches on how to address settings comprising multiple replicates per condition, see Schefzik et al. (2021).           
#'
#'@param x matrix of single-cell RNA-sequencing expression data with genes in
#' rows and cells (samples) in columns [alternatively, a \code{SingleCellExperiment} object for condition \eqn{A}, where the matrix of the single-cell RNA sequencing expression data has to be supplied via the \code{counts} argument in \code{SingleCellExperiment}] 
#'@param y vector of condition labels [alternatively, a \code{SingleCellExperiment} object for condition \eqn{B}, where the matrix of the single-cell RNA sequencing expression data has to be supplied via the \code{counts} argument in \code{SingleCellExperiment}] 
#'@param method method employed in the testing procedure: if "OS", a one-stage test is performed, i.e. the semi-parametric test is applied to all (zero and
#' non-zero) expression values; if "TS", a two-stage test is performed, i.e.
#' the semi-parametric test is applied to non-zero expression values only and combined
#' with a separate test for differential proportions of zero expression
#' using logistic regression
#'@param permnum number of permutations used in the permutation testing
#' procedure
#'@param seed number to be used to generate a L'Ecuyer-CMRG seed, which itself
#' seeds the generation of an nextRNGStream() for each gene to achieve
#' reproducibility; default is NULL, and no seed is set
#'@return Matrix, where each row contains the testing results of the respective gene from \code{dat}. The corresponding values of each row (gene) are as follows, see Schefzik et al. (2021) for details.     
#' In case of \code{inclZero=TRUE}:
#' \itemize{
#' \item d.wass: 2-Wasserstein distance between the two samples computed
#'  by quantile approximation
#' \item d.wass^2: squared 2-Wasserstein distance between the two samples
#'  computed by quantile approximation
#' \item d.comp^2: squared 2-Wasserstein distance between the two samples
#'  computed by decomposition approximation
#' \item d.comp: 2-Wasserstein distance between the two samples computed by
#'  decomposition approximation
#' \item location: location term in the decomposition of the squared
#'  2-Wasserstein distance between the two samples
#' \item size: size term in the decomposition of the squared 2-Wasserstein
#'  distance between the two samples
#' \item shape: shape term in the decomposition of the squared 2-Wasserstein
#'  distance between the two samples
#' \item rho: correlation coefficient in the quantile-quantile plot
#' \item pval: p-value of the semi-parametric 2-Wasserstein distance-based
#'  test when applied to all (zero and non-zero) respective gene expression values
#' \item p.ad.gpd: in case the GPD fitting is performed: p-value of the
#' Anderson-Darling test to check whether the GPD actually fits the data well
#' (otherwise NA)
#' \item N.exc: in case the GPD fitting is performed: number of exceedances
#' (starting with 250 and iteratively decreased by 10 if necessary) that are
#' required to obtain a good GPD fit, i.e. p-value of Anderson-Darling test
#' \eqn{\geq 0.05} (otherwise NA)
#' \item perc.loc: fraction (in \%) of the location part with respect to the
#'  overall squared 2-Wasserstein distance obtained by the decomposition
#'  approximation
#' \item perc.size: fraction (in \%) of the size part with respect to the
#'  overall squared 2-Wasserstein distance obtained by the decomposition
#'  approximation
#' \item perc.shape: fraction (in \%) of the shape part with respect to the
#'  overall squared 2-Wasserstein distance obtained by the decomposition
#'  approximation
#' \item decomp.error: relative error between the squared 2-Wasserstein
#'  distance computed by the quantile approximation and the squared
#'  2-Wasserstein distance computed by the decomposition approximation
#' \item pval.adj: adjusted p-value of the semi-parametric 2-Wasserstein
#'  distance-based test according to the method of Benjamini-Hochberg (i.e. adjusted p-value corresponding to pval)
#' }
#' In case of \code{inclZero=FALSE}:
#' \itemize{
#' \item d.wass: 2-Wasserstein distance between the two samples computed
#'  by quantile approximation (based on non-zero expression only)
#' \item d.wass^2: squared 2-Wasserstein distance between the two samples
#'  computed by quantile approximation (based on non-zero expression only)
#' \item d.comp^2: squared 2-Wasserstein distance between the two samples
#'  computed by decomposition approximation (based on non-zero expression only)
#' \item d.comp: 2-Wasserstein distance between the two samples computed by
#'  decomposition approximation (based on non-zero expression only)
#' \item location: location term in the decomposition of the squared
#'  2-Wasserstein distance between the two samples (based on non-zero expression only)
#' \item size: size term in the decomposition of the squared 2-Wasserstein
#'  distance between the two samples (based on non-zero expression only)
#' \item shape: shape term in the decomposition of the squared 2-Wasserstein
#'  distance between the two samples (based on non-zero expression only)
#' \item rho: correlation coefficient in the quantile-quantile plot (based on non-zero expression only)
#' \item p.nonzero: p-value of the semi-parametric 2-Wasserstein distance-based
#'  test when applied to non-zero respective gene expression values
#' \item p.ad.gpd: in case the GPD fitting is performed: p-value of the
#' Anderson-Darling test to check whether the GPD actually fits the data well
#' (otherwise NA)
#' \item N.exc: in case the GPD fitting is performed: number of exceedances
#' (starting with 250 and iteratively decreased by 10 if necessary) that are
#' required to obtain a good GPD fit, i.e. p-value of Anderson-Darling test
#' \eqn{\geq 0.05} (otherwise NA)
#' \item perc.loc: fraction (in \%) of the location part with respect to the
#'  overall squared 2-Wasserstein distance obtained by the decomposition
#'  approximation (based on non-zero expression only)
#' \item perc.size: fraction (in \%) of the size part with respect to the
#'  overall squared 2-Wasserstein distance obtained by the decomposition
#'  approximation (based on non-zero expression only)
#' \item perc.shape: fraction (in \%) of the shape part with respect to the
#'  overall squared 2-Wasserstein distance obtained by the decomposition
#'  approximation (based on non-zero expression only)
#' \item decomp.error: relative error between the squared 2-Wasserstein
#'  distance computed by the quantile approximation and the squared 
#'  2-Wasserstein distance computed by the decomposition approximation (based on non-zero expression only)
#' \item p.zero: p-value of the test for differential proportions of zero
#'  expression (logistic regression model)
#' \item p.combined: combined p-value of p.nonzero and p.zero obtained by
#'  Fisher's method
#' \item p.adj.nonzero: adjusted p-value of the semi-parametric 2-Wasserstein
#'  distance-based test based on non-zero expression only according to the
#'  method of Benjamini-Hochberg (i.e. adjusted p-value corresponding to p.nonzero)
#' \item p.adj.zero: adjusted p-value of the test for differential proportions
#'  of zero expression (logistic regression model) according to the method of
#'  Benjamini-Hochberg (i.e. adjusted p-value corresponding to p.zero)
#' \item p.adj.combined: adjusted combined p-value of p.nonzero and p.zero
#'  obtained by Fisher's method according to the method of Benjamini-Hochberg (i.e. adjusted p-value corresponding to p.combined)
#' }
#'
#'@references Butler, A., Hoffman, P., Smibert, P., Papalexi, E., and Satija, R. (2018). Integrating single-cell transcriptomic data across different conditions, technologies, and species. Nature Biotechnology, 36, 411-420.
#'
#'Cole, M. B., Risso, D., Wagner, A., De Tomaso, D., Ngai, J., Purdom, E., Dudoit, S., and Yosef, N. (2019). Performance assessment and selection of normalization procedures for single-cell RNA-seq. Cell Systems, 8, 315-328.
#'
#'Lun, A. T. L., Bach, K., and Marioni, J. C. (2016). Pooling across cells to normalize single-cell RNA sequencing data with many zero counts. Genome Biology, 17, 75.
#'
#'Schefzik, R., Flesch, J., and Goncalves, A. (2021). Fast identification of differential distributions in single-cell RNA-sequencing data with waddR.
#'
#'@examples
#' #simulate scRNA-seq data
#' set.seed(24)
#' nb.sim1<-rnbinom(n=(750*250),1,0.7)
#' dat1<-matrix(data=nb.sim1,nrow=750,ncol=250)
#' nb.sim2a<-rnbinom(n=(250*100),1,0.7)
#' dat2a<-matrix(data=nb.sim2a,nrow=250,ncol=100)
#' nb.sim2b<-rnbinom(n=(250*150),5,0.2)
#' dat2b<-matrix(data=nb.sim2b,nrow=250,ncol=150)
#' dat2<-cbind(dat2a,dat2b)
#' dat<-rbind(dat1,dat2)*0.25
#' #randomly shuffle the rows of the matrix to create the input matrix
#' set.seed(32)
#' dat<-dat[sample(nrow(dat)),]
#' condition<-c(rep("A",100),rep("B",150))  
#' 
#' #call wassersteinEdit.sc with a matrix and a vector including conditions
#' #set seed for reproducibility
#' #two-stage method
#' wassersteinEdit.sc(dat,condition,method="TS",permnum=10000,seed=24)
#' #one-stage method
#' wassersteinEdit.sc(dat,condition,method="OS",permnum=10000,seed=24)
#' 
#' #alternatively, call wassersteinEdit.sc with two SingleCellExperiment objects
#' #note that the possibly pre-processed and normalized expression matrices need to be
#' #included using the "counts" argument
#' sce.A <- SingleCellExperiment::SingleCellExperiment(
#'   assays=list(counts=dat[,1:100]))
#' sce.B <- SingleCellExperiment::SingleCellExperiment(
#'   assays=list(counts=dat[,101:250]))
#' #set seed for reproducibility
#' #two-stage method          
#' wassersteinEdit.sc(sce.A,sce.B,method="TS",permnum=10000,seed=24)
#' #one-stage method          
#' wassersteinEdit.sc(sce.A,sce.B,method="OS",permnum=10000,seed=24)
#'
#' @name wassersteinEdit.sc
#' @export
#' @docType methods
#' @rdname wassersteinEdit.sc-method
setGeneric("wassersteinEdit.sc",
    function(x, y, method=c("TS", "OS"), permnum=10000, seed=NULL, workers = 1,
             show_progress = TRUE)
        standardGeneric("wassersteinEdit.sc"))


#'@rdname wassersteinEdit.sc-method
#'@aliases wassersteinEdit.sc-method,matrix,vector,ANY,ANY,ANY-method
setMethod("wassersteinEdit.sc", 
    c(x="matrix", y="vector"),
    function(x, y, method=c("TS", "OS"), permnum=10000, seed=NULL, workers = 1,
             show_progress = TRUE) {
        stopifnot(length(unique(y)) == 2)
        stopifnot(dim(x)[2] == length(y))
        
        method <- match.arg(method)
        switch(method,
               "TS"=.testWassEdit(x, y, permnum, inclZero=FALSE, seed=seed, 
                                  workers = workers, show_progress = show_progress),
               "OS"=.testWassEdit(x, y, permnum, inclZero=TRUE, seed=seed, 
                                  workers = workers, show_progress = show_progress))
    })


#'@rdname wassersteinEdit.sc-method
#'@aliases
#'  wassersteinEdit.sc,SingleCellExperiment,SingleCellExperiment,ANY,ANY,ANY-method
setMethod("wassersteinEdit.sc",
    c(x="SingleCellExperiment", y="SingleCellExperiment"),
    function(x, y, method=c("TS", "OS"), permnum=10000, seed=NULL, workers = 1,
             show_progress = TRUE) {
        stopifnot(dim(counts(x))[1] == dim(counts(y))[1])
        
        dat <- cbind(counts(x), counts(y))
        condition <- c(rep(1, dim(counts(x))[2]), rep(2, dim(counts(y))[2]))
        method <- match.arg(method)
        switch(method,
               "TS"=.testWassEdit(dat, condition, permnum, 
                              inclZero=FALSE, seed=seed, workers = workers,
                              show_progress = show_progress),
               "OS"=.testWassEdit(dat, condition, permnum, 
                              inclZero=TRUE, seed=seed, workers = workers,
                              show_progress = show_progress))
    })

