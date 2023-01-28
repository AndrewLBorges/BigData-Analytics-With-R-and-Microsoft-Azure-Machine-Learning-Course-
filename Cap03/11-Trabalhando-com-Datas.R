setwd("C:\\Users\\Andrew\\OneDrive\\Documentos\\Pessoal\\Cursos\\DSA\\BigDataRAzure\\Cap03")
getwd()

# systems datetime
hoje <- Sys.Date()
hoje
class(hoje)
Sys.time()
Sys.timezone()

# Dates - represented by the Date object
# Stored as the number of days since jan 1 1970

# Time - represented by a POSIXct object
# Stored as the number of seconds since jan 1 1970 at 00:00

# Formatting dates
# %d: day of the month with 2 digits (13)
# %m: month with 2 digits (01)
# %y: year with 2 digits (82)
# %Y: year with 4 digits (1982)
# %A: day of the week (Friday)
# %a: abbreviated day of the week (Fri)
# %B: month (July)
# %b: abbreviated month (Jul)

# Formatting time
# %H: hour (00-23)
# %M: minutes 
# %S: seconds
# %T: reduced format to %H:%M:%S
?strptime

# Formatting the output - as.Date()
as.Date("2018-06-28")
as.Date("Jun-28-18", format = "%b-%d-%y")
as.Date("28 Junho, 2018", format = "%d %B, %Y")

# format() function
Sys.Date()
format(Sys.Date(), format = "%d %B, %Y")
format(Sys.Date(), format = "Hoje eh %A")

# Converting Dates - as.POSIXct
date1 <- "Jun 13, '96 horas:23 minutos:01 segundos:45'"
date1_convert <- as.POSIXct(date1, format = "%B %d, '%y horas:%H minutos:%M segundos:%S'")
date1_convert

# date operations
data_de_hoje <- as.Date("2016-06-25", format = "%Y-%m-%d")
data_de_hoje
data_de_hoje + 1

my_time <- as.POSIXct("2016-05-14 11:24:134")
my_time
class(my_time)
my_time + 1 

data_de_hoje - as.Date(my_time)
data_de_hoje - my_time

# Converting a specific format
# using a vector to represent day, hours, minutes, etc
dts = c(1127056501, 1104295502, 1129233601, 1113547501, 1119826801, 1132519502, 1125298801, 1113289201)
mydates = dts

# POSIXct stores the seconds since a specific date 
# converting the numeric values since January 1st 1970
# POSIXt is the superclass and POSIXct & POSIXlt are its subclasses
# We could use only the subclass here(but not the superclass)
class(mydates) = c('POSIXt', 'POSIXct')
mydates
class(mydates)

mydates = structure(dts, class = c('POSIXt', 'POSIXct'))
mydates
class(mydates)

# ISODate fucntion
b1 = ISOdate(2011, 3, 23)
b1
b2 = ISOdate(2012, 9, 19)
b2
b2 - b1
class(b1)

difftime(b2, b1, units = 'weeks')

# lubridate package
?lubridate
install.packages("lubridate")
require(lubridate)

ymd("20180604")
mdy("06-04-2018")
dmy("04/06/2018")

chegada <- ymd_hms("2016-06-04 12:00:00", tz = "Pacific/Auckland")
partida <- ymd_hms("2011-08-10 14:00:00", tz = "Pacific/Auckland")

chegada
partida

second(chegada)
second(chegada) <- 23
chegada

wday(chegada)
wday(chegada, label = TRUE)
class(chegada)

# Creates an object that specifies the starting and ending day
interval(chegada, partida)

tm1.lub <- ymd_hms("2020-05-24 23:55:26")
tm1.lub

tm2.lub <- mdy_hm("05/25/20 08:32")
tm2.lub

year(tm1.lub)
week(tm1.lub)

tm1.dechr <- hour(tm1.lub) + minute(tm1.lub)/60 + second(tm1.lub)/3600
tm1.dechr
force_tz(tm1.lub, "Pacific/Auckland")

# Generating a dataframe of dates
sono <- data.frame(bed.time = ymd_hms("2013-09-01 23:05:24", "2013-09-02 22:51:09",
                                      "2013-09-04 00:09:16", "2013-09-04 23:43:31", "2013-09-06 00:17:41", "2013-09-06 22:42:27",
                                      "2013-09-08 00:22:27"), rise.time = ymd_hms("2013-09-02 08:03:29", "2013-09-03 07:34:21",
                                                                                  "2013-09-04 07:45:06", "2013-09-05 07:07:17", "2013-09-06 08:17:13", "2013-09-07 06:52:11",
                                                                                  
                                                                                  "2013-09-08 07:15:19"), sleep.time = dhours(c(6.74, 7.92, 7.01, 6.23, 6.34, 7.42, 6.45)))

?dhours
class(dhours(1))
sono
sono$eficiencia <- round(sono$sleep.time/(sono$rise.time - sono$bed.time) * 100, 1)
class(sono$rise.time - sono$bed.time)

# Plotting the dates
par(mar = c(5, 4, 4, 4))
plot(round_date(sono$rise.time, "day"), sono$eficiencia, type = "o", col = "blue", xlab = "Manhã", ylab = NA)
par(new = TRUE)
plot(round_date(sono$rise.time, "day"), sono$sleep.time/3600, type = "o", col = "red", axes = FALSE, ylab = NA, xlab = NA)
axis(side = 4)
mtext(side = 4, line = 2.5, col = "red", "Duração do Sono")
mtext(side = 2, line = 2.5, col = "blue", "Eficiência do Sono")