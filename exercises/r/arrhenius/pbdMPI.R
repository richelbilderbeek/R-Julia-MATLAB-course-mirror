library(pbdMPI)

ns <- comm.size()

# Tell all R sessions to return a message identifying themselves
id <- comm.rank()
ns <- comm.size()
host <- system("hostname", intern = TRUE)
comm.cat("I am", id, "on", host, "of", ns, "\n", all.rank = TRUE)

# Test computations
x <- 5
x <- rnorm(x)
comm.print(length(x))
comm.print(x, all.rank = TRUE)

finalize()
