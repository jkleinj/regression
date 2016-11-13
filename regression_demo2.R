sampN <- 20

lmList <-
    lapply (1:100, function (l) {
        w <- rnorm (sampN)
        x <- rnorm (sampN)
        y <- rnorm (sampN)
        z <- rnorm (sampN) / 10
        myDat <- data.frame ("A" = x, "B" = y, "val" = y * x + z)

        return (lm (val ~ A + B + A * B, data = myDat))
    })
par (mfrow = c (1, 2))

## Coeffizienten plot
## AB positiv
lmCoeff <-
    t (sapply (lmList, function (l) {
        return (l$coeff)
    }))
boxplot (data.frame (lmCoeff))


## p-Wert plot
## Kennst du schon
anovaP <-
    t (sapply (lmList, function (l) {
        return (anova (l)[["Pr(>F)"]])
    }))
boxplot (data.frame (log10 (anovaP)))

