App.UsersRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set('model', model).set('allUsers', model)

  model: ->
    @store.find('user')
