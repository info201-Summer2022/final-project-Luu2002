
age <- read.csv('./Age.csv')
country <- c( 'Japan', 'United States of America', 'Mexico', 
              'Morocco', 'Cuba', 'Poland', 'Singapore', 'Qatar')
age_filter <- age[age$Location %in% country,]
summary_info <- list()

summary_info$num_observations <- nrow(age)
summary_info$max_value <- max(age_filter$Value)
summary_info$min_value <- min(age_filter$Value)
summary_info$mean_value <- mean(age_filter$Value)
summary_info$median_value <- median(age_filter$Value)