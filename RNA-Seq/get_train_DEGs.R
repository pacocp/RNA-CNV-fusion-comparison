suppressMessages(library(KnowSeq))

setwd("/Volumes/GoogleDrive/Mi unidad/Research/multiomics-integration-LC/RNA-Seq")
# Merging in one matrix all the count files indicated inside the CSV file

allCounts <- countsToMatrix("merged_LungCancer.csv", extension='count')

# Exporting to independent variables the counts matrix and the labels

countsMatrixAll <- allCounts$countsMatrix

labelsAll <- countsInformation$labels

# Downloading human annotation
myAnnotationAll <- getGenesAnnotation(rownames(countsMatrixAll))

# Calculating gene expression values matrix using the counts matrix

expressionMatrixAll <- calculateGeneExpressionValues(countsMatrixAll,myAnnotationAll,
                                                  genesNames = TRUE)
i = 0
for(i in 0:9){
  input_name = paste("merged_LC_train_",i,'.csv',sep="")
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
  svaMod <- batchEffectRemoval(expressionMatrix, labels, method = "sva")
  
  DEGsInformation <- DEGsExtraction(expressionMatrix, labels, lfc = 2,
                                    pvalue = 0.05, number = Inf, 
                                    svaCorrection = TRUE, sva=svaMod,
                                    cov = 2)
  topTable <- DEGsInformation$Table
  DEGsMatrix <- DEGsInformation$DEGsMatrix
  DEGsMatrixML <- t(DEGsMatrix)
  
  mrmrRanking <- featureSelection(DEGsMatrixML,labels,colnames(DEGsMatrixML), mode = "mrmr")
  mrmrDEGs <- expressionMatrixAll[names(mrmrRanking[1:32]),]
  mrmrDEGs <- t(mrmrDEGs)
  
  file_name = paste('mrmrDEGs_LC_3classes_split', i, '.csv', sep='')
  write.csv(mrmrDEGs, file_name, row.names = TRUE)
}
