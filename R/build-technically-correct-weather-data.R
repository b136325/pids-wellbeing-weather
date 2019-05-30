# 1. Create a dir called /data/pre-technically-correct
# copy all of the weather files into the above

# 2. Add end of line character to all of the pre-technically correct files
# Do so to all 
line="\n"
write(
  line,
  file = "data-raw/weather/armagh.txt", 
  append = TRUE
)

# 3. Find the position of the last line of the HEADER BLOCK
result <- grep('Sunshine data taken', readLines("data-raw/weather/armagh.txt"))

# 4. Create the core data file
data <- read.delim(file = "data-raw/weather/armagh.txt", header = FALSE, sep = "\n")

newdata <- data[-seq(1, result), ] 

# 5. Find a way of taking the data out of newdata and creating a complete data frame
newdata

# 6. Add appropriate headings

# 7. Ensure that the colum types are okay

# 8. Save into /data/technically-correct


