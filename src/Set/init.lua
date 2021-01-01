function Set(list)
  local _items = {}
  local _size = 0

  for _, value in ipairs(list) do
    _items[value] = true
    _size = _size + 1
  end

  return {
    items = function()
      return _items
    end,

    size = function()
      return _size
    end,

    insert = function(value)
      _items[value] = true
      _size = _size + 1
    end,

    has = function(value)
      return _items[value] == true
    end,

    clear = function()
      _items = {}
      _size = 0
    end,

    delete = function(value)
      if _items[value] then
        _items[value] = nil
        _size = _size - 1
        return true
      end

      return false
    end,

    each = function(callback)
      for key in pairs(_items) do
        callback(key)
      end
    end
  }
end

return Set
