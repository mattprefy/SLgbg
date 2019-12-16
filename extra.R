rollmean_NEW <- function(data, RA){
 data %>% 
    select(-id,-SL_id) %>% 
    #TOI2 <- paste0("TOI_",RA) %>% 
    rename_at(vars(-GameDate), ~ paste0(.,RA)) %>% 
    tq_transmute(
      select = -contains("60"),
      mutate_fun = rollapply,
      width      = 5,
      align      = "right",
      FUN        = sum,
      na.rm      = TRUE,
    ) %>% 
    mutate_at(vars(-contains("%"),-contains("Rate"), -GameDate, -TOI_05GM), funs(`60` = ./TOI_05GM*3600)) %>% 
    select(GameDate, contains("TOI"), everything())
}

TEST = WPG_PK_GBG %>% 
  rollmean_NEW("_05GM") %>%
  merge(PK_GBG) %>% 
  select(`Info`, everything(), -contains("%"))


WPG_PP_Roll = WPG_PP_GBG %>% 
  rollmean_NEW() %>%
  merge(PP_GBG) %>% 
  select(`Info`, everything(), -contains("%"))