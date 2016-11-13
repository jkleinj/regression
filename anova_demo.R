#! /usr/bin/R

generateExperiment <- function (geneN = 100, expN = 4) {
	myDat <-
		sapply (1:expN, function (l) {
            rnorm (geneN, mean = l)
        })
    colnames (myDat) <- letters[1:expN]
    return (myDat)
}

myDat <- generateExperiment()
boxplot (data.frame (myDat))

finMat <- NULL
for (myNam in colnames (myDat)) {
    finMat <- rbind (finMat,
                     data.frame ("val" = myDat[, myNam],
                                 "nam" = rep (myNam, nrow (myDat))))
}

myLm <- lm (val ~ nam, data = finMat)
anova(myLm)
 
