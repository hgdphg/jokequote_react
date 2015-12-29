@User = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      username: React.findDOMNode(@refs.username).value
      email: React.findDOMNode(@refs.email).value
    $.ajax
      method: 'PATCH'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      data:
        user: data
      success: (data) =>
        @setState edit: false
        @props.handleEditUser @props.user, data

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteUser @props.user

  userRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.user.username
      React.DOM.td null, @props.user.email
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  userForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.user.username
          ref: 'username'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.user.email
          ref: 'email'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'

  render: ->
    if @state.edit
      @userForm()
    else
      @userRow()
