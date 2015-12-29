@Contents = React.createClass
  getInitialState: ->
    contents: @props.data

  getDefaultProps: ->
    contents: []

  addContent: (content) ->
    contents = React.addons.update(@state.contents, { $push: [content] })
    @setState contents: contents

  deleteContent: (content) ->
    index = @state.contents.indexOf content
    contents = React.addons.update(@state.contents, { $splice: [[index, 1]] })
    @replaceState contents: contents

  updateContent: (content, data) ->
    index = @state.contents.indexOf content
    contents = React.addons.update(@state.contents, { $splice: [[index, 1, data]] })
    @replaceState contents: contents

  render: ->
    React.DOM.div
      className: 'contents'
      React.DOM.h2 null,
      'Joke Contents'
      React.DOM.h3 null,
      'Create new content'
      React.createElement ContentForm, handleNewContent: @addContent
      React.DOM.h3 null,
      'List contents'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Contents'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for content in @state.contents
            React.createElement Content, key: content.id, content: content, handleDeleteContent: @deleteContent, handleEditContent: @updateContent

