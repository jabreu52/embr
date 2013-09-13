App.GroupsRoute = Ember.Route.extend
  model: ->
    @store.find('group')
