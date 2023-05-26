if (!require("remotes")) {
  install.packages("remotes")
}
# on 64-bit Windows
remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"), INSTALL_opts = "--no-multiarch")


f <- system.file("examples", "data.pdf", package = "tabulizer")
out1 <- extract_tables(f)
str(out1)

out2 <- extract_tables(f, pages = 1, guess = FALSE, output = "data.frame")
str(out2)
out2[[1]]

out1 <- extract_tables("./kvk/2022EP06 SBI Structuur.pdf")
str(out1)

out2 <- extract_tables("./kvk/2022EP06 SBI Structuur.pdf", 
                       pages = 8, guess = F, output = "data.frame")
out2[[1]]


out3[[1]]

library(dplyr)
library(tabulizer)
result <- tibble()
for (i in c(8:43)) {
  tmp <- extract_tables("./kvk/2022EP06 SBI Structuur.pdf", 
                         pages = i, guess = F, output = "data.frame") %>%
    .[[1]] %>%
    select(X) %>%
    filter(! X == "") %>%
    filter(! X == "Standaard Bedrijfsindeling SBI 2008 - versie 2018 update 2022") %>%
    filter(! X == "Code Titel")
  result <- result %>% bind_rows(tmp)
}

result <- result %>% mutate(Titel = gsub('[[:digit:]]+', '', X)) %>% 
  mutate(Titel = trimws(Titel)) %>% 
  mutate(Code = gsub('[^[:digit:]]+', '', X))
