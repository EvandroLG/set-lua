local utils = require('Set.utils')

function Set(list)
  local items = {}
  local size = 0

  for _, value in ipairs(list) do
    items[value] = true
    size = size + 1
  end

  return {
    items = items,

    size = function()
      return size
    end,

    insert = function(value)
      items[value] = true
      size = size + 1
    end,

    has = function(value)
      return utils.to_boolean(items[value])
    end,

    clear = function()
      items = {}
      size = 0
    end,

    delete = function(value)
      if items[value] then
        items[value] = nil
        size = size - 1
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
