
facilities <- read.csv('./Facilities.csv')
country <- c( 'Japan', 'United States of America', 'Mexico', 
              'Morocco', 'Cuba', 'Poland', 'Singapore', 'Qatar')

facilities_new <- facilities[facilities$Country %in% country,]

summary_info <- list()

summary_info$maxmin_mental <- max(facilities_new$Mental._hospitals)-min(facilities_new$Mental._hospitals)
summary_info$maxmin_health <- max(facilities_new$health_units)-min(facilities_new$health_units)
summary_info$maxmin_facilities <- max(facilities_new$outpatient._facilities)-min(facilities_new$outpatient._facilities)
summary_info$maxmin_day <- max(na.omit(facilities_new$day._treatment))-min(na.omit(facilities_new$day._treatment))
summary_info$maxmin_residential <- max(na.omit(facilities_new$residential_facilities))-min(na.omit(facilities_new$residential_facilities))
