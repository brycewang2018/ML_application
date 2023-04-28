******* Example 1 - Auto
// Load the iris dataset
sysuse auto, clear

// Select the variables for PCA
keep mpg weight turn displ gear_ratio rep78

// Standardize the variables
*standardize mpg weight turn displ gear_ratio


// Pwcorr
pwcorr, sig star(.05)

// Perform PCA
pca mpg weight turn displ gear_ratio rep78

// Plot the scree plot, keep 3 components 
screeplot

// KMO test, the kml should > 0.5
estat kmo   


// Check the cov matrix, eigenvalues and eigenvectors 
matrix list e(C) // Cov
matrix list e(Ev) //Eigenvalues
matrix list e(L) // Egigenvectors 


// loading plot and scoreplot 
loadingplot
scoreplot 

pca mpg weight turn displ gear_ratio rep78, components(2)
predict pc1 pc2, score


// Plot the first two principal components
twoway scatter pc1 pc2, name(pca_plot) xtitle("PC1") ytitle("PC2") title("PCA of Auto Data")


******** Factor Analysis

// Load example data
sysuse auto, clear

// Perform factor analysis with 3 factors
factor mpg weight turn displ gear_ratio rep78, pcf factor(3) 

// Summarize factor analysis results
ereturn list
matrix list e(L)

