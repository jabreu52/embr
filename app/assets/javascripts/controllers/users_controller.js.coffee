App.UsersController = Ember.ArrayController.extend
  searchText: null
  sortProperties: ['name']

  actions:
    searchUsers: ->
      if @searchText
        regex = new RegExp(@searchText, 'i')
        users = @allUsers.filter (user)->
          regex.test user.get('name')
        if users.length
          @set 'content', users
          @get('target').transitionTo('user', users[0].get('id'))

    deleteUser: (user)->
      @store.deleteRecord(user)
      user.save()