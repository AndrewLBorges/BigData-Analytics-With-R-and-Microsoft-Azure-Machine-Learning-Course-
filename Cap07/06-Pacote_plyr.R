install.packages("plyr")
install.packages("gapminder")
# https://www.gaminder.org

library(plyr)
library(gapminder)
?gapminder

# Split-Apply-Combine
?ddply
df <- ddply(gapminder, ~ continent,
            summarize,
            max_le = max(lifeExp))

str(df)
head(df)
View(df)
levels(df$continent)

# Split-Apply-COmbine
ddply(gapminder, ~ continent,
      summarize,
      n_uniq_countries = length(unique(country)))

ddply(gapminder, ~ continent,
      function(x) c(n_unique_countries = length(unique(x$country))))

ddply(gapminder, ~ continent,
      summarize,
      min = min(lifeExp),
      max = max(lifeExp),
      median = median(gdpPercap))

# using a ggplot dataset
install.packages("ggplot2")
library(ggplot2)
str(mpg)
?mpg

# working with a subset
data <- mpg[, c(1,7:9)]
str(data)

# summarizing and aggregating 
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty))

ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))

ddply(data, .(manufacturer, drv),
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))
