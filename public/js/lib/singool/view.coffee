class View extends Backbone.View

  defaultSettings: 
    breadcrumbs: []
  
  settings: {}

  coreHelpers:
    html: require 'singool/helpers/html'
    form: require 'singool/helpers/form'
    
  helpers: {}
  
  events: {}
  
  constructor: (options = {}) ->
    super
    @settings = _.defaults options, @defaultSettings
    
    @helpers = _.extend @helpers, @coreHelpers
    for k, v of @helpers
      @[k] = new v @

    @render = _.wrap @render, (render) =>
      for helper, h of @helpers
        @[helper].beforeRender()

      @beforeRender()
      
      render()

      for helper, h of @helpers
        @[helper].afterRender()

      @afterRender()
      @

  beforeRender: () =>
    

  afterRender: () =>
    

module.exports = View