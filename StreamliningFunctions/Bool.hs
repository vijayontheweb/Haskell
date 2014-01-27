--An algebraic data type can have more than one value constructor:

data Bool = False | True

--The Bool type has two value constructors, True and False. Each value constructor is
--separated in the definition by a | character, which we can read as “or”—we can construct
--a Bool that has the value True, or the value False. When a type has more than
--one value constructor, they are usually referred to as alternatives or cases. We can use
--any one of the alternatives to create a value of that type.