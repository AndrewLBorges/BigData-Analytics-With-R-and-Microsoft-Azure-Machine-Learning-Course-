
# many of the techniques below can be done with functions like
# subset, merge, plyr::arrange
# but knowing the notations is fundamental to understanding how to
# generate these subsets

# vectors
x <- c("A", "E", "D", "B", "C")
x[]
x

# positive indexes - specific positioned elements
x[c(1, 3)]
x[c(1, 1)]
x[order(x)]

# negative indexes - ignores specific positioned elements
x[-c(1, 3)]
x[-c(1, 4)]

# logic vector
x[c(TRUE, FALSE)]
x[c(TRUE, FALSE, TRUE, FALSE)]

# character vector
y <- setNames(x, letters[1:4])
y
y[c("d", "c", "a")]
y[c("a", "a", "a")]

# matrices
mat <- matrix(1:9, nrow = 3)
colnames(mat) <- c("A", "B", "C")
mat
mat[1:2, ]
mat[1:2, 2:3]

# outer() function allows matrix to behavior as individual vectors
?outer
vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")
vals
class(vals)
vals[c(4, 15)]

# DataFrames
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$x
df[df$x == 2, ]
df[c(1, 3), ]
df[c("x", "z")]
df[, c("x", "z")]
str(df["x"])
str(df[, "x"])

# removing columns from dataframes
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$z <- NULL
df
df[setdiff(names(df), "z")]

# [] and [[]] operators
a <- list(x = 1:3, y = 4:5)
a
a[1]
a[[1]]
a[[1]][[1]]
a[["x"]]
a["x"]

b <- list(a = list(b = list(c = list(d = 1))))
b
b[[c("a", "b", "c", "d")]]
b[["a"]][["b"]][["c"]][["d"]]

# x$y is the same as x[["y", exact = FALSE]]
var <- "cyl"
mtcars$var
View(mtcars)
mtcars[[var]]

x <- list(abc = 1)
x$a
x[["a"]]
x[["abc"]]

# Subsetting
x <- 1:5
x
x[c(1, 2)] <- 2:3
x

x[-1] <- 4:1
x

# this is subsetting
head(mtcars)
mtcars[] <- lapply(mtcars, as.integer)
head(mtcars)

# this is not subsetting
mtcars <- lapply(mtcars, as.integer)
head(mtcars)

# Lookup tables
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u = NA)
lookup[x]
unname(lookup[x])

# using logic operators
x1 <- 1:10 %% 2 == 0
x1
which(x1)
x2 <- which(x1)
x2
y1 <- 1:10 %% 5 == 0
y2 <- which(y1)
y2
intersect(x2, y2)
x1 & y1
which(x1 & y1)
union(x2, y2)
setdiff(x2, y2)
?setdiff
