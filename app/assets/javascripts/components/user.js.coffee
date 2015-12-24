@User = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.record.username
      React.DOM.td null, @props.record.email

