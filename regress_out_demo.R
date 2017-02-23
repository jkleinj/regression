#! /usr/bin/R
## How to regress ou a vraiable
## http://stats.stackexchange.com/questions/117840/how-to-regress-out-some-variables
## (C) 2017 Jens Kleinjung

## Consider a correlation matrix R for 5 items, where we want to "partial-out" the first two variables. This is the initial correlation-matrix:
R = matrix(c(1.00,-0.15,0.27,0.53,0.24,-0.15,1.00,-0.09,-0.50,-0.34,0.27,-0.09,1.00,0.22,0.19,0.53,-0.50,0.22,1.00,0.47,0.24,-0.34,0.19,0.47,1.00), nrow = 5, ncol = 5);

## Now we want to partial out the first item. We determine the vector of correlations of all variables with it, this gives the vector f1 (which is just the first column of R : 
f1 = R[ , 1];
f1;

## Then build the matrix R1=f1⋅f1^T:
R1 = f1 %*% t(f1);

##   and subtract this from the original matrix to get R_-1:
R_1 = R - R1;
R_1;

## Now we look at the partial vector f2⋅1. First, we get just from extraction of the second column of the remaining covariance matrix. In order to have the entry in its second row such that then R2⋅1=f2⋅1⋅f2⋅1^T has the correct value in row and column 2 we must define f2⋅1=f2⋅1/srt(f2⋅1[2]), thus we get:
f21 = R_1[ , 2] / sqrt(R_1[2, 2]);
f21;

## Then  R21 = f21 ⋅ f21^T and we find:
R21 = f21 %*% t(f21);

##   and after removing that covariance as well by  R ⋅12= R ⋅1− R 2⋅1 we get:
R_21 = R_1 - R21;
R_21;

