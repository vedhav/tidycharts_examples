library(tidycharts)
library(shiny)

ui <- fluidPage(
  title = "Example of tidycharts | vedha.space",
  tags$head(
    tags$link(rel = "shortcut icon", type = "image/png", href = "vedha_space.png"),
    tags$script("", src = 'https://www.googletagmanager.com/gtag/js?id=UA-151532997-3'),
    tags$script(
      "window.dataLayer = window.dataLayer || [];
			function gtag(){dataLayer.push(arguments);}
			gtag('js', new Date());
			gtag('config', 'UA-151532997-3');"
    )
  ),
  conditionalPanel(
    condition = "$('html').hasClass('shiny-busy')",
    tags$div(
      style = "position: fixed;top: 250px; left: 0px; width: 100%;
			padding: 5px 0px 5px 0px; text-align: center; font-weight: bold;
			font-size: 300%; color: #ffffff; background-color:'transparent'; z-index: 105;",
      tags$img(src = "loading_icon.svg", height = "200px", width = "200px")
    )
  ),
  fluidRow(align = "center", tags$h2("Dumbbell chart")),
  fluidRow(
    column(
      6,
      fluidRow(plotlyOutput("dumbbell_chart_plot_1")),
      fluidRow(verbatimTextOutput("dumbbell_chart_code_1"))
    ),
    column(
      6,
      fluidRow(plotlyOutput("dumbbell_chart_plot_2")),
      fluidRow(verbatimTextOutput("dumbbell_chart_code_2"))
    )
  ),
  fluidRow(align = "center", tags$h2("Lollipop chart")),
  fluidRow(
    column(
      6,
      fluidRow(plotlyOutput("lollipop_chart_plot_1")),
      fluidRow(verbatimTextOutput("lollipop_chart_code_1"))
    ),
    column(
      6,
      fluidRow(plotlyOutput("lollipop_chart_plot_2")),
      fluidRow(verbatimTextOutput("lollipop_chart_code_2"))
    )
  ),
  fluidRow(align = "center", tags$h2("Factor scatter plot")),
  fluidRow(
    column(
      6,
      fluidRow(plotlyOutput("factor_scatter_chart_plot_1")),
      fluidRow(verbatimTextOutput("factor_scatter_chart_code_1"))
    ),
    column(
      6,
      fluidRow(plotlyOutput("factor_scatter_chart_plot_2")),
      fluidRow(verbatimTextOutput("factor_scatter_chart_code_2"))
    )
  ),
  fluidRow(align = "center", tags$h2("Numeric scatter plot")),
  fluidRow(
    column(
      6,
      fluidRow(plotlyOutput("numeric_scatter_chart_plot_1")),
      fluidRow(verbatimTextOutput("numeric_scatter_chart_code_1"))
    ),
    column(
      6,
      fluidRow(plotlyOutput("numeric_scatter_chart_plot_2")),
      fluidRow(verbatimTextOutput("numeric_scatter_chart_code_2"))
    )
  )
)

server <- function(input, output, session) {
  data("tidychartsdata")
  output$dumbbell_chart_plot_1 <- renderPlotly({ dumbbell_chart(gender_school_earnings, Men, Women, School) })
  output$dumbbell_chart_code_1 <- renderText({ "dumbbell_chart(gender_school_earnings, Men, Women, School)" })
  output$dumbbell_chart_plot_2 <- renderPlotly({dumbbell_chart(gender_school_earnings, Men, Women, School, line_color = "#6ba1e8", x1_color = "#4c7ced", x2_color = "#a7d1eb") })
  output$dumbbell_chart_code_2 <- renderText({ 'dumbbell_chart(gender_school_earnings, Men, Women, School, line_color = "#6ba1e8", x1_color = "#4c7ced", x2_color = "#a7d1eb")' })
  
  output$lollipop_chart_plot_1 <- renderPlotly({ lollipop_chart(gender_school_earnings, Men, School) })
  output$lollipop_chart_code_1 <- renderText({ "lollipop_chart(gender_school_earnings, Men, School)" })
  output$lollipop_chart_plot_2 <- renderPlotly({ lollipop_chart(gender_school_earnings, Men, School, line_color = "#afdeb5", x_color = "#4dbd5b") })
  output$lollipop_chart_code_2 <- renderText({ 'lollipop_chart(gender_school_earnings, Men, School, line_color = "#afdeb5", x_color = "#4dbd5b")' })
  
  output$factor_scatter_chart_plot_1 <- renderPlotly({ factor_scatter_chart(marks_data, marks, name) })
  output$factor_scatter_chart_code_1 <- renderText({ "factor_scatter_chart(marks_data, marks, name)" })
  output$factor_scatter_chart_plot_2 <- renderPlotly({ factor_scatter_chart(marks_data, marks, name, subject) })
  output$factor_scatter_chart_code_2 <- renderText({ "factor_scatter_chart(marks_data, marks, name, subject)" })
  
  output$numeric_scatter_chart_plot_1 <- renderPlotly({ numeric_scatter_chart(iris, Sepal.Length, Petal.Length) })
  output$numeric_scatter_chart_code_1 <- renderText({ "numeric_scatter_chart(iris, Sepal.Length, Petal.Length)" })
  output$numeric_scatter_chart_plot_2 <- renderPlotly({ numeric_scatter_chart(iris, Sepal.Length, Petal.Length, color_name = Species) })
  output$numeric_scatter_chart_code_2 <- renderText({ "numeric_scatter_chart(iris, Sepal.Length, Petal.Length, color_name = Species)" })
}

shinyApp(ui, server)

