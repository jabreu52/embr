# http://emberjs.com/guides/models/defining-a-store/

App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api/v1'

App.ApplicationSerializer = DS.RESTSerializer.extend(normalize: (type, hash, property) ->
  normalized = {}
  normalizedProp = undefined
  for prop of hash
    if prop.substr(-3) is "_id"

      # belongsTo relationships
      normalizedProp = prop.slice(0, -3)
    else if prop.substr(-4) is "_ids"

      # hasMany relationship
      normalizedProp = Ember.String.pluralize(prop.slice(0, -4))
    else

      # regualarAttribute
      normalizedProp = prop
    normalizedProp = Ember.String.camelize(normalizedProp)
    normalized[normalizedProp] = hash[prop]
  @_super type, normalized, property
)

App.Store = DS.Store.extend()
