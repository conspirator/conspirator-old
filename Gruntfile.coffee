path = require "path"
lrSnippet = require("grunt-contrib-livereload/lib/utils").livereloadSnippet

folderMount = (connect, point) ->
  connect.static path.resolve(point)

module.exports = (grunt) ->

  @initConfig
    pkg: grunt.file.readJSON "package.json"

    connect:
      server:
        options:
          port: 3000
          base: ""
      livereload:
        options:
          middleware: (connect, options) ->
            [lrSnippet, folderMount(connect, ".")]


    regarde:
      js:
        files: "_src/coffee/*.coffee",
        tasks: ["coffee", "concat", "uglify", "livereload"]
      css:
        files: "_src/stylus/*.styl",
        tasks: ["stylus","livereload"]

    stylus:
      compile:
        options:
          paths: ["_src/stylus"]
          import: ["nib"]
        files:
          "assets/css/app.css": "_src/stylus/app.styl"

    coffee:
      compile:
        files:
          "assets/js/app.js": "_src/coffee/app.coffee"

    concat:
      options:
        separator: "\n"
      dist:
        src: [
          "assets/js/vendor/retina.js",
          "assets/js/vendor/jquery.min.js",
          "assets/js/vendor/fitvid.js",
          "assets/js/app.js"
        ]
        dest: "assets/js/app.concat.js"


    uglify:
      my_target:
        files:
          "assets/js/app.min.js": ["assets/js/app.concat.js"]


  @loadNpmTasks "grunt-contrib-stylus"
  @loadNpmTasks "grunt-contrib-coffee"
  @loadNpmTasks "grunt-contrib-concat"
  @loadNpmTasks "grunt-contrib-uglify"
  @loadNpmTasks "grunt-contrib-connect"
  @loadNpmTasks "grunt-contrib-livereload"
  @loadNpmTasks "grunt-regarde"


  # @registerTask "default", ["livereload-start", "connect:server", "regarde"]
  @registerTask "default", ["livereload-start", "regarde"]