log = (args...) ->
    console.log.apply console, args if console? and console.log?

escape = (source, target) ->
  target.value = escapeToPropertyFile(source.value)

padToFour = (number) ->
  s = "0000" + number
  s.substr(s.length - 4)

hexCharCode = (c) ->
  c.charCodeAt().toString(16)

escapeToPropertyFile = (text) ->
  escapeText = for char in text
    charCode = hexCharCode(char)
    escapedChar = '\\u' + padToFour(charCode).toUpperCase()
    if (charCode >= hexCharCode('0') and charCode <= hexCharCode('z')) or charCode == hexCharCode(' ') then char else escapedChar
  escapeText.join('')

setup = (inputId, outputId) ->
  input = document.getElementById inputId
  output = document.getElementById outputId

  input.addEventListener 'keydown', (event) ->
    escape input, output
    if event.which == 13
      output.focus()

  input.addEventListener 'keyup', (event) ->
    escape input, output

  output.addEventListener 'focus', () ->
    setTimeout( () -> 
      output.select()
    , 1)

  input.addEventListener 'focus', () ->
    setTimeout( () -> 
      input.select()
    , 1)

  input.focus()
  window.addEventListener 'focus', () ->
    input.focus()

@Escapist =
  escape : escape
  setup  : setup
