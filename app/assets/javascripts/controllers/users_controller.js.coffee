# for more details see: http://emberjs.com/guides/controllers/

App.UsersController = Ember.ArrayController.extend
  searchText: null

  actions:
    searchUser: ->
      query = @searchText
      @set 'filteredUsers', @content
      if query
        users = @filteredUsers.filter((user)->
          regex = new RegExp(query, 'i')
          if regex.test user.get('name')
            return user
        )
        @set 'filteredUsers', users

    deleteUser: (user)->
      @store.deleteRecord(user)
      user.save()
