# customized waffle function; props to: 
# https://stackoverflow.com/questions/72559522/waffle-chart-fontawesome-issue
fn_cwaffle <- function(x, label = "label") {
  
  rows <- 1
  
  len <- sum(x)
  waffles <- seq(len) - 1
  nms <- if(is.null(names(x))) seq_along(x) else names(x)
  df <- data.frame(xvals = waffles %/% rows,
                   yvals = 1 - (waffles %% rows),
                   fill = factor(rep(nms, times = x)))
  
  ggplot(df, aes(xvals, yvals, color = fill)) +
    geom_tile(aes(fill = fill), color = color_waffle_bg, linewidth = 0.75) +
    scale_fill_manual(values = c(color_waffle_full, color_waffle_empty)) + 
    coord_equal(expand = TRUE) +
    lims(x  = c(min(df$xvals) - 0.65, max(df$xvals) + 0.65),
         y  = c(min(df$yvals) - 0.65, max(df$yvals) + 0.65)) + 
    theme_void() +
    theme(legend.position = "none",
          axis.title.y = element_text(angle = 0, 
                                      vjust = 0.5,
                                      size = 8,
                                      margin = margin(r = 1.0))) +
    labs(y = label)
} 
