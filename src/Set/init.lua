local utils = require('Set.utils')

function Set()
  local items = {}

  return {
    insert = function(value)
      items[value] = true
    end,

    has = function(value)
      return utils.to_boolean(items[value])
    end,

    clear = function()
      items = {}
    end,

    delete = function(value)
      if items[value] then
        items[value] = nil
        return true
      end

      return false
    end,

    each = function(callback)
      for key in pairs(items) do
        callback(key)
      end
    end
  }
end

return Set
