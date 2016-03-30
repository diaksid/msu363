((window, document, ProJ, $) ->
  'use strict'

# ----------------------------------------------------------------------------------------------------

  DEBUG = no

  jPro = new ProJ DEBUG, "//web.#{ location.hostname }/assets"
  window.jPro = window.$$ = jPro

  $win = $ window

  # --------------------------------------------------

  $ ->
    new WOW(offset: 0).init()

    jPro.lazy '[data-lazy]'

    $('a.active, .active > a').on 'click', (event) -> event.preventDefault()

    $('[data-scroll]').click (event) ->
      event.preventDefault()
      attr = event.target.getAttribute 'data-scroll'
      if attr is '#'
        jPro.totop
      else if attr and not event.target.classList.contains 'active'
        jPro.toobj attr

    $('.w3c').on 'click', jPro.w3c
    $('.ymet').on 'click', jPro.ymet

    jPro.lightbox '[data-lightbox]'

    $autosize = $ '.autosize'
    jPro.script 'js/lib/jquery.autosize.js', -> $autosize.autosize() if $autosize.length

  # --------------------------------------------------

  $win.load ->
    jPro.ymaps '.ymap'

# ----------------------------------------------------------------------------------------------------

) window, document, ProJ, jQuery
