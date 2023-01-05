
library(dslabs)
data(murders)
head(murders)

library(tidyverse)
library(ggthemes)
library(ggrepel)

r <- murders %>%
  summarize(pop=sum(population), tot=sum(total)) %>%
  mutate(rate = tot/pop*10^6) %>% pull(rate)

murders %>% ggplot(aes(x = population/10^6, y = total, label = abb)) +
  geom_abline(intercept = log10(r), lty=2, col="darkgrey") +
  geom_point(aes(color=region), size = 3) +
  geom_text_repel() +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Populations in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010") +
  scale_color_discrete(name="Region") +
  theme_economist_white()

#knitr::include_graphics(file.path(img_path,"wsj-vaccines.png"))
data(us_contagious_diseases)
the_disease <- "Measles"
dat <- us_contagious_diseases %>%
  filter(!state%in%c("Hawaii","Alaska") & disease == the_disease) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting) %>%
  mutate(state = reorder(state, rate))

jet.colors <-
colorRampPalette(c("#F0FFFF", "cyan", "#007FFF", "yellow", "#FFBF00", "orange", "red", "#7F0000"), bias = 2.25)

dat %>% ggplot(aes(year, state, fill = rate)) +
  geom_tile(color = "white", size=0.35) +
  scale_x_continuous(expand=c(0,0)) +
  scale_fill_gradientn(colors = jet.colors(16), na.value = 'white') +
  geom_vline(xintercept=1963, col = "black") +
  theme_minimal() +
  theme(panel.grid = element_blank()) +
  coord_cartesian(clip = 'off') +
  ggtitle(the_disease) +
  ylab("") +
  xlab("") +
  theme(legend.position = "bottom", text = element_text(size = 8)) +
  annotate(geom = "text", x = 1963, y = 50.5, label = "Vaccine introduced", size = 3, hjust=0)

#knitr::include_graphics(file.path(img_path,"nythist.png"))
data("nyc_regents_scores")
nyc_regents_scores$total <- rowSums(nyc_regents_scores[,-1], na.rm=TRUE)

nyc_regents_scores %>%
  filter(!is.na(score)) %>%
  ggplot(aes(score, total)) +
  annotate("rect", xmin = 65, xmax = 99, ymin = 0, ymax = 35000, alpha = .5) +
  geom_bar(stat = "identity", color = "black", fill = "#C4843C") +
  annotate("text", x = 66, y = 28000, label = "MINIMUM\nREGENTS DIPLOMA\nSCORE IS 65", hjust = 0, size = 3) +
  annotate("text", x = 0, y = 12000, label = "2010 Regents scores on\nthe five most common tests", hjust = 0, size = 3) +
  scale_x_continuous(breaks = seq(5, 95, 5), limit = c(0,99)) +
  scale_y_continuous(position = "right") +
  ggtitle("Scraping by") +
  xlab("") + ylab("Number of tests") +
  theme_minimal() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        axis.ticks.length = unit(-0.2, "cm"),
        plot.title = element_text(face = "bold"))

data(gapminder)

west <- c("Western Europe","Northern Europe","Southern Europe",
          "Northern America","Australia and New Zealand")

gapminder <- gapminder %>%
  mutate(group = case_when(
    region %in% west ~ "The West",
    region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    region %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
    continent == "Africa" & region != "Northern Africa" ~ "Sub-Saharan Africa",
    TRUE ~ "Others"))
gapminder <- gapminder %>%
  mutate(group = factor(group, levels = rev(c("Others", "Latin America", "East Asia","Sub-Saharan Africa", "The West"))))

years <- c(1962, 2013)
p <- filter(gapminder, year%in%years & !is.na(group) &
         !is.na(fertility) & !is.na(life_expectancy)) %>%
  mutate(population_in_millions = population/10^6) %>%
  ggplot( aes(fertility, y=life_expectancy, col = group, size = population_in_millions)) +
  geom_point(alpha = 0.8) +
  guides(size=FALSE) +
  theme(plot.title = element_blank(), legend.title = element_blank()) +
  coord_cartesian(ylim = c(30, 85)) +
  xlab("Fertility rate (births per woman)") +
  ylab("Life Expectancy") +
  geom_text(aes(x=7, y=82, label=year), cex=12, color="grey") +
  facet_grid(. ~ year)

p + theme(strip.background = element_blank(),
    strip.text.x = element_blank(),
   strip.text.y = element_blank(),
   legend.position = "top")

library(dplyr)
library(ggplot2)

library(dslabs)
data(murders)
library(ggthemes)
library(ggrepel)

r <- murders %>%
  summarize(pop=sum(population), tot=sum(total)) %>%
  mutate(rate = tot/pop*10^6) %>% pull(rate)

murders %>% ggplot(aes(x = population/10^6, y = total, label = abb)) +
  geom_abline(intercept = log10(r), lty=2, col="darkgrey") +
  geom_point(aes(color=region), size = 3) +
  geom_text_repel() +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Populations in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010") +
  scale_color_discrete(name="Region") +
  theme_economist_white()

library(dslabs)
data(murders)

## theme_set(theme_grey()) ## to imitate what happens with setting theme

## ggplot(data = murders)

murders %>% ggplot()

p <- ggplot(data = murders)
class(p)

## print(p)
## p

## murders %>% ggplot() +
##   geom_point(aes(x = population/10^6, y = total))

p + geom_point(aes(x = population/10^6, y = total))

p + geom_point(aes(x = population/10^6, y = total), size = 3)

p + geom_point(aes(x = population/10^6, y = total), size = 3, shape = 17)

p + geom_point(aes(x = population/10^6, y = total), size = 4, shape = 23, fill = '#18453B')

p + geom_point(aes(x = population/10^6, y = total), size = 5, shape = 23, fill = '#18453B', color = 'white')

p + geom_point(aes(x = population/10^6, y = total, color = region), size = 3)

p + geom_point(aes(x = population/10^5, y = total, color = 100*total/population), size = 3)

p + geom_point(aes(x = population/10^6, y = total, color = region, size = population/10^6))

p + geom_point(aes(x = population/10^6, y = total, color = region, size = population/10^6), show.legend = FALSE)

p + geom_point(aes(x = population/10^6, y = total)) +
  geom_text(aes(x = population/10^6, y = total, label = abb))

## p + geom_point(aes(x = population/10^6, y = total)) +
##   geom_text(aes(population/10^6, total, label = abb))

## p + geom_point(aes(x = population/10^6, y = total)) +
##   geom_text(aes(population/10^6, total), label = abb)

p + geom_point(aes(x = population/10^6, y = total)) +
  geom_text(aes(population/10^6, total), label = 'abb')

args(ggplot)

p <- murders %>% ggplot(aes(x = population/10^6, y = total, label = abb))

## p + geom_point(size = 3) +
##   geom_text(nudge_x = 1.5) # offsets the label

p + geom_point(size = 3) +
  geom_text(aes(x = 10, y = 800, label = "Hello there!"))
