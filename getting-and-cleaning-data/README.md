getting-and-cleaning-data-R
===========================

#####In R, performs steps to download online data and process it to create "tidy" data
  
  
run_analysis.R downloads <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">online data</a> that represents data collected from accelerometer and gyroscope from the Samsung Galaxy S smartphone. It processes it and creates a second, "tidy" data set. This data set is written to result.txt which can read by the R function read.table().  
  
Please refer to Cookbook to read details on the transformations performed on the data set, and descriptions of the different variables in the final data set
  
To run the analysis, execute *main* method. It returns the target data set as a data frame written to the file result.txt.
  
Example syntax of running the analysis is
```R
source("run_analysis.R")
main()
```
  
