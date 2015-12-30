@Homepage = React.createClass
  getInitialState: ->
    jokecontent: @props.data
    end_content: false

  getDefaultProps: ->
    jokecontent: []
    end_content: false

  clicklink: (e) ->
    e.preventDefault()
    $.post 'clicklink', { id: @state.jokecontent.id}, (data) =>
      if data
        @setState jokecontent: data
      else
        @setState end_content: true
    , 'JSON'

  render: ->
    React.DOM.div null,
      React.DOM.div
        className: 'titleofhomepage'
        React.DOM.h3 null,
          "Wellcome to JokeQuote, happy everyday and never feel sad"
        React.DOM.h5 null,
          "If you sad, remember has many don't have tooth"

      if @props.data && !@state.end_content
        React.DOM.div null,
          React.DOM.div
            className: 'joke_content_homepage'
            React.DOM.h4 null,
              @state.jokecontent.title
            React.DOM.h5 null,
              @state.jokecontent.content

          React.DOM.div
            className: 'buttonarea'
            React.DOM.a
              className: 'btn btn-primary button_link'
              method: 'post'
              onClick: @clicklink
              'This funny'
            React.DOM.a
              className: 'btn btn-success button_link'
              onClick: @clicklink
              method: 'post'
              'This not funny'
      else
          React.DOM.div
            className: 'joke_content_homepage end_content'
            React.DOM.h3 null,
              "Hết truyện rồi, mời bạn ngày mai quay lại nhé, chúc bạn một ngày tốt lạnh"



