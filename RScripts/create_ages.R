#This function creates the matrix of participants ages

create_ages <- function(ages, num_obs){
  ones = matrix(1, nrow = num_obs, ncol = 1)
  return(ones %*% ages)
}
