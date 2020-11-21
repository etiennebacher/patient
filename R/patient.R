#' Create a loading bar
#'
#' @param theme_name Name of the theme, see the list of choices below.
#' @param theme_color Name of the color, see the list of choices below. It is not possible to specify a color if `theme_name` is `NULL`. If `theme_name` is specified but `theme_color` is `NULL`, the default color is black.
#'
#' @details List of themes:
#'
#' * barber-shop
#' * big-counter
#' * bounce
#' * center-atom
#' * center-circle
#' * center-radar
#' * center-simple
#' * corner-indicator
#' * fill-left
#' * flash
#' * flat-top
#' * loading-bar
#' * mac-osx
#' * material
#' * minimal
#'
#' List of colors:
#'
#' * black
#' * blue
#' * green
#' * orange
#' * pink
#' * purple
#' * red
#' * silver
#' * white
#' * yellow
#'
#' @importFrom jsonlite toJSON
#'
#' @export

use_patient <- function(theme_name = NULL, theme_color = NULL, options = list()) {

  if (is.null(theme_name) && !is.null(theme_color))
    stop("You must specify theme_name in order to use theme_color")

  if (!is.null(theme_name)) {
    if (!is.null(theme_color)) {
      theme <- paste0("themes/", theme_color, "/pace-theme-", theme_name, ".css")
    } else {
      theme <- paste0("themes/black/pace-theme-", theme_name, ".css")
    }
  } else {
    theme <- paste0("pace-theme-default.min.css")
  }

  opts <- jsonlite::toJSON(options)
  opts <- gsub("\\[", "", opts)
  opts <- gsub("\\]", "", opts)


  shiny::singleton(
    shiny::tags$head(
      shiny::tags$link(
        href = paste0("pace-assets/", theme),
        rel= "stylesheet",
        type= "text/css"
      ),
      shiny::tags$script(
        HTML(
          paste0(
            "paceOptions = ", opts
          )
        )
      ),
      shiny::tags$script(
        src = "pace-assets/pace.min.js"
      )
    )
  )
}
