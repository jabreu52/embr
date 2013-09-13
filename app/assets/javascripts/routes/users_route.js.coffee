App.UsersRoute = Ember.Route.extend
  setupController: ->
    users = @store.find('user')
    @controllerFor('users').set('content', users)
    @controllerFor('users').set('filteredUsers', users)

  model: ->
    @store.find('user')
