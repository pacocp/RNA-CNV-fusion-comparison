library(KnowSeq)
library("readr")
library("data.table")
library(rhdf5)

setwd("~/Google Drive/Mi unidad/Research/miRNA-RNASeq-LC/Copy-Number-Variation")

#all_cpgs <- fread('CpGs_450_matrix_nonans.csv')

for (i in seq(0,9)){
  cat(i)
  name <- paste('train_degs2/DEGs_CNV_train',i,'_p0-001_cov3_noBDN.csv',sep='')
  train <- fread(name)
  
  train <- t(train)
  
  colnames(train) <- train[1,]
  train <- train[2:nrow(train),]
  
  labels_train <- train[,ncol(train)]
  train <- train[,1:ncol(train)-1]
  
  # Feature selection process with mRMR and RF
  mrmrRanking <-featureSelection(train,labels_train,colnames(train), mode = "mrmr")
  #mrmrDEGs <- expressionMatrixall[names(mrmrRanking[1:40]),]
  
  #results_cv_svm <- svm_trn(train,labels_train,names(mrmrRanking)[1:6],5)
  #dataPlot(results_cv_svm$accuracyInfo$meanAccuracy,mode = "classResults",
  #         main = "Accuracy for each fold with SVM Stage", xlab = "Genes", ylab = "Accuracy")

  file_name = paste('mrmrDEGs/mrmrDEGs_LC_CNV_3classes_p0-001_m0-1_cov3_split', i, '_noBDN.txt', sep='')
  write.table(names(mrmrRanking[1:40]), file_name, row.names = FALSE)
  
}