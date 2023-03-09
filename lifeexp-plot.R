#Graph life expenctancy v.GDP
#Rachel Hansen
#rachelhansen@arizona.edu
#2023 01 31

#read in gapminder data
all_gapminder <- read.csv(file = "data/gapminder-FiveYearData.csv",
                          stringsAsFactors = TRUE)

#subset data for 2002
gapminder <- all_gapminder[all_gapminder$year %in% c(2002,2007), ]
head(gapminder)

#make a new column of log GDP
gapminder$logGDP <- log10(gapminder$gdpPercap)
head(gapminder)

#Create new column for colors
gapminder$colors <- NA

#assign colors based on continent
gapminder$colors[gapminder$continent == "Africa"] <- "red"
gapminder$colors[gapminder$continent == "Americas"] <- "orange"
gapminder$colors[gapminder$continent == "Asia"] <- "forestgreen"
gapminder$colors[gapminder$continent == "Europe"] <- "purple"
  gapminder$colors[gapminder$continent == "Oceania"] <- "indianred3"

plot(x = gapminder$logGDP, 
     y = gapminder$lifeExp,
     main = "life expecancy vs GDP",
     xlab = "log10 GDP per capita",
     ylab = "life expectancy (years)",
     col = gapminder$colors,
     pch = 18)

legend("topleft",
       legend = levels(gapminder$continent),
       col = c('red', 'orange', 'forestgreen', 'purple', 'indianred3'),
       pch = 18)
