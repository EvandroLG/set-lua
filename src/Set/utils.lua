return {
  to_array = function(hash)
    local output = {}

    for key in pairs(hash) do
      table.insert(output, key)
    end

    return output
  end
}
