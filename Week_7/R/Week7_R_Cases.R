set.seed(123)
data <- data.frame(random = rnorm(50))
# 1. Create a new `a` column in `data` table. If value in `random` column is greater than
# previous value write 1, otherwise 0.

for (i in 1:nrow(data)) {
    
    data$a[i] <- ifelse(data$random[i]>data$random[i-1],1,0)
  }
  
# 2. Create a new `b` column in `data` table. If value in `random` column is greater than
# sum of all values of `random` column write 1, otherwise 0.


for (i in 1:nrow(data)) {
  
  data$b[i] <- ifelse(data$random[i]>sum(data$random), 1, 0)
}
# 3. Create a new `c` column in `data` table. If value in `random` column is greater than sum
# of current and previous values and sum of all values write 1, otherwise 0.


for (i in 1:nrow(data)) {
  
  data$c[i] <- ifelse(data$random[i]>sum(data$random,data$random[i-1]), 1, 0)
}
# 4. Create a new `d` column in `data` table. If absolute value of current value in `random`
# column is greater than absolute value of the previous value write 1, otherwise 0.


for (i in 1:nrow(data)) {
  
data$d[i] <- ifelse (abs(data$random[i])>abs(data$random[i-1]),1,0)
}

# 5. Create a new `e` column in `data` table. If absolute value of current value in `random`
# column is greater than sum of all values in `random` column write 1, otherwise 0.



for (i in 1:nrow(data)) {
  
 data$e[i] <- ifelse(abs(data$random[i])> sum(data$random), 1, 0)  
}

# 6. Create a new `f` column in `data` table. If absolute of sum of previous and current values
# in `random` column is greater than sum of all values write 1, otherwise 0.


for (i in 1:nrow(data)) {
  
  data$f[i] <- ifelse(abs(sum(data$random[i],data$random[i-1]))> sum(data$random), 1, 0)
}

# 7. Create a new `n` column in `data` table where it equals to the sum of newly created
# columns, from `a` to `f`.

for(i in 1:nrow(data)){
data$n[i] <- sum(data[i,-1],na.rm = T)
}
