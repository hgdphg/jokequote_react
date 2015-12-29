@ContentForm = React.createClass
  getInitialState: ->
    title: ''
    content: ''

  valid: ->
    @state.title && @state.content

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { content: @state }, (data) =>
      @props.handleNewContent data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.textarea
          type: 'text'
          className: 'form-control'
          placeholder: 'Joke content'
          name: 'content'
          value: @state.content
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create content'

