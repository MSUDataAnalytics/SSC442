


## Data wrangling Example construction
## 
## 
## 3 data sets to process and merge
## ## First is a list of all Corporate bookings at a hotel. Room type, date (1 obs for each nights stay), employee ID
## ## Second is a list of all room rates, wide, with each date in a column and a row corresponding to room type
## ## Third is a list of all corporations with free parking





#### List of all corporate bookings at a hotel:
#### 
require(lubridate)
require(zoo)
# require(timeDate)
require(tidyverse)
set.seed(2021)

NC = 5
NN = 500
corps = LETTERS[1:NC]
roomtype = c('single','double','suite','royalsuite','economy')
roomrates_dates = tibble(date_occupied = seq.Date(from = make_date(2015, 1, 1), to = make_date(2020, 12, 31), by = '1 day'),
                         weekend_up = weekdays(date_occupied) %in% c('Friday','Saturday'),
                         month_up = month(date_occupied) %in% c(12, 6, 7, 8),
                         period_up = month(date_occupied)==11 & year(date_occupied)==2020,
                         price_single = 100 + rnorm(length(date_occupied), 0, 15) + 50*period_up + 70*month_up + 100*weekend_up,
                         price_double = 180 + rnorm(length(date_occupied), 0, 15) + 50*period_up + 70*month_up + 100*weekend_up,
                         price_suite = 400 + rnorm(length(date_occupied), 0, 100) + 100*period_up + 100*month_up + 200*weekend_up,
                         price_royalsuite = 700 + rnorm(length(date_occupied), 0, 120) + 100*period_up + 100*month_up + 200*weekend_up,
                         price_economy = 75 + rnorm(length(date_occupied), 0, 10) + 50*period_up + 30*month_up + 50*weekend_up,
                         id = 1) %>%
  dplyr::select(-ends_with('_up'))#, wday = c(7, 1:4)))



parking = tibble(corp = corps,
                 FreeParking = c(T,T,F,T,F)) 





books = data.frame(
  corp = sample(corps, NN, replace = T),
  StayID = 1:NN,
  room = sample(roomtype, size = NN, replace = T, prob=c(.5, .2, .1, .03, .17)),
  stay_start = sample(seq.Date(from = make_date(2015, 1, 1), to = make_date(2020, 12, 31), by = '1 day'), replace = T, size = NN),
  length = pmax(rpois(NN, 3), 1)
)

books$room_use = paste0(books$room, '_room')
books$room_use[books$room_use=='royalsuite_room'] = 'royalsuite'
books = as_tibble(books)
books$stay_dates = mapply(function(std, ll) (tibble(date_occupied = seq.Date(from = std, to = std+days(ll), by = '1 day'))),
                          books$stay_start, books$length, SIMPLIFY=FALSE)

books = unnest(books, cols = stay_dates)

books2 = books %>%
  left_join(roomrates_dates, by = 'date_occupied') %>%
  left_join(parking, by = 'corp') %>%
  dplyr::mutate(Amount = case_when(
    room_use=='economy_room' ~ price_economy + 60*(!FreeParking),
    room_use=='single_room' ~ price_single + 60*(!FreeParking),
    room_use=='royalsuite' ~ price_royalsuite + 60*(!FreeParking),
    room_use=='double_room' ~ price_double + 60*(!FreeParking),
    room_use=='suite_room' ~ price_suite + 60*(!FreeParking),
    TRUE ~ as.numeric(NA)))




books_use = books2 %>%
  dplyr::select(corp, StayID, room_use, date_occupied)

parking_use = parking %>%
  dplyr::filter(FreeParking==T)

roomrates_use = roomrates_dates %>%
  pivot_wider(id_cols = id, names_from = date_occupied, values_from =  price_single:price_economy) %>%
  dplyr::select(-1)

write.csv(books_use, file.path('C:/Users/jkirk/OneDrive - Michigan State University','Teaching','SSC442_SS21','static','data','Example11_booking.csv'), row.names = F)
write.csv(parking_use, file.path('C:/Users/jkirk/OneDrive - Michigan State University','Teaching','SSC442_SS21','static','data','Example11_parking.csv'), row.names = F)
write.csv(roomrates_use, file.path('C:/Users/jkirk/OneDrive - Michigan State University','Teaching','SSC442_SS21','static','data','Example11_roomrates.csv'), row.names = F)

# students are to use the three datasets to answer the question: which corporation spends the most with the hotel?
# 
# books_use has the data on bookings but has no prices
# roomrates_use has the data on room prices, but in wide format (and with tricky column names)
# parking_use has the data on which ones have free parking (but missing any who don't so NA's in merge)
# 
