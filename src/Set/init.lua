-- Set lets you store unique values of any type
-- @param list {table}
-- @returns {table}
function Set(list)
  local self = {}
  self.items = {}
  self.size = 0

  if type(list) == 'table' then
    for _, value in ipairs(list) do
      self.items[value] = true
      self.size = self.size + 1
    end
  end

  -- Appends value to the Set object
  -- @param value {any}
  -- @returns {void}
  self.insert = function(value)
    if not self.items[value] then
      self.items[value] = true
      self.size = self.size + 1
    end
  end

  -- Checks if value is present in the Set object or not
  -- @param value {any}
  -- @returns {boolean}
  self.has = function(value)
    return self.items[value] == true
  end

  -- Removes all items from the Set object
  -- @returns {void}
  self.clear = function()
    self.items = {}
    self.size = 0
  end

  -- Removes item from the Set object and returns a boolean value asserting wheater item was removed or not
  -- @param value {any}
  -- @returns {boolean}
  self.delete = function(value)
    if self.items[value] then
      self.items[value] = nil
      self.size = self.size - 1
      return true
    end

    return false
  end

  -- Calls function once for each item present in the Set object without preserve insertion order
  -- @param callback {function}
  -- @returns {void}
  self.each = function(callback)
    for key in pairs(self.items) do
      callback(key)
    end
  end

  return self
end

return Set
