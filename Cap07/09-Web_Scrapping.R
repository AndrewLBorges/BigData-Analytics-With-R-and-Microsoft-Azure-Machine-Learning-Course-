# R packages for Web Scrapping
# RCurl
# httr
# XML
# rvest

# rvest package - useful for who doesnt know HTML or CSS
install.packages('rvest')
library(rvest)

library(stringr)
library(dplyr)
library(lubridate)
library(readr)
library(xml2)

webpage <- read_html("https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html")
webpage

# Extracting registers
# each element in the web page has the following format in html:
# <span class="short-desc"><strong> DATE </string> LIE <span class="short-truth"><a href="URL"> EXPLANATION </a></span></span>
?html_nodes
?html_elements
results <- webpage %>% html_elements(".short-desc")
results

# making the dataset
records <- vector("list", length = length(results))

?xml_contents
for (i in seq_along(results)) {
  date <- str_c(results[i] %>%
                  html_elements("strong") %>%
                  html_text(trim = TRUE), ', 2017')
  lie <- str_sub(xml_contents(results[i])[2] %>% html_text(trim = TRUE), 2, -2)
  explanation <- str_sub(results[i] %>%
                           html_elements(".short-truth") %>%
                           html_text(trim = TRUE), 2, -2)
  url <- results[i] %>% html_elements("a") %>% html_attr("href")
  records[[i]] <- tibble(date = date, lie = lie, explanation = explanation, url = url)
}
records[[1]][[3]]

# Final dataset
df <- bind_rows(records)

# transforming the date field to R Date format
df$date <- mdy(df$date)

# Exporting
write_csv(df, "mentiras_trump.csv")

# reading the data
df <- read_csv("mentiras_trump.csv")
View(df)
