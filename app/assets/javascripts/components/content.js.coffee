@Content = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      title: React.findDOMNode(@refs.title).value
      content: React.findDOMNode(@refs.content).value
    $.ajax
      method: 'PATCH'
      url: "/contents/#{ @props.content.id }"
      dataType: 'JSON'
      data:
        content: data
      success: (data) =>
        @setState edit: false
        @props.handleEditContent @props.content, data

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/contents/#{ @props.content.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteContent @props.content


  contentRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.content.title
      React.DOM.td null, @props.content.content
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  contentForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.content.title
          ref: 'title'
      React.DOM.td null,
        React.DOM.textarea
          className: 'form-control'
          type: 'text'
          defaultValue: @props.content.content
          ref: 'content'
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
      @contentForm()
    else
      @contentRow()
