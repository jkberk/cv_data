# Skills and competencies waffle banner
# TODO: 

# top grid: skills title --------------------------------------------------



p_skills_title <- plot_grid(
  ggdraw() + 
    draw_label("SKILLS AND COMPETENCIES",
               size = 11,
               fontface = "bold",
               fontfamily = "Roboto Condensed",
               hjust = 0, 
               x = 0.39, 
               y = 0.65)
)


# mid grid: waffles -------------------------------------------------------

# waffles pt1: specific skills
p_skills_specific <- plot_grid(
  ncol = 1,
  align="v",
  axis="l",
  
  ggdraw() +
    draw_label(
      "Specific skills",
      size = 10,
      fontface = "bold.italic",
      fontfamily = "Roboto Condensed",
      hjust = 0,
      x = -0.08,
      y = 0.700
    ),
  fn_cwaffle(c(5, 0), "R"),
  fn_cwaffle(c(5, 0), "Julia"),
  fn_cwaffle(c(5, 0), "Python"),
  fn_cwaffle(c(5, 0), "Javascript"),
  fn_cwaffle(c(5, 0), "Assembly"),
  fn_cwaffle(c(5, 0), "Machine code")
)

# waffles pt2: technical competencies
p_competencies_techn <- plot_grid(
  ncol = 1,
  align="v",
  axis="l",
  
  ggdraw() + draw_label(
    "Technical competencies",
    size = 10,
    fontface = "bold.italic",
    fontfamily = "Roboto Condensed",
    hjust = 0,
    x = -0.575,
    y = 0.700
  ),
  fn_cwaffle(c(5, 0), "ETL"),
  fn_cwaffle(c(5, 0), "Regression analysis"),
  fn_cwaffle(c(4, 1), "Classification analysis"),
  fn_cwaffle(c(4, 1), "Machine learning"),
  fn_cwaffle(c(4, 1), "Visualisation"),
  fn_cwaffle(c(2, 3), "Qualitative interviews")
)

# waffles pt3: personal competencies
p_competencies_pers <- plot_grid(
  ncol = 1,
  align="v",
  axis="l",
  
  ggdraw() + draw_label(
    "Personal competencies",
    size = 10,
    fontface = "bold.italic",
    fontfamily = "Roboto Condensed",
    hjust = 0,
    x = -0.45,
    y = 0.700
  ),
  fn_cwaffle(c(4, 1), "Solution-orientated"),
  fn_cwaffle(c(5, 0), "Systematic"),
  fn_cwaffle(c(2, 3), "Social skills"),
  fn_cwaffle(c(1, 4), "Compassion"),
  NULL, # empty/spacing
  NULL  # empty/spacing
)


p_waffle_combined <- plot_grid(
  ncol = 3,
  rel_widths = c(1, 1, 1),

  p_skills_specific,
  p_competencies_techn,
  p_competencies_pers
)


# grid combine ------------------------------------------------------------

# combine to final grid (with top and bottom null-margin + background color)
p_skills_n_waffles <- plot_grid(
  nrow = 4,
  ncol = 1,
  rel_widths = c(1, 1, 1),
  rel_heights = c(0.15, 1.15, 4, 0.80),

  # 1. row; empty/spacing
  NULL,
  
  # 2. row; skills title
  p_skills_title,
  
  # 3. row; all three waffle parts
  p_waffle_combined,
  
  # 4. row; empty/spacing
  NULL
) +
  theme(plot.background = element_rect(fill = color_waffle_bg,
                                       colour = color_waffle_bg))
