# user interface ----
ui <- navbarPage(
  
  theme = "shiny-fresh-theme.css",
  
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About this page",
           
           # intro text fluidRow ----
           fluidRow(
             
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)
             
           ), # END intro text fluidRow
           
           # add gray bar to separate footer ----
           hr(),
           
           # add footer text ----
           includeMarkdown("text/footer.md")
           
           
  ), # END (Page 1) intro tabPanel
  
  # (page 2) data viz tabPanel ----
  tabPanel(title = "Explore the data",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebarPanel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      selected = c("cascade", "pool"),
                                      options = pickerOptions(actionsBox = TRUE),
                                      multiple = TRUE
                                      ), # END channel type pickerInput
                          
                          # section checkboxGroupButtons ----
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select sampling section(s):",
                                               choices = c("clear cut forest", "old growth forest"),
                                               selected = c("clear cut forest", "old growth forest"),
                                               individual = FALSE,
                                               justified = TRUE,
                                               size = "sm",
                                               checkIcon = list(yes = icon("check"),
                                                                no = icon("xmark"))
                                               ) # END section checkboxGroupButtons
                          
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          # trout scatterplot output
                          plotOutput(outputId = "trout_scatterplot_output") %>% 
                            withSpinner(color = "magenta", type = 1) # END trout scatterplot output
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguin tabPanel ----
             tabPanel(title = "Penguins", 
                      
                      # penguins sidebarLayout ----
                      sidebarLayout(
                        
                        # penguins sidebarPanel ----
                        sidebarPanel(
                          
                          # island pickerInput ----
                          pickerInput(inputId = "penguin_island_input",
                                      label = "Select island(s):",
                                      choices = unique(penguins$island),
                                      selected = unique(penguins$island),
                                      options = pickerOptions(actionsBox = TRUE),
                                      multiple = TRUE
                          ), # END island pickerInput
                          
                          # bin number sliderInput ----
                          sliderInput(inputId = "penguin_bins_input",
                                      label = "Select number of bin(s):",
                                      min = 1,max = 100,
                                      value = 25) # END bin number sliderInput
                          
                        ), # END sidebarPanel
                        
                        # penguins mainPanel ----
                        mainPanel(
                          
                          # penguins histogram output ----
                          plotOutput(outputId = "penguin_histogram_output") %>% 
                            withSpinner(color = "darkgreen", type = 4, size = 2)# END penguin histogram output
                          
                        ) # END penguins mainPanel
                        
                      ) # END sidebarLayout
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END (Page 2) data viz tabPanel
  
) # END nav bar page

