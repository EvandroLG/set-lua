local test = require('simple_test')
local Set = require('Set')

local list = Set({ 'lua', 'javascript', 'ruby' })

test('has', function(_assert)
  _assert.ok(list.has('lua'))
  _assert.ok(list.has('javascript'))
  _assert.ok(list.has('ruby'))
  _assert.not_ok(list.has('python'))
end)

test('delete', function(_assert)
  _assert.ok(list.delete('javascript'))
  _assert.not_ok(list.has('javascript'))

  _assert.not_ok(list.delete('python'))
  _assert.not_ok(list.has('python'))
end)

test('each', function(_assert)
  list.insert('typescript')
  list.insert('c++')

  local keys = {}
  list.each(function(k)
    table.insert(keys, k)
  end)

  _assert.deep_equal(
    table.sort(keys),
    table.sort({ 'lua', 'ruby', 'typescript', 'c++' })
  )
end)