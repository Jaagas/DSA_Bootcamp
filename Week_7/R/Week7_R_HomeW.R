# 1. Assign value of 39 to x; 22 to y; equal z value to x-y and display z in the console.
39 -> x
y <- 22
x-y -> z
z
# 2. Create a vector called “vec1” including the numbers 2 5 8 12 16.
# Use x:y notation to make “vec2” vector containing numbers from 5 to 9 Subtract “vec2” from “vec1”.
c(2,5,8,12,16) -> vec1
5:9 -> vec2
vec1 - vec2
# 3. Use seq() to create vector of 100 values starting at 2 and increasing by 3 and name it
# “numbers”
# a) Extract the values at positions 5,10,15 and 20 in “numbers” vector;
# b) Extract the values at positions 10 to 30 in “numbers” vector.
seq(from=2,by=3,length.out=100) -> number.series
number.series
number.series[c(5,10,15,20)
number.series[10:30]
# 4. You have been supplied with two vectors of data: monthly revenue and monthly expenses for
# the financial year in question.

revenue <- c(14574.49, 7606.46, 12611.41, 13175.41, 8758.65, 8105.44, 11496.28,
             9766.09, 10305.32, 17379.96, 10713.97, 15433.50)
expense <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12,
             6976.93, 16618.61, 10054.37, 3803.96)
profit <- revenue - expense
profit

tax <- round(0.30 * profit, 2)
tax 

profit.after.tax <- profit - tax
profit.after.tax
mean_pat <- mean(profit.after.tax)
mean_pat
good.months <- profit.after.tax > mean_pat
good.months



# 5. Write output of given function:
#   x <- c(4,6,5,7,10,9,4,15)
# What is the value when x < 7?
x <- c(4,6,5,7,10,9,4,15)
for (i in x){ 
  val_x <- x<7
}
val_x
