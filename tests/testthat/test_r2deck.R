context("r2deck")

test_that("", {
  # Prepare
  script <- system.file("scripts/arc.js", package = "r2deck")
  data = 1:4

  # Act
  map <- r2deck(script = script, data = data)

  # Assert
  expect_equal(map$x$webGLContext, "deck")
  expect_equal(map$x$deckGLProperties$longitude, -122.45)
})
