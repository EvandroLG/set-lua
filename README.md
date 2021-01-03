# set-lua &middot; [![Build Status](https://travis-ci.org/EvandroLG/set-lua.svg?branch=master)](https://travis-ci.org/EvandroLG/set-lua) [![license](https://badgen.now.sh/badge/license/MIT)](./LICENSE)
`set-lua` is a complete implementation of the Set data structure.

> In computer science, a set is an abstract data type that can store unique values, without any particular order. It is a computer implementation of the mathematical concept of a finite set. Unlike most other collection types, rather than retrieving a specific element from a set, one typically tests a value for membership in a set. - Wikipedia

## Installation
To install `set-lua`, run:

```sh
$ luarocks install set-lua
```

## Usage
```lua
local Set = require('Set')
local list = Set({ 'banana', 'apple', 'kiwi' })

list.has('banana') -- true
list.has('orange') -- false

list.delete('banana') -- true

list.insert('orange')
list.has('orange') -- true
```

## API
### Properties
* Set.<code>items:table</code><br />
Items presented in Set.

* Set.<code>size:number</code><br />
Current Set length.

### Methods
* Set.<code>insert(value:any):void</code><br />
Appends value to the Set object.

* Set.<code>has(value:any):boolean</code><br />
Checks if value is present in the Set object or not.

* Set.<code>clear():void</code><br />
Removes all items from the Set object.

* Set.<code>delete(value:any):boolean</code><br />
Removes item from the Set object and returns a boolean value asserting wheater item was removed or not.

* Set.<code>each(callback:function):void</code><br />
Removes item from the Set object and returns a boolean value asserting wheater item was removed or not.

* Set.<code>every(callback:function):boolean</code><br />
Returns true whether all items pass the test provided by the callback function.

* Set.<code>union(s1[, s2, ...]: Set):Set</code><br />
Returns a new Set that contains all items from the original Set and all items from the specified Sets.

* Set.<code>intersection(s1[, s2, ...]: Set):Set</code><br />
Returns a new Set that contains all elements that are common in all Sets.

* Set.<code>difference(s1[, s2, ...]: Set):Set</code><br />
Returns a new Set that contains the items that only exist in the original Set.

* Set.<code>difference(s1[, s2, ...]: Set):Set</code><br />
Returns a new Set that contains the items that only exist in the original Set.

* Set.<code>symmetric_difference(s2: Set):Set</code><br />
Returns a symetric difference of two Sets.

* Set.<code>is_superset(subset: Set):boolean</code><br />
Returns true if set has all items present in the subset.

## License
[MIT](./LICENSE)
