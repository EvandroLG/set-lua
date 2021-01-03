local test = require('simple_test')
local Set = require('Set')

local list = Set({ 'lua', 'javascript', 'ruby' })

test('items', function(_assert)
  _assert.deep_equal(
    list.items,
    { ['lua'] = true, ['javascript'] = true, ['ruby'] = true }
  )

  _assert.equal(list.size, 3)
end)

test('insert', function(_assert)
  list.insert('c++')
  list.insert('typescript')

  _assert.ok(list.has('c++'))
  _assert.ok(list.has('typescript'))
  _assert.equal(list.size, 5)
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
  _assert.equal(list.size, 4)

  _assert.not_ok(list.delete('python'))
  _assert.not_ok(list.has('python'))
  _assert.equal(list.size, 4)
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

test('union', function(_assert)
  local s1 = Set({ 'lua', 'ruby', 'c++' })
  local s2 = Set({ 'javascript', 'typescript', 'c++' })
  local s3 = Set({ 'lua', 'python', 'go', 'rust' })
  local expected = {
    ['lua'] = true,
    ['ruby'] = true,
    ['c++'] = true,
    ['javascript'] = true,
    ['typescript'] = true,
    ['python'] = true,
    ['go'] = true,
    ['rust'] = true,
  }

  _assert.deep_equal(
    s1.union(s2, s3).items,
    expected
  )
end)

test('intersection', function(_assert)
  local s1 = Set({ 'lua', 'ruby', 'c++' })
  local s2 = Set({ 'javascript', 'lua', 'typescript', 'c++' })
  local s3 = Set({ 'lua', 'python', 'go', 'rust', 'c++' })
  local expected = { ['lua'] = true, ['c++'] = true }

  _assert.deep_equal(
    s1.intersection(s2, s3).items,
    expected
  )
end)

test('difference', function(_assert)
  local s1 = Set({ 'lua', 'ruby', 'c++' })
  local s2 = Set({ 'javascript', 'lua', 'typescript', 'c++' })
  local s3 = Set({ 'lua', 'python', 'go', 'rust', 'c++' })
  local expected = { ['ruby'] = true }

  _assert.deep_equal(
    s1.difference(s2, s3).items,
    expected
  )
end)
