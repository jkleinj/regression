sampN <- 20

#######################################
###
### linear combination
### p-value ~1
###
w <- rnorm (sampN)
x <- rnorm (sampN)
y <- rnorm (sampN)
z <- rnorm (sampN)

myDat <- data.frame ("A" = x, "B" = y, "val" = x + y + z)

myLm <-
    lm (val ~ A + B + A * B, data = myDat)

anova (myLm)


#######################################
###
### produkt (beide hoch fuer hoch) -> Mischterm
### p-value <<1
### aber auch die anderen reagieren

sampN <- 20

anovaP <-
    t (sapply (1:100, function (l) {
        w <- rnorm (sampN)
        x <- rnorm (sampN)
        y <- rnorm (sampN)
        z <- rnorm (sampN) / 10
        myDat <- data.frame ("A" = x, "B" = y, "val" = y * x + z)
        myLm <-
            lm (val ~ A + B + A * B, data = myDat)
        return (anova (myLm)[["Pr(>F)"]])
    }))
boxplot (data.frame (log10 (anovaP)))

