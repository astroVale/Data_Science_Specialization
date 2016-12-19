rankall <- function(outcome, num = "best") {
        
        # outcome argument indicates outcome name.
        # num argument indicates the ranking of a hospital in that state for the given outcome (either the best or worst state)
        # Returns hospital names and 2-character state abbreviation for all 50 states.
        
        # Read outcome data
        data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
        data <- data[, c(7, 2, 11, 17, 23)]
        colnames(data) <- c("state",
                            "hospital_name",
                            "heart_attack",
                            "heart_failure",
                            "pneumonia")
        for(i in seq.int(3,5)) {
                suppressWarnings(data[, i] <- as.numeric(data[, i]))
        }
        
        # Validate outcome
        outcome <- as.character(outcome)
        if (!(sub(" ", "_", outcome, fixed = TRUE) %in% colnames(data)[seq(3,5)])) {
                stop("invalid outcome")
        }
        # Validate num
        if (class(num) == "character") {
                if (!(num %in% c("best", "worst"))) {
                        stop("invalid num")
                }
        }
        # Initialize empty vectors for data frame
        df.hospital <- character(0)
        df.state <- character(0)
        # For each state, find the hospital of the given rank for given outcome
        col <- sub(" ", "_", outcome, fixed = TRUE)
        for (state in sort(unique(as.character(data$state))))
        {
                x <- data[data$state == state, ]
                y <- x[order(x[, col], x$hospital_name, na.last = NA), ]
                
                if (class(num) == "character") {
                        if (num == "best") {
                                this.num <- 1
                        } else {
                                this.num <- nrow(y)
                        }
                } else {
                        this.num <- num
                }
                
                if (this.num > nrow(y)) {
                        this.hospital <- NA
                } else {
                        this.hospital <- y$hospital[this.num]
                }
                
                df.hospital <- c(df.hospital, this.hospital)
                df.state <- c(df.state, state)
        }
        # Return a data frame
        output <- data.frame(hospital = df.hospital, state = df.state)
}