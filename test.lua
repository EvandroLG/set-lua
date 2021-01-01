local test = require('simple_test')
local Set = require('Set')

local list = Set({ 'lua', 'javascript', 'ruby' })

test('items', function(_assert)
  _assert.deep_equal(
    list.items(),
    { ['lua'] = true, ['javascript'] = true, ['ruby'] = true }
  )

  _assert.equal(list.size(), 3)
end)

test('insert', function(_assert)
  list.insert('c++')
  list.insert('typescript')

  _assert.ok(list.has('c++'))
  _assert.ok(list.has('typescript'))
  _assert.equal(list.size(), 5)
end)

test('has', function(_assert)
  _assert.ok(list.has('lua'))
  _assert.ok(list.has('javascript'))
  _assert.ok(list.has('ruby'))
  _assert.not_ok(list.has('python'))
end)

test('delete', function(_assert)
  _assert.ok(list.delete('javascript'))
  _assert.not_ok(list.has('javascript'))
  _assert.equal(list.size(), 4)

  _assert.not_ok(list.delete('python'))
  _assert.not_ok(list.has('python'))
  _assert.equal(list.size(), 4)
end)

test('each', function(_assert)
  local keys = {}
  list.each(function(k)
    table.insert(keys, k)
  end)

  _assert.deep_equal(
    table.sort(keys),
    table.sort({ 'lua', 'ruby', 'typescript', 'c++' })
  )
end)
