pkg_file <- function(..., package = "rmarkdown", mustWork = FALSE) {
  if (devtools_loaded(package)) {
    # used only if package has been loaded with devtools or pkgload
    file.path(find.package(package), "inst", ...)
  } else {
    system.file(..., package = package, mustWork = mustWork)
  }
}

devtools_loaded <- function(x) {
  if (!x %in% loadedNamespaces()) {
    return(FALSE)
  }
  ns <- .getNamespace(x)
  !is.null(ns$.__DEVTOOLS__)
}

# test if all paths in x are directories
dir_exists <- function(x) {
  length(x) > 0 && utils::file_test('-d', x)
}

# in a future version of yaml, it will disable the evaluation of !expr but we
# still need it (https://github.com/rstudio/rmarkdown/issues/1387)
yaml_load <- function(...) yaml::yaml.load(..., eval.expr = TRUE)

yaml_load_file <- function(input, ...) yaml_load(read_utf8(input), ...)

read_utf8 <- function(file) {
  if (inherits(file, 'connection')) con <- file else {
    con <- base::file(file, encoding = 'UTF-8'); on.exit(close(con), add = TRUE)
  }
  enc2utf8(readLines(con, warn = FALSE))
}