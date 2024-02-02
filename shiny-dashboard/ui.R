# dashboard header ---------------
header <- dashboardHeader(
  
  # title ----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
) #END dashboardHeader

# dashboard sidebar ---------------
sidebar <- dashboardSidebar(
  
  # sidebar ----
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END sidebarMenu

# dashboard body ---------------
body <- dashboardBody(
  
  #set theme ----
  fresh::use_theme("dashboard-fresh-theme.css"),
  
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "welcome",
            
            # lefthand column ----
            column(width = 6,
                   
                   # background info box ----
                   
                   box(width = NULL,
                       
                       title = tagList(icon("water"),
                                       strong("Monitoring Fish Creek Watershed")),
                       includeMarkdown("text/intro.md"),
                       
                       tags$img(src = "FishCreekWatershedSiteMap_2020.jpg",
                                alt = "A map of Northern Alaska, showing Fish Creek Watershed located within the National Petroleum Reserve.",
                                style = "max-width: 100%;"),
                       tags$h6(tags$em("Map Source:", tags$a(href = "fishcreekwatershed.org/", "FCWO")),
                               style = "text-align: center;")
                       
                   ) # END background info box
                   
            ), # END lefthand column
            
            # righthand column ----
            column(width = 6,
                   
                   # first fluid row
                   fluidRow(
                     
                     # citation box ----
                     box(width = NULL,
                         
                         title = tagList(icon("table"),
                                         strong("Data Source")),
                         includeMarkdown("text/citation.md")
                         
                     ) # END citation box
                     
                   ), # END first fluidRow
                   
                   # second fluid row ----
                   fluidRow(
                     
                     # disclaimer box ----
                     box(width = NULL,
                         
                         title = tagList(icon("warning"),
                                         strong("Disclaimer")),
                         includeMarkdown("text/disclaimer.md")
                         
                     ) # END disclaimer box
                     
                   ) # END second fluidRow
                   
            ) # END righthand column
            
    ), # END welcome tabItem
    
    # dashboard tabItem
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4,
                  
                  title = tags$strong("Adjust lake parameter ranges:"),
                  
                  #sliderInputs ----
                  
                  # sliderInput 1
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (m.a.s.l):",
                              min = min(lake_data$Elevation),
                              max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation),
                                        max(lake_data$Elevation))), # END sliderInput 1
                  
                  # sliderInput 2
                  sliderInput(inputId = "avg_depth_slider_input",
                              label = "Average Depth (meters):",
                              min = min(lake_data$AvgDepth),
                              max = max(lake_data$AvgDepth),
                              value = c(min(lake_data$AvgDepth),
                                        max(lake_data$AvgDepth))), # END sliderInput 2
                  
                  # sliderInput 3
                  sliderInput(inputId = "avg_temp_slider_input",
                              label = "Average Temperature (\u00B0C):",
                              min = min(lake_data$AvgTemp),
                              max = max(lake_data$AvgTemp),
                              value = c(min(lake_data$AvgTemp),
                                        max(lake_data$AvgTemp))) # END sliderInput 3
                  
              ), # END input box
              
              # map box ----
              box(width = 8,
                  
                  title = strong("Monitoring lakes within Fish Creek Watershed:"),
                  
                  # leaflet output ----
                  leafletOutput(outputId = "lake_map_output") %>% 
                    withSpinner(type = 1, color = "#4287f5")
                  
              ) # END map box
              
            ), # END fluidRow
            
    ) #END dashboard tabItem
    
  ) # END tabItems
  
)

# combine all into a dashboard page --------
dashboardPage(header, sidebar, body)
