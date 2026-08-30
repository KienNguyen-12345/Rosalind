seq <- "ATAGCCGA"
gc_prob <- 0.6
no_random_string <- 9000

bases <- strsplit(seq, "")[[1]]

gc_count <- sum(bases %in% c("G","C"))
at_count <- length(bases) - gc_count

#Solve question 1: what is the chance of 1 random string = "seq"
q_1 <- ((1-gc_prob)/2)^at_count * ((gc_prob)/2)^gc_count 

##Solve question 2: what is the chance of non of the strings = "seq"
