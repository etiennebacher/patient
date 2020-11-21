.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "pace-assets",
    system.file("pace", package = "patient")
  )
}
