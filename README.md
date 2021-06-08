# Fit Non Stationary Data using ARIMA model
# Data
(88,84,85,85,84,85,83,85,88,89,91,99,104,112,126,138,146,151,150,148,147,149,143,132,131,139,147,150,148,145,140,134,131,131,129,126,126,132,137,140,142,150,159,167,170,171,172,172,174,175,172,172,174,174,169,165,156,142,131,121,112,104,102,99,99,95,88,84,84,87,89,88,85,86,89,91,91,94,101,110,121,135,145,149,156,165,171,175,177,182,193,204,208,210,215,222,228,226,222,220)

# 1.Data Analysis
Analysing the time plot of the data, we can see that the data is not stationary. We can observe that the values do not oscillate around a value. Checking the mean variation plot, we can observe that it is increasing therefore has a positive trend component.

![image](https://user-images.githubusercontent.com/29349268/121106981-b167e800-c839-11eb-86ec-9c827c89b635.png)

Fig: Above is the data-time plot. The red line shows the mean of the data. It can be observed that the mean is increasing with time therefore has a positive trend.

# 2.ACF and PACF Analysis.

In this section, we will analyse the ACF and PACF plot of the data.

![image](https://user-images.githubusercontent.com/29349268/121107023-c04e9a80-c839-11eb-850c-093aa8d4b5ac.png)

Fig: ACF plot of the data.
The ACF plot is decreasing slowly which is an indicator that the data is not stationary. The ACF is not cut-off but instead shows a sinusoidal degradation. This can indicate that there is a seasonality component in the data.

![image](https://user-images.githubusercontent.com/29349268/121107035-c5abe500-c839-11eb-93aa-52186b2b0a22.png)

Fig: PACF plot of the data.
PACF gets cut-off after 2, but since the data is not stationary this cannot be used to suggest a model.

# 3.Make Data Stationary.
To make the data stationary apply difference (Z= ΔXt) operator in the data.  Checking the resulting time plot. We can observe that the mean and variance are not changing with time. 
 
![image](https://user-images.githubusercontent.com/29349268/121107065-d5c3c480-c839-11eb-8986-92a66190e003.png)
 
Fig: Time plot of the result of difference operation on data. We can observe that mean is not increasing with time therefore the trend component is removed and is a stationary series.

![image](https://user-images.githubusercontent.com/29349268/121107074-dcead280-c839-11eb-934c-611f2a152894.png)

Fig: Above is the ACF for the resulting data after applying difference operator(Z= ΔXt).

![image](https://user-images.githubusercontent.com/29349268/121107087-e3794a00-c839-11eb-8c09-e8d90e6efbe4.png)

Fig: Above is the PACF plot for the resulting data after applying difference operator(Z= ΔXt)

From the ACF and PACF plots we can see that the ACF has does not cut-off but PACF has been cut-off after 3. Therefore, from this observation we can suggest model AR(3) for the Z= ΔXt data. 

# 4.Model
From the above observations we can see that the data becomes stationary after applying difference operator once therefore d =1. The stationary data can be represented using the AR(3) model therefore p=3. Therefore, combining both, we can suggest ARIMA(3,1,0) model for the data.

# 5.Diagnostic Checking
Fitted the model ARIMA(3,1,0) for the data. 

![image](https://user-images.githubusercontent.com/29349268/121107121-f3912980-c839-11eb-826c-315fe4767776.png)

Fig: Above is the graph obtained after the diagnostic function. 

From the diagnostic graph we can observe that the residuals show no structure, so resembles a white noise. This is confirmed by the residual ACF as its cut-off after the first lag. Shows there is no correlation between the residuals. The p-value is also high for the model.

![image](https://user-images.githubusercontent.com/29349268/121107166-060b6300-c83a-11eb-8148-bc86693fe891.png)

Above are the details like coefficient, likelihood  and AIC of the model.
Log Likelihood =  -252  and AIC= 511.99

# 6.Forecast
By plotting the graph with observations and the model response shows how well the model fits the given data. Using the model, forecasted the next 6 data points along with the forecast interval for 95% confidence.

![image](https://user-images.githubusercontent.com/29349268/121107184-0c99da80-c83a-11eb-97a7-0f5b34a1bb1c.png)

Fig: The black dots show the actual observations, and the red dot shows the forecasted values. The red line shows the model fitted the values. The blue line indicates the forecast confidence interval. 
