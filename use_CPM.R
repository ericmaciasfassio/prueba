if (require(evamtools))

#IMPORTANT: SET CORES AND THREADS  
    
use_CPM <-function(x) {
        CPMs <-evam(x, 
               methods = c("CBN", "OT", "HESBCN", "MHN", "OncoBN"),
               #cores = detectCores(),
               mhn_opts = list(lambda = 1/nrow(x),  
                                omp_threads = 1),
              ot_opts = list(with_errors_dist_ot = TRUE),
              cbn_opts = list(
                            omp_threads = 1,
                            init_poset = "OT"   #the other option is "linear"
                            ),
              hesbcn_opts = list(
                            steps = 100000,  
                            seed = NULL,
                            reg = "bic",
                            silent = TRUE
                            ),
              oncobn_opts = list(    
                            model = "DBN",
                            algorithm = "DP",
                            k = 3,
                            epsilon = min(colMeans(x)/2),
                            silent = TRUE
                            ),
             
        )}


