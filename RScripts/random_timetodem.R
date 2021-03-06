#This function calculates time to random/shock dementia onset

random_timetodem <- function(obs_matrix){
  #Calculate random time to dementia for each interval
  random_timetodem_ij <- matrix(ncol = ncol(obs_matrix), 
                                nrow = (length(visit_times) - 4))
  for(i in 1:ncol(obs_matrix)){
    random_demtimes <- matrix(NA, nrow = (length(visit_times) - 4), ncol = 1)
    for(j in 1:length(random_demtimes)){
      r_name <- variable_names$r2ij_varnames[j + 3]
      
      demtime = -log(obs_matrix[r_name, i])/(lambda_dj)
      
      random_demtimes[j] <- as.numeric(demtime)
    }
    
    random_timetodem_ij[, i] <- random_demtimes
  }
  
  return(random_timetodem_ij)
}

