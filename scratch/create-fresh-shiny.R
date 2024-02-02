library(fresh)

create_theme(
  
  theme = "default",
  
  bs_vars_global(
    
    body_bg = "maroon",
    
    text_color = "white",
    
    link_color = "darkblue"
    
  ),
  
  bs_vars_navbar(
    
    default_bg = "limegreen",
    
    default_color = "darkgray"
    
  ),
  
  bs_vars_tabs(
    
    border_color = "darkorange"
    
  ),
  
  output_file = "two-file-app/www/shiny-fresh-theme.css"
  
)
