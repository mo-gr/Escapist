// Generated by CoffeeScript 1.3.3
(function() {
  var escape, escapeToPropertyFile, hexCharCode, log, padToFour, setup,
    __slice = [].slice;

  log = function() {
    var args;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    if ((typeof console !== "undefined" && console !== null) && (console.log != null)) {
      return console.log.apply(console, args);
    }
  };

  escape = function(source, target) {
    return target.value = escapeToPropertyFile(source.value);
  };

  padToFour = function(number) {
    var s;
    s = "0000" + number;
    return s.substr(s.length - 4);
  };

  hexCharCode = function(c) {
    return c.charCodeAt().toString(16);
  };

  escapeToPropertyFile = function(text) {
    var char, charCode, escapeText, escapedChar;
    escapeText = (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = text.length; _i < _len; _i++) {
        char = text[_i];
        charCode = hexCharCode(char);
        escapedChar = '\\u' + padToFour(charCode).toUpperCase();
        if (charCode >= hexCharCode('0') && charCode <= hexCharCode('z')) {
          _results.push(char);
        } else {
          _results.push(escapedChar);
        }
      }
      return _results;
    })();
    return escapeText.join('');
  };

  setup = function(inputId, outputId) {
    var input, output;
    input = document.getElementById(inputId);
    output = document.getElementById(outputId);
    input.addEventListener('keydown', function(event) {
      escape(input, output);
      if (event.which === 13) {
        return output.focus();
      }
    });
    input.addEventListener('keyup', function(event) {
      return escape(input, output);
    });
    output.addEventListener('focus', function() {
      return setTimeout(function() {
        return output.select();
      }, 1);
    });
    input.addEventListener('focus', function() {
      return setTimeout(function() {
        return input.select();
      }, 1);
    });
    input.focus();
    return window.addEventListener('focus', function() {
      return input.focus();
    });
  };

  this.Escapist = {
    escape: escape,
    setup: setup
  };

}).call(this);
