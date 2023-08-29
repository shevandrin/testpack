#' convert md into html
#'
#' @param file md file
#' @importFrom rmarkdown pandoc_convert
#' @import xml2
#' @export
transform2html <- function(file) {

    options <- c("-o", "_temp_pandoc.html", "-f", "markdown", "-t", "html4",
                 "--mathjax",
                 "--embed-resources",
                 "--section-divs",
                 "--wrap=none", "+RTS", "-M30m")
    rmarkdown::pandoc_convert(file, options=options, wd = getwd())
    tdoc <- file.path(getwd(), "_temp_pandoc.html")
    doc <- xml2::read_html(tdoc, encoding = "utf-8")
    seq <- xml2::xml_find_first(doc, "//section[@id='question']")
    h <- xml2::xml_find_first(seq, "h1")
    return(xml2::xml_text(h))

}
