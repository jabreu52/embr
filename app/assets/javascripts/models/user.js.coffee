# for more details see: http://emberjs.com/guides/models/defining-models/

App.User = DS.Model.extend
  email: DS.attr 'string'
  password: DS.attr 'string'
  name: DS.attr 'string'
  image: DS.attr 'string'
  groups: DS.hasMany 'group'
