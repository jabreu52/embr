# for more details see: http://emberjs.com/guides/controllers/

App.UsersController = Ember.ArrayController.extend
  searchText: null

  actions:
    searchUser: ->
      if @get('searchText')
        @set 'content', @store.find 'user', { name: @searchText }
      else
        @set 'content', @store.find 'user'

    deleteUser: (user)->
      @store.deleteRecord(user)
      user.save()
