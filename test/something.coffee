describe "using something", ->

  describe "without include", ->
    it "should throw an error", ->
      (() -> [{ a: 1 }, { b: 2 }].should.something.that.deep.equals { b: 2 }).
        should.throw "cannot use something without include or contains"


  describe "when something has already been used", ->
    it "should throw an error", ->
      (() -> [].should.include.something.that.something).
        should.throw "cannot use something twice in an assertion"


describe "an object without length", ->
  nonLengthObject = {}

  it "fails to include something", ->
    (() -> nonLengthObject.should.include.something.that.deep.equals { a: 1 }).
      should.throw "expected {} to have a property 'length'"

  it "fails not to include something", ->
    (() -> nonLengthObject.should.not.include.something.that.deep.equals { a: 1 }).
      should.throw "expected {} to have a property 'length'"

describe "an object without numeric length", ->
  nonNumLengthObject = { length: 'a' }

  it "fails to include something", ->
    (() -> nonNumLengthObject.should.include.something.that.deep.equals { a: 1 }).
      should.throw "something object length: expected 'a' to be a number"

  it "fails not to include something", ->
    (() -> nonNumLengthObject.should.not.include.something.that.deep.equals { a: 1 }).
      should.throw "something object length: expected 'a' to be a number"


describe "an empty array", ->
  emptyArray = []

  it "does not include something", ->
    (() -> emptyArray.should.include.something.that.deep.equals { a: 1 }).
      should.throw "expected [] not to be empty"

  it "should not include something", ->
    emptyArray.should.not.include.something.that.deep.equals { a: 1 }


describe "the array [{ a: 1 }, { b: 2 }]", ->
  array = [{ a: 1 }, { b: 2 }]

  it "should include something that deep equals { b: 2 }", ->
    array.should.include.something.that.deep.equals { b: 2 }

  it "should include something that not deep equals { b: 2 }", ->
    array.should.include.something.that.not.deep.equals { b: 2 }

  it "does not include something that deep equals { c: 3 }", ->
    (() -> array.should.include.something.that.deep.equals { c: 3 }).
      should.throw "expected an element of [ { a: 1 }, { b: 2 } ] to deeply equal { c: 3 }"

  it "should not include something that deep equals { c : 3 }", ->
    array.should.not.include.something.that.deep.equals { c: 3 }

  it "should include something that not deep equals { c: 3 }", ->
    array.should.include.something.that.not.deep.equals { c: 3 }

  it "does not *not* include something that deep equals { b: 2 }", ->
    (() -> array.should.not.include.something.that.deep.equals { b: 2 }).
      should.throw "expected no element of [ { a: 1 }, { b: 2 } ] to deeply equal { b: 2 }"


describe "the array [{ a: 1 }, { a: 1 }]", ->
  array = [{ a: 1 }, { a: 1 }]

  it "should not include something that not deep equals { a: 1 }", ->
    array.should.not.include.something.that.not.deep.equals { a: 1 }

  it "does not *not* include something that deep equals { a: 1 }", ->
    (() -> array.should.not.include.something.that.deep.equals { a: 1 }).
      should.throw "expected no element of [ { a: 1 }, { a: 1 } ] to deeply equal { a: 1 }"


describe "the string 'abcde'", ->
  string = 'abcde'

  it "should include something that equals 'a'", ->
    string.should.include.something.that.equals 'a'

  it "should include something that not equals 'a'", ->
    string.should.include.something.that.not.equals 'a'

  it "does not include something that equals 'x'", ->
    (() -> string.should.include.something.that.equals 'x').
      should.throw "expected an element of 'abcde' to equal 'x'"

  it "should not include something that equals 'x'", ->
    string.should.not.include.something.that.equals 'x'

  it "should include something that not equals 'x'", ->
    string.should.include.something.that.not.equals 'x'

  it "does not *not* include something that not equals 'x'", ->
    (() -> string.should.not.include.something.that.not.equals 'x').
      should.throw "expected no element of 'abcde' to not equal 'x'"
