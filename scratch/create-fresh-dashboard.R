library(fresh)

create_theme(
  
  adminlte_color(
    
    light_blue = "darkblue"
    
  ),
  
  adminlte_global(
    
    content_bg = "pink"
    
  ),
  
  adminlte_sidebar(
    
    width = '400px',
    dark_bg = "lightblue",
    dark_hover_bg = 'magenta',
    dark_color = "red"
    
  ),
  
  output_file = 'shiny-dashboard/www/dashboard-fresh-theme.css'
  
)
