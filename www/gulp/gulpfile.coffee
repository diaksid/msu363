gulp = require 'gulp'


src = '.'
lib = '/var/web/vendor'
dest = '../../web/assets'

css = require "#{ lib }/gulp/css"
js = require "#{ lib }/gulp/js"
icon = require "#{ lib }/gulp/icon"

# ----------------------------------------------------------------------------------------------------

gulp.task 'styles:site', ->
  css.sass dest, [
    "#{ src }/scss/app.scss"
    "#{ src }/scss/error.scss"
  ]


gulp.task 'styles:defer', ->
  css.sass dest, [
    "#{ src }/scss/bootstrap/carousel.scss"
    "#{ src }/scss/bootstrap/modal.scss"
    "#{ src }/scss/bootstrap/tethers.scss"
    "#{ src }/scss/vendor/fancybox.scss"
    "#{ src }/scss/vendor/jcarousel.scss"
  ]

# ----------------------------------------------------------------------------------------------------

gulp.task 'scripts:site', ->
  js.coffee dest, [
    "#{ lib }/.proj/javascript/jquery/proj.coffee"
    "#{ lib }/.proj/javascript/jquery/_animation.coffee"
    "#{ lib }/.proj/javascript/jquery/_extend.coffee"
    "#{ lib }/.proj/javascript/jquery/_utils.coffee"
    "#{ lib }/.proj/javascript/jquery/vendor/_fancybox.coffee"
    "#{ lib }/.proj/javascript/jquery/vendor/_yandex.coffee"
    "#{ src }/coffee/core.coffee"
  ],
    concat: 'app'


gulp.task 'scripts:vendor', ->
  js dest, [
    "#{ lib }/wow/wow.js"

    "#{ lib }/jquery/cookie/jquery.cookie.js"
    "#{ lib }/jquery/easing/jquery.easing.js"
    "#{ lib }/jquery/lazyload/jquery.lazyload.js"

    "#{ lib }/bootstrap/js/util.js"
    "#{ lib }/bootstrap/js/alert.js"
    "#{ lib }/bootstrap/js/button.js"
    "#{ lib }/bootstrap/js/collapse.js"
    "#{ lib }/bootstrap/js/dropdown.js"
#    "#{ lib }/bootstrap/js/tab.js"
  ],
    concat: 'vendor'


gulp.task 'scripts:defer', ->
  js dest, [
    "#{ lib }/bootstrap/js/scrollspy.js"
    "#{ lib }/bootstrap/js/modal.js"
    "#{ lib }/bootstrap/js/carousel.js"
  ]


gulp.task 'scripts:tethers', ->
  js dest, [
    "#{ lib }/tether/tether.js"
    "#{ lib }/bootstrap/js/tooltip.js"
    "#{ lib }/bootstrap/js/popover.js"
  ],
    concat: 'tethers'


gulp.task 'scripts:fancybox', ->
  js dest, [
    "#{ lib }/jquery/mousewheel/jquery.mousewheel.js"
    "#{ lib }/jquery/fancybox/fancybox.js"
    "#{ lib }/jquery/fancybox/jquery.fancybox-media.js"
    "#{ lib }/jquery/fancybox/jquery.fancybox-buttons.js"
    "#{ lib }/jquery/fancybox/jquery.fancybox-thumbs.js"
  ],
    concat: 'fancybox'


gulp.task 'scripts:jcarousel', ->
  js dest, [
    "#{ lib }/jquery/jcarousel/core.js"
    "#{ lib }/jquery/jcarousel/core_plugin.js"
    "#{ lib }/jquery/jcarousel/control.js"
    "#{ lib }/jquery/jcarousel/pagination.js"
    "#{ lib }/jquery/jcarousel/autoscroll.js"
  ],
    concat: 'jcarousel'


gulp.task 'scripts:tools', ->
  gulp.src([
    "#{ lib }/html5/*.js"
    "#{ lib }/jquery/2.1.4/*.js"
    "#{ lib }/jquery/autosize/*.js"
  ])
  .pipe gulp.dest "#{ dest }/js/lib"


# ----------------------------------------------------------------------------------------------------


gulp.task 'images:site', ->
  gulp.src([
    "#{ src }/img/**"
  ])
  .pipe gulp.dest "#{ dest }/img"


gulp.task 'images:vendor', ->
  gulp.src([
    "#{ lib }/jquery/fancybox/img/**"
  ])
  .pipe gulp.dest "#{ dest }/img"


# ----------------------------------------------------------------------------------------------------

gulp.task 'fonts:site', ->
    gulp.src([
        "#{ src }/fonts/**"
    ])
        .pipe gulp.dest "#{ dest }/fonts"


gulp.task 'fonts:icon', ->
  icon dest, require "#{ src }/scss/vendor/iconfont"

# ----------------------------------------------------------------------------------------------------

gulp.task 'watch', ->
  gulp.watch [
    "#{ src }/scss/vendor/animate.scss"
    "#{ lib }/animate/**"
    "#{ src }/scss/vendor/iconfont.scss"
    "#{ lib }/iconfont/**"
    "#{ src }/scss/vendor/bootstrap.scss"
    "#{ lib }/bootstrap/scss/**"
    "#{ src }/scss/site/**"
    "#{ src }/scss/app.scss"
    "#{ src }/scss/error.scss"
  ], [
    'styles:site'
  ]

  gulp.watch [
    "#{ src }/scss/site/_variables.scss"
    "#{ src }/scss/bootstrap/carousel.scss"
    "#{ src }/scss/bootstrap/modal.scss"
    "#{ src }/scss/bootstrap/tethers.scss"
    "#{ src }/scss/vendor/fancybox.scss"
    "#{ src }/scss/vendor/jcarousel.scss"
  ], [
    'styles:defer'
  ]

  gulp.watch [
    "#{ lib }/.proj/javascript/jquery/*.coffee"
    "#{ src }/coffee/*.coffee"
  ], ['scripts:site']

  gulp.watch [
    "#{ lib }/wow/wow.js"
    "#{ lib }/jquery/cookie/jquery.cookie.js"
    "#{ lib }/jquery/easing/jquery.easing.js"
    "#{ lib }/jquery/bgswitcher/jquery.bgswitcher.js"
    "#{ lib }/jquery/lazyload/jquery.lazyload.js"

    "#{ lib }/bootstrap/js/util.js"
    "#{ lib }/bootstrap/js/alert.js"
    "#{ lib }/bootstrap/js/button.js"
    "#{ lib }/bootstrap/js/collapse.js"
    "#{ lib }/bootstrap/js/dropdown.js"
    "#{ lib }/bootstrap/js/tab.js"
    "#{ lib }/bootstrap/js/scrollspy.js"
  ], [
    'scripts:vendor'
  ]

  gulp.watch [
    "#{ lib }/bootstrap/js/carousel.js"
    "#{ lib }/bootstrap/js/modal.js"
    "#{ lib }/bootstrap/js/scrollspy.js"
  ], [
    'scripts:defer'
  ]

  gulp.watch [
    "#{ lib }/tether/tether.js"
    "#{ lib }/bootstrap/js/tooltip.js"
    "#{ lib }/bootstrap/js/popover.js"
  ], [
    'scripts:tethers'
  ]

  gulp.watch [
    "#{ lib }/jquery/fancybox/*.js"
    "#{ lib }/jquery/mousewheel/jquery.mousewheel.js"
  ], [
    'scripts:fancybox'
  ]

  gulp.watch [
    "#{ lib }/jquery/jcarousel/*.js"
  ], [
    'scripts:jcarousel'
  ]

  gulp.watch [
    "#{ lib }/html5/*.js"
    "#{ lib }/jquery/2.1.4/*.js"
    "#{ lib }/jquery/autosize/*.js"
  ], [
    'scripts:tools'
  ]

  gulp.watch [
    "#{ src }/img/**"
  ], [
    'images:site'
  ]

  gulp.watch [
    "#{ lib }/jquery/fancybox/img/**"
  ], [
    'images:vendor'
  ]

  gulp.watch [
    "#{ src }/scss/vendor/iconfont.scss"
    "#{ lib }/iconfont/**"
  ], [
    'fonts:icon'
  ]


gulp.task 'default', [
  'styles:site'
  'styles:defer'

  'scripts:site'
  'scripts:vendor'
  'scripts:defer'
  'scripts:tethers'
  'scripts:fancybox'
  'scripts:jcarousel'
  'scripts:tools'

  'images:site'
  'images:vendor'

  'fonts:icon'

  'watch'
]
