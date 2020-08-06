#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @importFrom shinyjs hide show
#' @importFrom waiter Waitress waiter_hide Waiter transparent
#' @noRd
app_server <- function( input, output, session ) {
    waitress <- Waitress$new(theme = "line") # call the waitress
    waiter <- Waiter$new(color = transparent(.2),logo="https://raw.githubusercontent.com/Rosalien/doc_snot/master/Figures/logo_Tourbieres.jpg")
    waiter$show()

    for(i in 1:10){
      waitress$inc(10)
      Sys.sleep(.3)
	 }
     waiter_hide() 
     waitress$close() 

     # Hide the loading message when the rest of the server function has executed
     shinyjs::hide(id = "loading-content", anim = TRUE, animType = "fade")    
  	 shinyjs::show("app-content")
	 mod_extractiondataset("mod_extractiondatasetUI_1")
}

