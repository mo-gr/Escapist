log = (args...) ->
    console.log.apply console, args if console.log?

escape = (source, target) ->
  target.value = escapeToPropertyFile(source.value)

escapeToPropertyFile = (text) ->
  escapeText = for char in text
    switch char
      when "Ä" then '\\u00C4'
      when "ä" then '\\u00E4'
      when "Ö" then '\\u00D6'
      when "ö" then '\\u00F6'
      when "Ü" then '\\u00DC'
      when "ü" then '\\u00FC'
      when "ß" then '\\u00DF'
      when "%" then '\\u0025'
      when "°" then '\\u00B0'
      when "ç" then '\\u00E7'
      when "Ç" then '\\u00C7'
      when "à" then '\\u00E0'
      when "À" then '\\u00C0'
      when "È" then '\\u00C8'
      when "è" then '\\u00E8'
      when "ê" then '\\u00EA'
      when "î" then '\\u00EE'
      when "û" then '\\u00FB'
      when "ô" then '\\u00F4'
      when "Á" then '\\u00C1'
      when "á" then '\\u00E1'
      when "É" then '\\u00C9'
      when "é" then '\\u00E9'
      when "№" then '\\u2116'
      else char
  escapeText.join('')

@Escapist =
  escape : escape
