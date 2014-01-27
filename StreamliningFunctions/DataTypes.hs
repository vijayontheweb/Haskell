-- data BookInfo = Book Int String [String]
 				-- deriving (Show)
-- type OrderNo = Int
-- type Quantity = Int				
-- data BookOrder = BookOrder OrderNo Quantity BookInfo			
--myInfo = Book 9780135072455 "Algebra of Programming"
--		["Richard Bird", "Oege de Moor"]
--let cities = Book 173 "Use of Weapons" ["Iain M. Banks"]
-- type Bookid = Int
-- type Title = String
-- type Authors = [String]
-- data BookInfo = Book Bookid Title Authors
					-- deriving (Show)
-- type CustId = Int
-- type ReviewBody = String
-- data BookReview = Review BookInfo CustId ReviewBody
					-- deriving (Show)
-- type CardHolder = String
-- type CardNumber = String
-- type Address = [String]
-- data BillingInfo = CreditCard CardNumber CardHolder Address
				-- | CashOnDelivery
				-- | Invoice CustId
				-- deriving (Show)
	type Cash = Int
	type HardCopy = String
	type SoftCopy = String
	data NewsPaper = NPCash Cash HardCopy 
					| NPSoft SoftCopy 
					| NPNA
					deriving (Show)