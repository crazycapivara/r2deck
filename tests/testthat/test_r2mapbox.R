context("r2mapbox")

test_that("", {
  # Prepare
  script <- system.file("scripts/arc-mapbox.js", package = "r2deck")
  data = 1:4

  # Act
  map <- r2mapbox(script = script, data = data)

  # Assert
  expect_equal(map$x$webGLContext, "mapbox")
  expect_equal(map$x$deckGLProperties$center, c(-122.45, 37.80))
})
