####This project contains examples of statistical computing programming in **R** using data analysis and optimization. These programs were written as assignments for the John Hopkins course **'R Programming'** taken through Coursera.  

---  

The folder **PA1** contains 3 functions that are meant to interact with dataset stored in the folder *specdata*      
*specdata* contains 332 CSV files containing pollution monitoring data for fine particulate matter at 332 locatioms in the United States. The fields in each file are: date of the observation, the level of sulfate PM in the air on that date, the level of nitrate PM in the air on that date and the ID number of each monitor. This data was obtained while undertaking the course mentioned aboved.  
The 3 functions are:
* *pollutantmean* : calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function takes three arguments: 'directory', 'pollutant', and 'id'. The parameter 'directory' is the location of the directory specdata, 'pollutant' is the name of the pollutant (either "sulfate" or "nitrate") and 'id' is an integer vector indicating the monitor ID numbers to be used. It returns the mean of the pollutant across all monitor list in the 'id' vector (ignoring NA values). Example output of this function is:  
```R
pollutantmean("specdata", "nitrate", 70:72)
1.706
```  
* *complete*: reads a directory full of files and reports the number of completely observed cases in each data file. The function takes two arguments: 'directory' and 'id'. The parameter 'directory' indicates the location of the CSV files and 'id' is an integer vector indicating the monitor ID numbers to be used. It returns a data frame of the form [id nobs] where 'id' is the monitor ID number and 'nobs' is the number of complete cases. Example output of this function is:  
```R
complete("specdata", 1)    
  id nobs    
1  1  117
``` 
* *corr*: calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function takes two arguments: 'directory' and 'threshold'. The parameter 'directory' is the location of the CSV files and 'threshold' is a numeric vector indicating the number of completely observed observations required to compute the correlation between nitrate and sulfate. It returns a numeric vector of correlations. Example output of this function is:  
```R
cr <- corr("specdata", 150)    
head(cr)    
[1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589    
summary(cr)  
     Min. 1st Qu.  Median    Mean 3rd Qu.    Max.     
  -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
```
