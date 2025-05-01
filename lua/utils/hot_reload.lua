RELOAD = require('plenary.reload').reload_module

function R(name)
  RELOAD(name)
  return require(name)
end
