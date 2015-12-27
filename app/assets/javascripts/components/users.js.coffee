@Users = React.createClass
  getInitialState: ->
    users: @props.data

  getDefaultProps: ->
    users: []

  addUser: (user) ->
    users = @state.users.slice()
    users.push user

    @setState users: users

  deleteUser: (user) ->
      users = @state.users.slice()
      index = users.indexOf user
      users.splice index, 1
      @replaceState users: users

  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h2
        className: 'username'
        'Create user'
      React.createElement UserForm, handleNewUser: @addUser
      React.DOM.br null
      React.DOM.h2
        className: 'username'
        'Users list'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'User name'
            React.DOM.th null, 'Email'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for user in @state.users
            React.createElement User, key: user.id, user: user, handleDeleteUser: @deleteUser




