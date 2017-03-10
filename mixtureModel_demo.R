#! /usr/bin/R

#===============================================================================
# demo of regression of mixture model
# to illustrate a mixture model for Jamie's PKM oligomer kinetics
# (C) 2017 Jens Kleinjung
#===============================================================================

## some random concentrations of monomer, dimer and tetramer in 100 experiments
o1 = runif(100)
o2 = runif(100)
o4 = runif(100)

## putative kinetic parameters k1, k2, k4 (which we don't actually know)
k1 = 8
k2 = 16
k4 = 64

## response variable (kinetic efficiency) assuming a linear equation,
##   plus noise
y = k1 * o1 + k2 * o2 + k4 * o4 + 0.1 * runif(100)

## Now we have 100 equations: we can reconstruct the parameters using a linear fit.

## first create a data frame
mydata = data.frame(cbind(y, o1, o2, o4));

## linear fit
mylm = lm(y ~ o1 + o2 + o4, mydata);
## inspect result
mylm

#===============================================================================
