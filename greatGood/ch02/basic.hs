{-
calling a function by putting a space after it and then typing out parameters
is called 'Funcation Application' which has highest precedence of all.
-}
-- function are defined in similar way as application
-- we use '=' sign when defining a function

doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

{-
expression is peace of code that returns a value.
In Haskell every expression and function must return something.
if/else is an expression so else part is mandatory.
-}
doubleSmallNumber x = if x > 100
                      then x
                      else x*2

-- funcation without parameter is called definition
interchanheable = "This string can be used interchangebly with funcation name"

{-
lists are a 'homogenous' data structure.
string is list of Char
lists can be compared lexicographicaly if the stuff they contain can be compared
-}

-- 'let' keyword define name
listOfNum = [1,2,3,4,5,6]
listOfChar = ['a','b','c']
listOfList = [[1,2,3], [4,5,6], [7,8,9]]

-- '++' operator join to list
join1 = "A" ++ " SMALL CAT"

-- ':' operator (cons operator) putting thing at the beginning of the list
prepend1 = 5:[4,3,2,1]

-- '!!' operator to get emelemt from the list, index start from 0
getElement = listOfNum !! 2

{-
null takes xs return False if list is empty.
elem takes x and xs then check that xs has element x or not.
some other funcations that operates on list are head, tail, last, init, length
reverse, take, drop, maximum, minimum, sum, product
-}
checkElementExistInList x xs = if null xs then False else x `elem` xs

{-
Ranges are a way of making lists that are arithmetic sequences of elements
that can be enumerated. like Numbers and Characters not Strings!
-}
oneTo20 = [1..20]
aToz = ['a'..'z']

-- the first 24 multiples of 13, we could do [13,26..24*13]

-- to make list from 20 to 1, we can't do [20..1]
twentyTo1 = [20,19..1]

{-
cycle takes a list and cycles it into infinite loop
repeat takes element and produces and infinite list
-}
cycle123 = take 10 (cycle [1,2,3])
-- [1,2,3,1,2,3,1,2,3,1]

repeat5 = take 10 (repeat 5)
-- [5,5,5,5,5,5,5,5,5,5]


replicate10ThreeTimes = replicate 3 10
-- [10,10,10]

{-
Set comprehension S = {2 · x|x ∈ N,x ≤ 10}
same we can write List comprehension.
with Predicates it called 'filtering'
-}
withoutPredicate = [x*2 | x <- [1..10]]
-- [2,4,6,8,10,12,14,16,18,20]

withPredicate = [x*2 | x <- [1..10], x*2 <= 10]
-- [2,4,6,8,10]

boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" |  x <- xs, odd x]

-- several predicates
excludeSome = [x | x <- [1..10], x /= 4, x /= 7]
-- [1,2,3,5,6,8,9,10]

-- mulitple variable
possibleProductLessThan50 = [x*y | x <- [2,5,10], y <- [8, 10, 11], x*y < 50]
-- [16,20,22,40]

length' xs = sum [1 | _ <- xs]

-- filtering on list of lists
xss = [[1,32,3,4,53,4], [1..10], [1,2,4,2,1,6,3,1]]
filteringOnXss = [[x | x <- xs, even x] | xs <- xss]
-- [[32,4,4],[2,4,6,8,10],[2,4,2,6]]

{-
Tuples don't have to be homogenous. Unlike a list, a tuple can contain
a combination of several types.
tuples of different sizes have different types.
-}
tuple1 = (1, "one")
tupleList1 = [("a", 23), ("b", 29)]

-- this won't compile [("a", 23), ("b", "error", 54), ("c", 29)]
-- beacuse list can't contain multiple types, and different size of tuple has different type

-- zip produces list of pair, length depends on smallest list
-- [1..] is infinite list.
zipFour = zip [1..] ["one", "two", "three", "four"]
-- [(1,"one"),(2,"two"),(3,"three"),(4,"four")]

rightTriagnles = [(a,b,c) |
                c <- [1..5], b <- [1..c], a <- [1..b],
                a^2 + b^2 == c^2]
-- [(3,4,5)]


{-
common pattern in functional programming is you take a starting set of
solutions and then you apply transformations to those solutions and
filter them until you get the right ones.
-}
