setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\Cap03")
getwd()

# if-else
x = 25
if (x < 30)
{"Este numero eh menor que 30"}

# the curly brackets aren't mandatory, but highly recommended
if (x < 30)
  "Este numero eh menor que 30"

# Else
if (x < 7) {
  "Este numero eh menor que 7"
} else {
  "Este numero nao eh menor que 7"
}

# We can nest the command aswell
x = 7
if (x < 7) {
  "Este numero eh menor que 7"
} else if (x == 7) {
  "Este eh o numero 7"
} else {
  "Este numero nao eh menor que 7"
}

# Ifelse
x = 5
ifelse (x < 6, "Correto!", NA)

x = 9
ifelse (x < 6, "Correto!", NA)

# nested ifelse expressions
x = c(7, 5, 4)
ifelse(x < 5, "Menor que 5",
       ifelse(x == 5, "Igual a 5", "Maior que 5"))

# If inside functions
func1 <- function(x,y) {
  ifelse(y < 7, x + y, "Não encontrado")
}

func1(4,2)
func1(40,7)

# Rep
rep(rnorm(10), 5)

# Repeat
x = 1
repeat {
  x = x + 3
  if (x > 99)
    break
  print(x)
}

# For loop
for (i in 1:20) {print(i)}
for (q in rnorm(10)) {print(q)}

# Ignores some values inside the loop
for (i in 1:22) {
  if (i == 13 | i == 15)
    next
  print(i)
}

# Breaks loop
for(i in 1:22) {
  if(i == 13)
    break
  print(i)
}

# while loop
x = 1
while(x < 5){
  x = x + 1
  print(x)
}

# While loop wont execute
y = 6
while(y < 5){
  y = y + 10
  print(y)
}
