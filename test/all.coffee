# This file describes the behavior of the `all` property

describe "using all()", ->

describe "original chai all.keys implementation", ->
  simpleObj =
    foo: "foo"
    bar: "bar" 

  it "should assert keys on an object", ->
    simpleObj.should.have.all.keys ["foo", "bar"]

  it "fails if the object doesn't have all keys", ->
    (() -> simpleObj.should.have.all.keys ["foo", "bar", "baz"]).
      should.throw

describe "an object without length", ->
  nonLengthObject = {}

  it "fails to have all elements equal to 1", ->
    (() -> nonLengthObject.should.all.equal 1).
      should.throw

  it "fails not to have all elements equal to 1", ->
    (() -> nonLengthObject.should.all.equal 1).
      should.throw


describe "an empty array's elements", ->
  emptyArray = []

  it "should trivially all equal 1", ->
    emptyArray.should.all.equal(1)

  it "should trivially all not equal 1", ->
    emptyArray.should.all.not.equal(1)


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
