server <- function(input, output) {
  
  # render the scatterplot output ----
  output$penguin_scatterplot_output <- build_penguin_scatterplot(input)
  
  
  # filter penguin species (histogram) ----
  output$penguin_histogram_output <- build_penguin_histogram(input)
  
} # END server