
library(ggplot2)
slices <- c(22, 16, 15, 15, 9, 9, 8, 4)
lbls <- c("US", "Japan", "Mexico","Philippines", "Korean", "Poland","Singapore","Qatar")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) 
lbls <- paste(lbls,"%",sep="") 
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")


