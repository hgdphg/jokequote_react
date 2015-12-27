@User = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.user.username
      React.DOM.td null, @props.user.email

