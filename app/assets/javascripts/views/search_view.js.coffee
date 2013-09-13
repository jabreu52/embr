App.SearchView = Ember.View.extend
  keyUp: ->
    query = @get('controller').searchText
    @get('controller').send('searchUser', query)