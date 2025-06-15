library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)

# --- CHARGEMENT DES DONNÉES ---

load_wine_data <- function(file_path, wine_type) {
  df <- read_csv(file_path, show_col_types = FALSE)
  df$Type <- wine_type
  return(df)
}

red <- load_wine_data("../data/Red_Weather.csv", "Rouge")
white <- load_wine_data("../data/White_Weather.csv", "Blanc")
rose <- load_wine_data("../data/Rose_Weather.csv", "Rosé")
sparkling <- load_wine_data("../data/Sparkling_Weather.csv", "Effervescent")

# --- Données Graphique 1 ---

wines_fusionne_1 <- bind_rows(
  red %>% mutate(Type = "Red"),
  white %>% mutate(Type = "White"),
  rose %>% mutate(Type = "Rosé"),
  sparkling %>% mutate(Type = "Sparkling")
)

months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
tavg_cols <- paste0(months, "_tavg")
selected_cols <- c("Type", "Rating", "Price", "Year", tavg_cols)

wines_fusionne_1 <- wines_fusionne_1 %>%
  select(all_of(selected_cols)) %>%
  mutate(
    Spring_tavg = (Mar_tavg + Apr_tavg + May_tavg) / 3,
    Summer_tavg = (Jun_tavg + Jul_tavg + Aug_tavg) / 3,
    Autumn_tavg = (Sep_tavg + Oct_tavg + Nov_tavg) / 3,
    Winter_tavg = (Dec_tavg + Jan_tavg + Feb_tavg) / 3
  )

# --- Données Graphique 2 ---

wines_fusionne_2 <- bind_rows(red, white, rose, sparkling) %>%
  mutate(
    Temp_Annuel   = rowMeans(select(., ends_with("tavg")), na.rm = TRUE),
    Precip_Annuel = rowSums(select(., ends_with("prcp")), na.rm = TRUE)
  )

temp_moyenne <- wines_fusionne_2 %>%
  group_by(Country, Year) %>%
  summarise(
    Temp_Moyenne = mean(Temp_Annuel, na.rm = TRUE),
    .groups = "drop"
  )

variation_temp <- temp_moyenne %>%
  group_by(Country) %>%
  summarise(
    Temp_ancienne = mean(Temp_Moyenne[Year <= 2000], na.rm = TRUE),
    Temp_recent   = mean(Temp_Moyenne[Year >= 2010], na.rm = TRUE),
    Diff          = Temp_recent - Temp_ancienne,
    .groups = "drop"
  ) %>%
  arrange(desc(Diff))

top_pays <- variation_temp %>%
  slice_head(n = 5) %>%
  pull(Country)

wines_top_pays <- wines_fusionne_2 %>%
  filter(Country %in% top_pays)

# --- Données Graphique 3 ---

all_wines <- bind_rows(red, rose, sparkling, white)

calculate_climate_index <- function(data) {
  data %>%
    group_by(Year, Type) %>%
    summarise(
      temp_moy = mean(c(Jan_tavg, Feb_tavg, Mar_tavg, Apr_tavg, May_tavg, Jun_tavg,
                        Jul_tavg, Aug_tavg, Sep_tavg, Oct_tavg, Nov_tavg, Dec_tavg), na.rm = TRUE),
      prcp_critique = mean(c(May_prcp, Jun_prcp, Sep_prcp, Oct_prcp), na.rm = TRUE),
      ensol_maturation = mean(c(Jul_tsun, Aug_tsun, Sep_tsun), na.rm = TRUE),
      note_moyenne = mean(Rating, na.rm = TRUE),
      n_vins = n(),
      .groups = "drop"
    ) %>%
    filter(!is.na(note_moyenne) & n_vins >= 5) %>%
    mutate(
      temp_norm = 1 - abs(temp_moy - 15) / max(abs(temp_moy - 15), na.rm = TRUE),
      prcp_norm = 1 - (prcp_critique - min(prcp_critique, na.rm = TRUE)) /
        (max(prcp_critique, na.rm = TRUE) - min(prcp_critique, na.rm = TRUE)),
      ensol_norm = (ensol_maturation - min(ensol_maturation, na.rm = TRUE)) /
        (max(ensol_maturation, na.rm = TRUE) - min(ensol_maturation, na.rm = TRUE)),
      indice_climatique = (temp_norm * 0.4 + prcp_norm * 0.35 + ensol_norm * 0.25) * 100
    )
}

climate_data <- calculate_climate_index(all_wines)

global_yearly <- climate_data %>%
  group_by(Year) %>%
  summarise(
    note_globale = weighted.mean(note_moyenne, n_vins, na.rm = TRUE),
    indice_climatique_global = weighted.mean(indice_climatique, n_vins, na.rm = TRUE),
    nb_vins_total = sum(n_vins, na.rm = TRUE),
    .groups = 'drop'
  ) %>%
  filter(nb_vins_total >= 20)

# --- UI ---

ui <- dashboardPage(
  dashboardHeader(title = "Dashboard Viticole"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Graphiques", tabName = "graphiques", icon = icon("chart-line"))
    ),
    checkboxGroupInput("selected_types", "Types de vins :",
                       choices = c("Red", "White", "Rosé", "Sparkling"),
                       selected = c("Red", "White", "Rosé", "Sparkling")),
    checkboxGroupInput("selected_countries", "Pays :",
                       choices = top_pays,
                       selected = top_pays),
    sliderInput("year_limit", "Afficher les années jusqu'à :",
                min = min(global_yearly$Year),
                max = max(global_yearly$Year),
                value = max(global_yearly$Year),
                step = 1,
                sep = "")
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "graphiques",
              h2("Exploration des données climatiques et qualitatives des vins"),
              fluidRow(
                box(title = "Température & Note (par type)", status = "primary", solidHeader = TRUE,
                    width = 6, plotOutput("plot1", height = "400px")),
                box(title = "Évolution des Notes (par pays)", status = "warning", solidHeader = TRUE,
                    width = 6, plotOutput("plot2", height = "400px"))
              ),
              fluidRow(
                box(title = "Corrélation Climat / Qualité", status = "success", solidHeader = TRUE,
                    width = 12, plotOutput("plot3", height = "400px"))
              )
      )
    )
  )
)

# --- SERVER ---

server <- function(input, output) {
  output$plot1 <- renderPlot({
    months_key <- c("Apr_tavg", "Jun_tavg", "Sep_tavg")
    df <- wines_fusionne_1 %>%
      filter(Type %in% input$selected_types) %>%
      pivot_longer(cols = all_of(months_key), names_to = "Month", values_to = "Temperature")
    
    ggplot(df, aes(x = Temperature, y = Rating, color = Type)) +
      geom_point(alpha = 0.4, size = 1) +
      geom_smooth(method = "lm", se = FALSE, linewidth = 2) +
      facet_wrap(~Month, scales = "free_x") +
      scale_color_manual(values = c("Red" = "red", "White" = "gold", "Rosé" = "pink", "Sparkling" = "skyblue")) +
      labs(x = "Température moyenne (°C)", y = "Note") +
      theme_minimal()
  })
  
  output$plot2 <- renderPlot({
    df <- wines_top_pays %>%
      filter(Country %in% input$selected_countries)
    
    ggplot(df, aes(x = Year, y = Rating, color = Country)) +
      geom_point(alpha = 0.6) +
      geom_smooth(method = "lm", se = FALSE, linewidth = 1) +
      labs(x = "Année", y = "Note du Vin") +
      theme_minimal()
  })
  
  output$plot3 <- renderPlot({
    df <- global_yearly %>% filter(Year <= input$year_limit)
    correlation_coef <- cor(df$note_globale, df$indice_climatique_global, use = "complete.obs")
    
    ggplot(df, aes(x = indice_climatique_global, y = note_globale)) +
      geom_point(aes(size = nb_vins_total, color = Year), alpha = 0.7) +
      geom_smooth(method = "lm", se = TRUE, color = "red", linetype = "dashed") +
      scale_color_gradient(low = "blue", high = "red", name = "Année") +
      scale_size_continuous(name = "Nb vins", range = c(3, 8)) +
      labs(
        title = sprintf("Corrélation Météo-Qualité (r = %.3f)", correlation_coef),
        x = "Indice Climatique Optimal (%)", y = "Note Moyenne des Vins"
      ) +
      theme_minimal()
  })
}

shinyApp(ui, server)
