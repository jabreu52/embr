# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'users', ->
    @resource 'user', { path: ':user_id' }
    @route 'new'
  @resource 'groups', ->
    @resource 'group', { path: ':group_id' }

