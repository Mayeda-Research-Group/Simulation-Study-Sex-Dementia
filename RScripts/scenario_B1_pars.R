#*******************************************************************************
# Simulation Senario B1 input parameters
# 99.1% cumulative incidence of mortality
# Exposure = female gender
# Based on US lifetables, sample is 51% F / 49% M at age 50
# Remaining LE (median) at age 50:  23.5 years for F and 22.5 years for M
#*******************************************************************************

#---- Baseline age ----
age0 <- 50

#---- Assessment parameters ----
#Time between assessments (measured in years)
int_time <- 5

#Number of assessments
num_tests <- 9

#Resulting visit times (years from baseline)
visit_times <- seq(from = 0, to = int_time*num_tests, by = int_time)

#---- Prevalance of exposure (female) ----
#Exposure = female gender
pfemale <- 0.51

#---- Variances and correlations ----
ci_var0 <- 0.05       #Variance of random cognitive intercept
ci_var1 <- 0.001      #Variance of random linear term
ci_var2 <- 0.000009   #Variance of random quadratic term 

ci_cov01 <- -0.00009  #Covariance between random intercept and random linear term
ci_cov12 <- 0         #Covariance between random linear and random quadratic term
ci_cov02 <- 0         #Covariance between random intercept and random quadratic term 
                         
ci_var3 <- 1  #Variance of noise for Ci model (cognitive function for person i)

#---- Parameters for Ci ----
#Cognitive function for person i 
b00 <- 0      #Cognitive intercept for males 
b01 <- 0      #Effect of female on cognitive intercept
b02 <- 0      #Effect of age on cognitive intercept; Note: Everyone is the same age so there is no age effect (since baseline centered ages are 0 for everyone)
b03 <- -0.1   #Effect of U (unmeasured/underlying variable) on cognitive intercept (loosely based on Marden et. al. 2017)


b10 <- 0.047895  #Cognitive linear term for males                
b11 <- 0         #Effect of female on cognitive linear term
b12 <- 0         #Effect of age on cognitive linear term; Note: Everyone is the same age so there is no age effect
b13 <- 0         #Effect of U on cognitive linear term 

b20 <- -0.003025  #Cognitive quadratic term for males 
b21 <- 0          #Effect of female on cognitive quadratic term
b22 <- 0          #Effect of age on cognitive quadratic term; Note: Everyone is the same age so there is no age effect 
b23 <- 0          #Effect of U on cognitive quadratic term

#---- Parameters for Sij (survival for person i in age-band j) ----
#Effect of sex (being female) on log hazard of death; 
#Values from survival_opt.R
g1 <- log(c(0.896974, 0.870294, 0.868323, 0.890599, 0.887837, 0.902755, 
            0.898643, 0.888021, 0.960531))

g2 <- log(2)  #Effect of U on log hazard of death
g3 <- 0       #Effect of interaction between male and U on log hazard of death

#---- Baseline hazard of death for unexposed ----
lambda <- c(0.0108909, 0.0166604, 0.0259031, 0.0419988, 0.0745489, 0.1309740, 
            0.2497033, 0.4902203, 0.9133746)

#---- Baseline hazard of random/shock dementia ----
lambda_dj <- 0.007

#---- Dementia Cut Point ----
dem_cut <- -6.5

