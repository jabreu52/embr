App.SearchView = Ember.View.extend
  keyUp: ->
    @get('controller').send('searchUsers')