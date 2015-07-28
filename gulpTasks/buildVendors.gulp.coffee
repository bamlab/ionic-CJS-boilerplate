gulp = require 'gulp'
mainBowerFiles = require 'main-bower-files'
plumber = require 'gulp-plumber'
filter = require 'gulp-filter'
concat = require 'gulp-concat'

config = require './config.gulp.coffee'

gulp.task 'build:vendors', ->
  mainFiles = mainBowerFiles({debugging: true})
  console.log mainFiles

  # Scripts
  gulp.src mainFiles
  .pipe plumber()
  .pipe filter '**/*.js'
  .pipe concat config.vendors.concatFileJs
  .pipe gulp.dest config.vendors.dest

  # Css
  gulp.src mainFiles
  .pipe plumber()
  .pipe filter '**/*.css'
  .pipe concat config.vendors.concatFileCss
  .pipe gulp.dest config.vendors.dest

  # Fonts
  gulp.src mainFiles
  .pipe filter [
      '**/*.woff'
      '**/*.svg'
      '**/*.eot'
      '**/*.ttf'
      '**/*.otf'
    ]
  .pipe gulp.dest config.vendors.destFonts
