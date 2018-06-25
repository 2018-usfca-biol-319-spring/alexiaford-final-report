# script to aggregate NEON tempterature data to 1 hour resolution
# Naupaka Zimmerman
# April 26, 2018
# nzimmerman@usfca.edu

# load libraries
library(tidyverse)
library(lubridate)

# read in 30 minute resolution csv (~280 MB)
temp_in <- read_csv("./IRBT_30_minute.csv")

# select columns of interest and group by hour
# write out csv when finished
temp_in %>%
    select(1,2,5:12) %>%
    mutate(startDateTime = as.POSIXct(startDateTime)) %>%
    group_by(domainID,
             siteID,
             year(startDateTime),
             month(startDateTime),
             day(startDateTime),
             hour(startDateTime)) %>%
    summarize_at(vars(starts_with("bioTemp")), mean, na.rm = TRUE) %>%
    write.csv("neon_hourly_temp.csv",
              row.names = FALSE)

# read in csv and fix column names
temp_in <- read_csv("./neon_hourly_temp.csv")
names(temp_in)[3:6] <- c("year", "month", "day", "hour")

# write out again
write.csv(temp_in,
          "neon_hourly_temp.csv",
          row.names = FALSE)

# example plot - in order to make lines connect appropriately
# the group option is needed
ggplot(temp_in, aes(x = hour,
                    y = bioTempMean,
                    group = interaction(siteID, year, month, day))) +
  geom_line(alpha = 0.01) # alpha sets transparency
