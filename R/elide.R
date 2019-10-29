elide <- defmacro::defmacro(function(code, level) {
  if (level <= get_elision_level()) {
    code
  }
})

get_elision_level <- function() {
  if (pkgload::is_dev_package(packageName())) {
    50
  } else {
    0
  }
}
