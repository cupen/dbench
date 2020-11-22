# Package
version       = "0.1.0"
author        = "cupen<xcupen@gmail.com>"
description   = "just some benchmarks"
license       = "MIT"
srcDir        = "src"
bin           = @["dbench"]


# Dependencies
requires "nim >= 1.4.0"
requires "redis >= 0.3.0"
requires "cligen >= 1.3.0"
requires "timeit >= 0.3.6"