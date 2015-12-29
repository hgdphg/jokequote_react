@Session = React.createClass
  getInitialState: ->
    session:  @props.data
    username: ''
    password: ''

  getDefaultProps: ->
    session: []

  valid: ->
    @state.username && @state.password

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { session: @state }

  render: ->
    React.DOM.div
      className: "session"
      React.DOM.h2 null,
        "Login"
      React.DOM.form
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Username'
            name: 'username'
            value: @state.username
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Password'
            name: 'password'
            value: @state.password
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Login'

