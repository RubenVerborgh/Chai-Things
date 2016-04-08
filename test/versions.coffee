# This file describes the behavior of the `all` property

describe "regression testing keys()", ->

describe "1.4 assertion keys", ->
  describe "out of the box", ->
    obj = { first: 1, second: 2, third: 3}

    it "should succeed all keys, if match inclusive", ->
      obj.should.be.all.keys("first", "second", "third")

    it "should succeed all keys, fail if match subset", ->
      obj.should.contain.all.keys("second", "third")

    it "should fail not all keys, if mismatch", ->
      obj.should.not.have.all.keys("first", "second", "third", "fourth")

    it "should succeed all keys, if match subset", ->
      obj.should.contain.all.keys("second")

    it "should fail not any keys, if mismatch", ->
      obj.should.not.include.any.keys("fourth")

  describe "polyfilling any", ->
    ob_nested = {first: { foo: 1 }, second: { bar: 2 }, third: {}}

    it "should succeed some keys, if match subset", ->
      ob_nested.should.contain.any.keys("first")

    it "should succeed any keys, if match inclusive", ->
      ob_nested.should.not.include.any.keys("second", "third", "bar")

describe "3+ assertion keys", ->
  obj = { first: 1, second: 2, third: 3}

  it "should succeed all keys, if match inclusive", ->
    obj.should.be.all.keys("first", "second", "third")

  it "should succeed all keys, fail if match subset", ->
    obj.should.contain.all.keys("second", "third")

  it "should throw on all keys, if match subset", ->
    (() -> obj.should.not.be.not.all.keys("first", "second")).
      should.throw

  it "should fail on all keys, if match subset", ->
    obj.should.not.be.not.all.keys("fourth", "eigth", "sixteenth")

  it "should succeed any keys, if match inclusive", ->
    obj.should.include.any.keys("second", "third", "fourth")

  it "should fail not all keys, if mismatch", ->
    obj.should.not.have.all.keys("first", "second", "third", "fourth")

  it "should succeed some keys, if match subset", ->
    obj.should.contain.any.key("second")

  it "should succeed all keys, if match subset", ->
    obj.should.contain.all.keys("second")

  it "should fail not any keys, if mismatch", ->
    obj.should.not.include.any.keys("fourth")
