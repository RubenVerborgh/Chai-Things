# This file describes the behavior of the `all` property

describe "using all()", ->

describe "an object without length", ->
  nonLengthObject = 1

  it "fails to have all elements equal to assertion", ->
    (() -> nonLengthObject.should.all.equal 1).
      should.throw "since length property unavailable: expected 1 to be an object"
  it "fails not to have all elements equal to assertion", ->
    (() -> nonLengthObject.should.not.all.equal 1).
      should.throw "since length property unavailable: expected 1 to be an object"

describe "an object without numeric length", ->
  nonNumLengthObject = { length: 'a' }

  it "fails to have all elements equal to 1", ->
    (() -> nonNumLengthObject.should.all.equal 1).
      should.throw "all object length: expected 'a' to be a number"

  it "fails not to have all elements equal to 1", ->
    (() -> nonNumLengthObject.should.all.equal 1).
      should.throw "all object length: expected 'a' to be a number"


describe "an empty array's elements", ->
  emptyArray = []

  it "should trivially all equal 1", ->
    emptyArray.should.all.equal(1)

  it "should trivially all not equal 1", ->
    emptyArray.should.all.not.equal(1)

describe "an empty object's elements", ->
  emptyObject = {}

  it "should trivially all equal 1", ->
    emptyObject.should.all.equal(1)

  it "should trivially all not equal 1", ->
    emptyObject.should.all.not.equal(1)


describe "the array [1, 1]'s elements", ->
  array = [1, 1]

  it "should all equal 1", ->
    array.should.all.equal 1

  it "should all not equal 2", ->
    array.should.all.not.equal 2

  it "should not all equal 2", ->
    array.should.not.all.equal 2

  it "should not all not equal 1", ->
    array.should.not.all.not.equal 1

  it "do not all equal 2", ->
    (() -> array.should.all.equal 2).
      should.throw "expected all elements of [ 1, 1 ] to equal 2"

  it "do not all *not* equal 1", ->
    (() -> array.should.all.not.equal 1).
      should.throw "expected all elements of [ 1, 1 ] to not equal 1"

  it "do not *not* all equal 1", ->
    (() -> array.should.not.all.equal 1).
      should.throw "expected not all elements of [ 1, 1 ] to equal 1"

  it "do not *not* all not equal 2", ->
    (() -> array.should.not.all.not.equal 2).
      should.throw "expected not all elements of [ 1, 1 ] to not equal 2"

describe "the object {first: 1, second: 1}'s elements", ->
  obj = {leading: 1, trailing: 1}

  it "should all equal 1", ->
    obj.should.all.equal 1

  it "should all not equal 2", ->
    obj.should.all.not.equal 2

  it "should not all equal 2", ->
    obj.should.not.all.equal 2

  it "should not all not equal 1", ->
    obj.should.not.all.not.equal 1

  it "do not all equal 2", ->
    (() -> obj.should.all.equal 2).
      should.throw "expected all elements of { leading: 1, trailing: 1 } to equal 2"

  it "do not all *not* equal 1", ->
    (() -> obj.should.all.not.equal 1).
      should.throw "expected all elements of { leading: 1, trailing: 1 } to not equal 1"

  it "do not *not* all equal 1", ->
    (() -> obj.should.not.all.equal 1).
      should.throw "expected not all elements of { leading: 1, trailing: 1 } to equal 1"

  it "do not *not* all not equal 2", ->
    (() -> obj.should.not.all.not.equal 2).
      should.throw "expected not all elements of { leading: 1, trailing: 1 } to not equal 2"


describe "the array [1, 2]'s elements", ->
  array = [1, 2]

  it "should not all equal 1", ->
    array.should.not.all.equal 1

  it "should not all equal 2", ->
    array.should.not.all.equal 2

  it "should not all not equal 1", ->
    array.should.not.all.not.equal 1

  it "should not all not equal 2", ->
    array.should.not.all.not.equal 2

  it "do not all equal 1", ->
    (() -> array.should.all.equal 1).
      should.throw "expected all elements of [ 1, 2 ] to equal 1"

  it "do not all equal 2", ->
    (() -> array.should.all.equal 2).
      should.throw "expected all elements of [ 1, 2 ] to equal 2"

  it "do not all not equal 1", ->
    (() -> array.should.all.not.equal 1).
      should.throw "expected all elements of [ 1, 2 ] to not equal 1"

  it "do not all not equal 2", ->
    (() -> array.should.all.not.equal 2).
      should.throw "expected all elements of [ 1, 2 ] to not equal 2"


describe "the array [{ a: 'b' }, { a: 'c' }]'s elements", ->
  array = [{ a: 'b' }, { a: 'c' }]

  it "should all have property 'a'", ->
    array.should.all.have.property("a")

  it "should not all have property 'b'", ->
    (() -> array.should.all.have.property("b")).
      should.throw "expected all elements of [ { a: 'b' }, { a: 'c' } ] to have a property 'b'"

  it "should all have property 'a' not equal 'd'", ->
    array.should.all.have.property("a").not.equal("d")

  it.skip "should not all have property 'a' not equal 'c'", ->
    (() -> array.should.all.have.property("a").not.equal("c")).
      should.throw "expected all elements of [ { a: 'b' }, { a: 'c' } ] to satisfy the assertion"

