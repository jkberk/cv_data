# table function for displaying neat and formatted text sections
fn_body_tab <- function(data) {
  
  # add formatting to main txt column indicated by formatting column
  data <- data |> 
    dplyr::mutate(main_txt = case_when(
      formatting == "italic" ~ 
        kableExtra::cell_spec(main_txt, "latex", italic = TRUE),
      formatting == "bold" ~ 
        kableExtra::cell_spec(main_txt, "latex", bold = TRUE),
      formatting == "small" ~ 
        kableExtra::cell_spec(main_txt, "latex", font_size = 9),
      formatting == "bullet" ~ 
        paste0("~~~~~$\\boldsymbol{\\cdot}$~~", main_txt),
      TRUE ~ as.character(main_txt)
    )) |> 
    select(-formatting)
  
  # add bold emphasis to all section_txt 
  data$section_txt[1] <- kableExtra::cell_spec(data$section_txt[1], 
                                               "latex", 
                                               bold = TRUE)
  
  tbl <- data |> 
    kableExtra::kable(
      align = "l", 
      format = "latex",
      linesep = "",
      escape = FALSE,
      booktabs = TRUE,
      col.names = c("1", "2", "3", "4")) |> 
    kableExtra::column_spec(1, width = "0.175cm") |>  
    kableExtra::column_spec(2, width = "3.25cm") |> 
    kableExtra::column_spec(3, width = "1.35cm") |> 
    kableExtra::column_spec(4, width = "13.00cm") 
  
  # remove some rulers from table 
  tbl <- gsub("\\p{P}toprule", "", tbl, perl = TRUE)
  tbl <- gsub("\\p{P}bottomrule", "", tbl, perl = TRUE)
  tbl <- gsub("1 & 2 & 3 & 4", "", tbl)
  
  tbl
  
}
