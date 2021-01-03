local utils = require('Set.utils')

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

  -- Returns a new Set that contains all items from the original Set and all items from the specified Sets
  -- @param ... {table}
  -- @returns Set
  self.union = function(...)
    local args = {...}
    local result = Set(utils.to_array(self.items))

    for _, set in ipairs(args) do
      set.each(function(value)
        result.insert(value)
      end)
    end

    return result
  end

  -- Returns a new Set that contains all elements that are common in all Sets
  -- @param ... {table}
  -- @returns Set
  self.intersection = function(...)
    local args = {...}
    local result = Set()

    self.each(function(value)
      local is_common = true

      for _, set in ipairs(args) do
        if not set.has(value) then
          is_common = false
          break
        end
      end

      if is_common then
        result.insert(value)
      end
    end)

    return result
  end

  -- Returns a new Set that contains the items that only exist in the original Set
  -- @param ... {table}
  -- @returns Set
  self.difference = function(...)
    local args = {...}
    local result = Set()

    self.each(function(value)
      local is_common = false

      for _, set in ipairs(args) do
        if set.has(value) then
          is_common = true
          break
        end
      end

      if not is_common then
        result.insert(value)
      end
    end)

    return result
  end

  return self
end

return Set
