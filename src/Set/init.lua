-- Set lets you store unique values of any type
-- @param list {table}
-- @returns {table}
function Set(list)
  local _items = {}
  local _size = 0

  if type(list) == 'table' then
    for _, value in ipairs(list) do
      _items[value] = true
      _size = _size + 1
    end
  end

  return {
    -- Returns current Set items
    -- @returns {table}
    items = function()
      return _items
    end,

    -- Returns current Set size
    -- @returns {number}
    size = function()
      return _size
    end,

    -- Appends value to the Set object
    -- @param value {any}
    -- @returns {void}
    insert = function(value)
      if not _items[value] then
        _items[value] = true
        _size = _size + 1
      end
    end,

    -- Checks if value is present in the Set object or not
    -- @param value {any}
    -- @returns {boolean}
    has = function(value)
      return _items[value] == true
    end,

    -- Removes all items from the Set object
    -- @returns {void}
    clear = function()
      _items = {}
      _size = 0
    end,

    -- Removes item from the Set object and returns a boolean value asserting wheater item was removed or not
    -- @param value {any}
    -- @returns {boolean}
    delete = function(value)
      if _items[value] then
        _items[value] = nil
        _size = _size - 1
        return true
      end

      return false
    end,

    -- Calls function once for each item present in the Set object without preserve insertion order
    -- @param callback {function}
    -- @returns {void}
    each = function(callback)
      for key in pairs(_items) do
        callback(key)
      end
    end
  }
end

return Set
