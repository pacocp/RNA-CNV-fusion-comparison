suppressMessages(library(KnowSeq))
setwd("/Volumes/GoogleDrive/Mi unidad/Research/multiomics-integration-LC/RNA-Seq")

for(i in 0:9){
  input_name = paste("merged-LC-train/merged_LC_train_",i,'.csv',sep="")
  countsInformation <- countsToMatrix(input_name, extension='count')
  
  # Exporting to independent variables the counts matrix and the labels
  
  countsMatrix <- countsInformation$countsMatrix
  
  labels <- countsInformation$labels
  
  # Downloading human annotation
  myAnnotation <- getGenesAnnotation(rownames(countsMatrix))
  
  # Calculating gene expression values matrix using the counts matrix
  
  expressionMatrix <- calculateGeneExpressionValues(countsMatrix,myAnnotation,
                                                    genesNames = TRUE)
  
  # training
  #svaMod <- batchEffectRemoval(exprtessionMatrix, labels, method = "sva")
  
  DEGsInformation <- DEGsExtraction(expressionMatrix, labels, lfc = 1.5,
                                    pvalue = 0.001, number = Inf, 
                                    svaCorrection = FALSE,
                                    cov = 2)
  topTable <- DEGsInformation$Table
  DEGsMatrix <- DEGsInformation$DEGsMatrix
  DEGsMatrixML <- t(DEGsMatrix)
  
  degs <- colnames(DEGsMatrixML)

  name = paste('limma-degs/limmadegs_RNA_train',i,'_lfc1-5_p0-001_cov2.csv', sep="")
  write.csv(degs, name, row.names = FALSE)
}