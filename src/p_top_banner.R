# cv top banner grid
# TODO: Refactor "ggdraw + draw_label"-use for better accessibility


# left grid: photo --------------------------------------------------------

p_banner_photo <- plot_grid(
  ggdraw() + 
    draw_image("NicePng_star-trek-png_2661521.png")
  
)


# mid grid: title text (name/short text) ----------------------------------

p_banner_title <- plot_grid(
  nrow = 4,
  rel_heights = c(0.25, 0.40, 0.30, 1),
  
  # 1. row; empty/spacing
  NULL,
  
  # 2. row; name
  ggdraw() +
    draw_label(
      "DATA",
      size = 20,
      fontface = "bold",
      fontfamily = "Roboto",
      hjust = 0,
      x = 0.05
    ),
  
  # 3. row; short text
  ggdraw() +
    draw_label(
      "As specialized in AI as you get",
      size = 9,
      fontface = "bold",
      fontfamily = "Roboto",
      hjust = 0,
      x = 0.05
    ),
  
  # 4. row; empty/spacing
  NULL
)


# right grid --------------------------------------------------------------


p_banner_contact <- plot_grid(
  ncol = 2,
  nrow = 5,
  rel_widths = c(0.10, 1),
  rel_heights = c(0.09, 0.15, 0.15, 0.225, 0.175),
  
  # 1. row; empty/spacing
  NULL,
  NULL,
  
  # 2. row; phone icon and phone number
  ggdraw() + draw_label(
    "\Uf095", 
    fontfamily = "fa-solid", 
    size = 11
  ),
  ggdraw() + draw_label(
    "01100100",
    fontfamily = "Roboto",
    hjust = 0,
    x = 0.05,
    size = 9
  ),
  
  # 3. row; e-mail icon and e-mail
  ggdraw() + draw_label(
    "\U40", 
    fontfamily = "fa-solid", 
    size = 11),
  ggdraw() + draw_label(
    "data@starfleet",
    fontfamily = "Roboto",
    hjust = 0,
    x = 0.05,
    size = 9
  ),
  
  # 4. row; home icon and address
  ggdraw() + draw_label(
    "\Ue3af", 
    fontfamily = "fa-solid", 
    size = 11),
  ggdraw() + draw_label(
    "USS-Enterprise-D,\nDeck 2, room 3653.",
    fontfamily = "Roboto",
    hjust = 0,
    x = 0.05,
    size = 9
  ),
  
  # 5. row; empty/spacing
  NULL,
  NULL
  
)


# grid combine ------------------------------------------------------------

p_banner_top <- plot_grid(
  ncol = 3, 
  nrow = 2,
  rel_widths = c(0.40, 1.15, 0.45),
  rel_heights = c(0.05, 0.95),
  
  # 1. row; empty/top spacing
  NULL, NULL, NULL, 
  
  # 2. row; left, mid and right grids combined
  p_banner_photo, p_banner_title, p_banner_contact,
  
  # 3. row; empty/bot spacing
  NULL, NULL, NULL
) +
  theme(plot.background = element_rect(fill = color_main,
                                       colour = color_main))



