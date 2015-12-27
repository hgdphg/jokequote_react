@User = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    # yeah... jQuery doesn't have a $.delete shortcut method
    $.ajax
      method: 'DELETE'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteUser @props.user
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.user.username
      React.DOM.td null, @props.user.email
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

