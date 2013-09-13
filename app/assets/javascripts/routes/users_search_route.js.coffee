App.UsersSearchRoute = Ember.Route.extend
  model: (params)->
    @store.find 'user', q: params
