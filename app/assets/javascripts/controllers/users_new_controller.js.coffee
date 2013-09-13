# for more details see: http://emberjs.com/guides/controllers/

App.UsersNewController = Ember.Controller.extend
  actions:
    createUser: ->
      # Validate
      if !@name || !@name.trim()
        alert "ag!"
        return

      # Create and save record
      user = @store.createRecord "user",
        name: @name
        email: @email
        image: @image

      user.save().then (->
        #Succesful save, thus transition to edit route
        # self.transitionToRoute "authors.edit", author
        alert "User created!"
      ), (error) ->
        if error.status is 422
          #422 validation error
          #Put json responsetext into validationErrors obj
          self.set "validationErrors", jQuery.parseJSON(error.responseText)
        else
          console.log "Validation error occured - " + error.responseText
          alert "An error occured - REST API not available - Please try again"

      # Clear form
      $('#new_user')[0].reset()
