React     = require 'react'
merge     = require './merge'
{html}    = require 'js-beautify'
cjsx      = require 'node-cjsx'
jsx       = require 'node-jsx'


class ViewEngine

  noop = -> return

  defaultEngineOptions =
    doctype: '<!DOCTYPE html>'
    extension: '.cjsx'
    beautify: off

  @createEngine: (engineOptions) ->
    @engineOptions = merge defaultEngineOptions, engineOptions
    @regexViewFileExtension = new RegExp "\\#{@engineOptions.extension}$"

    do cjsx.transform
    jsx.install
      extension: '.jsx'
      harmony: on

    @renderView

  @renderView: (componentFileName, componentOptions, callback = noop) ->
    try
      viewMarkup = @engineOptions.doctype
      componentFile = require componentFileName
      componentFactory = React.createFactory componentFile
      componentInstance = componentFactory componentOptions
      viewMarkup += React.renderToStaticMarkup componentInstance
    catch error
      callback error
      return false

    if engineOptions.beautify
      viewMarkup = html viewMarkup

    if componentOptions.settings.env is 'development'
      Object.keys(require.cache).forEach (module) =>
        if @regexViewFileExtension.test require.cache[module].filename
          delete require.cache[module]
        return

    callback null, viewMarkup
    return


module.exports = ViewEngine
