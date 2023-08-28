test_that("test transform function", {
    path <- test_path("ex1.md")
    sut <- transform2html(path)
    expect_equal(sut, "question")
    })
