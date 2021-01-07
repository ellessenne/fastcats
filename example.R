test_map <- list(
  ami = c("I21", "I22", "I252"),
  chf = c("I099", "I110", "I130", "I132", "I255", "I420", "I425", "I426", "I427", "I428", "I429", "I43", "I50", "P290"),
  pvd = c("I70", "I71", "I731", "I738", "I739", "I771", "I790", "I792", "K551", "K558", "K559", "Z958", "Z959")
)

# load the comorbidity package
library(comorbidity)
set.seed(1)
nn <- 1000
x <- data.frame(
  id = sample(1:3, size = 1000, replace = TRUE),
  code = sample_diag(n = 1000)
)

charlson <- comorbidity(x = x, id = "id", code = "code", score = "charlson", icd = "icd10", assign0 = "none")
charlson[, c("ami", "chf", "pvd")] == 1
# this returns a data.frame

fastcats:::mat_mul_wide_rcpp(data = x, map = test_map, id_name = "id", code_names = "code", validate = FALSE)
# this returns a matrix

### they seem to correspond --> good!
