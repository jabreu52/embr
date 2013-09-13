# for more details see: http://emberjs.com/guides/controllers/

App.UserController = Ember.ObjectController.extend
  actions:
    updateUser: (user)->
      user.setProperties
        name: @get('name')
        email: @get('email')
        image: @get('image')

      user.save().then (->
        # Delete successful, go back to overview
        # self.transitionToRoute "users.index"
        alert "Update successful!"
      ), (error) ->
        # Not successful, rollback the delete action
        user.rollback()
        alert "An error occured - Please try again"