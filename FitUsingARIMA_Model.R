#To get the mean value variation of the data set.
get_meanValues<-function(dataSet){
  sum<-0
  mean_collection<-c()
  n<-1
  for (v in dataSet){
    sum<-sum+v
    m<-(sum/n)
    mean_collection<-c(mean_collection,m)
    n<-n+1
  }
  return(mean_collection)
}

#Enter the input Data
usage = c(88,84,85,85,84,85,83,85,88,89,91,99,104,112,126,138,146,151,150,148,147,149,143,132,131,139,147,150,148,145,140,134,131,131,129,126,126,132,137,140,142,150,159,167,170,171,172,172,174,175,172,172,174,174,169,165,156,142,131,121,112,104,102,99,99,95,88,84,84,87,89,88,85,86,89,91,91,94,101,110,121,135,145,149,156,165,171,175,177,182,193,204,208,210,215,222,228,226,222,220)
plot.ts(usage)

#Ge the mean values of the time series
mean_usage<-get_meanValues(usage)

#Plot the Usage data along with the mean variation.
plot(usage,type="l",col="black")
lines(mean_v,col="red")

#Get the ACF of Usage
acf(usage)
#Get the PACF of usage
pacf(usage)

#Apply the Difference operator to make the data stationary.
z<-diff(usage)
#plot the resulting value.
plot.ts(z)

#Get the mean variance after the difference operator was applied.
z_mean_v<-get_meanValues(z)
plot(z,type="l",col="black")
lines(z_mean_v,col="red")

#get the ACF of z
acf(z)
#Get PACF of z
pacf(z)

#Fit the ARIMA model with p=3, d=1 and q=0 as per the observation from the ACF and PACF.
fit = arima(usage, order = c(3,1,0))
#Get the Diagnostic details of the fitted model.
tsdiag(fit)
#Get the model details.
fit

#Plot the observations and the how well the model fit the values.
plot(1:100, usage, xlim = c(0, 110), ylim=c(50, 250) )
lines(1:100, usage, type="l" )
#Plot how mwell the model fits the data.
lines(1:100, usage-fit$residuals, type="l", col="red")

#Forecast the next 6 data points using the model.
forecast = predict(fit, n.ahead=6)
#Plot the forecast values in the plot.
lines(101:106, forecast$pred, type="o", col="red")
#Find and plot the forecast confidence intervals.
lines(101:106, forecast$pred-1.96*forecast$se, col="blue")
lines(101:106, forecast$pred+1.96*forecast$se, col="blue")
