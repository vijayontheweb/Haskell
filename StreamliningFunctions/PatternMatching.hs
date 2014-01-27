-- To find out more about a type, we can use :info
-- To find out more about a data constructor, we can use :type

-- Pattern matching
--If we have a value of some type, there are two things we would like to be able to do:
--1)If the type has more than one value constructor, we need to be able to tell which value constructor was used to create the value.
--2)If the value constructor has data components, we need to be able to extract those values.
--A pattern lets us look inside a value and bind variables to the data it contains.
myNot True = False
myNot False = True
-- add.hs
sumList (x:xs) = x + sumList xs
sumList [] = 0
-- file: ch03/Tuple.hs
third (a, b, c) = c
--Type Synonyms
--We can introduce a synonym for an existing type at any time, in order to give a type a
--more descriptive name
--For example, instead of this
--data EmployeeType = EmployeeData Int String	deriving (Show)
--we can use a more descriptive name like this
data EmployeeType = EmployeeData EmpNo EmpName deriving (Show)
type EmpNo = Int
type EmpName = String

--We can pattern match on an algebraic data type using its value constructors.
--The compiler can infer the types of the accessor functions based on the constructor
--that we’re using in our pattern
data BookInfo = Book Int String [String] deriving (Show)
bookID (Book id title authors) = id
bookTitle (Book id title authors) = title
bookAuthors (Book id title authors) = authors
nicerID (Book id _ _ ) = id
nicerTitle (Book _ title _ ) = title
nicerAuthors (Book _ _ authors) = authors
-- file: ch03/BookStore.hs
type CustomerID = Int
type Address = [String]
data Customer = Customer {
	customerID :: CustomerID
	, customerName :: String
	, customerAddress :: Address
	} deriving (Show)
-- file: ch03/BookStore.hs
customer2 = Customer {
	customerID = 271828
	, customerAddress = ["1048576 Disk Drive","Milpitas, CA 95134","USA"]
	, customerName = "Jane Q. Citizen"
	}
--DeepFetchPattern. This is used to fetch deep into the pattern
deep(a,b:bs)=(a,bs)
--WildCardPattern. 	We can indicate that we don’t care what is present in part of a pattern. The notation
--for this is the underscore character (_), which we call a wild card
wildcard _ _ x = x

--Exhaustive Patterns and Wild Cards
--Failing to cover the check for an empty constructor
badExample(x:xs) = x+badExample xs
--will result in
--Main> badExample [1..10]
--Exception: PatternMatching.hs:39:1-34: Non-exhaustive patterns in function badExample

--If we need to provide a default behaviour in cases where we don’t care about specific
--constructors, we can use a wild card pattern
goodExample(x:xs) = x + goodExample(xs)
goodExample _ = 0
--will result in
--Main> goodExample [1..10]
--55
--Main> goodExample []
--0


--Record Syntax
--the language addresses boilerplate problem: we can define a data type, and accessors for each of its components, simultaneously.
--Record syntax adds a more verbose notation for creating a value. This can sometimes make code more readable
--Note:The positions of the commas here is a matter of preference

data ProductType = ProductData {
pID :: ProductID
, pName :: String
, pDetails :: ProductDetails
} deriving (Show)

type ProductID = Int
type ProductDetails = [String]