module NagyBead where

import Data.Either
import Data.Maybe

import Text.Read (readMaybe)
import Data.Char (isSpace)

data Dir = InfixL | InfixR deriving (Show, Eq, Ord)

data Tok a
  = BrckOpen
  | BrckClose
  | TokLit a
  | TokBinOp (a -> a -> a) Char Int Dir

instance Show a => Show (Tok a) where
  show BrckOpen = "BrckOpen"
  show BrckClose = "BrckClose"
  show (TokLit x) = "TokLit " ++ show x
  show (TokBinOp _ sym prec dir) = "TokBinOp '" ++ [sym] ++ "' " ++ show prec ++ " " ++ show dir

instance Eq a => Eq (Tok a) where
  BrckOpen == BrckOpen = True
  BrckClose == BrckClose = True
  (TokLit x) == (TokLit y) = x == y
  (TokBinOp _ sym1 prec1 dir1) == (TokBinOp _ sym2 prec2 dir2) = sym1 == sym2 && prec1 == prec2 && dir1 == dir2
  _ == _ = False

basicInstances = 0 -- Mágikus tesztelőnek kell ez, NE TÖRÖLD!

type OperatorTable a = [(Char, (a -> a -> a, Int, Dir))]

tAdd, tMinus, tMul, tDiv, tPow :: (Floating a) => Tok a
tAdd = TokBinOp (+) '+' 6 InfixL
tMinus = TokBinOp (-) '-' 6 InfixL
tMul = TokBinOp (*) '*' 7 InfixL
tDiv = TokBinOp (/) '/' 7 InfixL
tPow = TokBinOp (**) '^' 8 InfixR

operatorTable :: (Floating a) => OperatorTable a
operatorTable =
    [ ('+', ((+), 6, InfixL))
    , ('-', ((-), 6, InfixL))
    , ('*', ((*), 7, InfixL))
    , ('/', ((/), 7, InfixL))
    , ('^', ((**), 8, InfixR))
    ]

operatorFromChar :: OperatorTable a -> Char -> Maybe (Tok a)
operatorFromChar table c = do
  (op, precedence, direction) <- lookup c table
  return $ TokBinOp op c precedence direction

getOp :: (Floating a) => Char -> Maybe (Tok a)
getOp = operatorFromChar operatorTable

parseTokens :: (Read a, Floating a) => OperatorTable a -> String -> Maybe [Tok a]
parseTokens table = fmap concat . mapM (parseToken table) . wordsBy isSpace

wordsBy :: (Char -> Bool) -> String -> [String]
wordsBy p s = case dropWhile p s of
  "" -> []
  s' -> w : wordsBy p s''
    where (w, s'') = break p s'

parseToken :: (Read a, Floating a) => OperatorTable a -> String -> Maybe [Tok a]
parseToken table str
  | all (== '(') str = Just (replicate (length str) BrckOpen)
  | all (== ')') str = Just (replicate (length str) BrckClose)
  | length str == 1 = case getOp (head str) of
      Just op -> Just [op]
      Nothing -> case readMaybe str of
        Just lit -> Just [TokLit lit]
        Nothing -> Nothing
  | otherwise = case readMaybe str of
      Just lit -> Just [TokLit lit]
      Nothing -> Nothing

parse :: String -> Maybe [Tok Double]
parse = parseTokens operatorTable

shuntingYardBasic :: [Tok a] -> ([a], [Tok a])
shuntingYardBasic = go [] []
  where
    go lits ops [] = (lits, ops)
    go lits ops (TokLit x : ts) = go (x : lits) ops ts
    go lits ops (BrckOpen : ts) = go lits (BrckOpen : ops) ts
    go lits ops (BrckClose : ts) = let (newLits, newOps) = processUntilOpen lits ops in go newLits newOps ts
    go lits ops (op@(TokBinOp _ _ _ _) : ts) = go lits (op : ops) ts

    processUntilOpen lits (BrckOpen : ops) = (lits, ops)
    processUntilOpen (x:y:lits) (TokBinOp f _ _ _ : ops) = processUntilOpen (f y x : lits) ops
    processUntilOpen _ _ = error "Mismatched parentheses or insufficient literals"

parseAndEval :: (String -> Maybe [Tok a]) -> ([Tok a] -> ([a], [Tok a])) -> String -> Maybe ([a], [Tok a])
parseAndEval parse eval input = maybe Nothing (Just . eval) (parse input)

syNoEval :: String -> Maybe ([Double], [Tok Double])
syNoEval = parseAndEval parse shuntingYardBasic

syEvalBasic :: String -> Maybe ([Double], [Tok Double])
syEvalBasic = parseAndEval parse (\t -> shuntingYardBasic $ BrckOpen : (t ++ [BrckClose]))

shuntingYardPrecedence :: [Tok a] -> ([a], [Tok a])
shuntingYardPrecedence = go [] []
  where
    go lits ops [] = (lits, ops)
    go lits ops (TokLit x : ts) = go (x : lits) ops ts
    go lits ops (BrckOpen : ts) = go lits (BrckOpen : ops) ts
    go lits ops (BrckClose : ts) = let (newLits, newOps) = processUntilOpen lits ops in go newLits newOps ts
    go lits ops (op@(TokBinOp _ _ prec dir) : ts) = 
      let (newLits, newOps) = processOps lits ops prec dir in go newLits (op : newOps) ts

    processUntilOpen lits (BrckOpen : ops) = (lits, ops)
    processUntilOpen (x:y:lits) (TokBinOp f _ _ _ : ops) = processUntilOpen (f y x : lits) ops
    processUntilOpen _ _ = error "Mismatched parentheses or insufficient literals"

    processOps lits (op@(TokBinOp _ _ prec' dir') : ops) prec dir
      | prec' > prec || (prec' == prec && dir == InfixL) = 
          let (newLits, newOps) = processOps (applyOp lits op) ops prec dir in (newLits, newOps)
    processOps lits ops _ _ = (lits, ops)

    applyOp (x:y:lits) (TokBinOp f _ _ _) = f y x : lits
    applyOp _ _ = error "Insufficient literals for operation"

syEvalPrecedence :: String -> Maybe ([Double], [Tok Double])
syEvalPrecedence = parseAndEval parse (\t -> shuntingYardPrecedence $ BrckOpen : (t ++ [BrckClose]))

-- eqError-t vedd ki a kommentből, ha megcsináltad az 1 pontos "Hibatípus definiálása" feladatot
-- eqError = 0 -- Mágikus tesztelőnek szüksége van rá, NE TÖRÖLD!

{-
-- Ezt akkor vedd ki a kommentblokkból, ha a 3 pontos "A parser és az algoritmus újradefiniálása" feladatot megcsináltad.
parseAndEvalSafe ::
    (String -> ShuntingYardResult [Tok a]) ->
    ([Tok a] -> ShuntingYardResult ([a], [Tok a])) ->
    String -> ShuntingYardResult ([a], [Tok a])
parseAndEvalSafe parse eval input = either Left eval (parse input)

sySafe :: String -> ShuntingYardResult ([Double], [Tok Double])
sySafe = parseAndEvalSafe
  (parseSafe operatorTable)
  (\ts -> shuntingYardSafe (BrckOpen : ts ++ [BrckClose]))
-}

{-
-- Ezt akkor vedd ki a kommentblokkból, ha az 1 pontos "Függvénytábla és a típus kiegészítése" feladatot megcsináltad.
tSin, tCos, tLog, tExp, tSqrt :: Floating a => Tok a
tSin = TokFun sin "sin"
tCos = TokFun cos "cos"
tLog = TokFun log "log"
tExp = TokFun exp "exp"
tSqrt = TokFun sqrt "sqrt"

functionTable :: (RealFrac a, Floating a) => FunctionTable a
functionTable =
    [ ("sin", sin)
    , ("cos", cos)
    , ("log", log)
    , ("exp", exp)
    , ("sqrt", sqrt)
    , ("round", (\x -> fromIntegral (round x :: Integer)))
    ]
-}

{-
-- Ezt akkor vedd ki a kommentblokkból, ha a 2 pontos "Függvények parse-olása és kiértékelése" feladatot megcsináltad.
syFun :: String -> Maybe ([Double], [Tok Double])
syFun = parseAndEval
  (parseWithFunctions operatorTable functionTable)
  (\t -> shuntingYardWithFunctions $ BrckOpen : (t ++ [BrckClose]))
-}

{-
-- Ezt akkor vedd ki a kommentblokkból, ha minden más feladatot megcsináltál ez előtt.
syComplete :: String -> ShuntingYardResult ([Double], [Tok Double])
syComplete = parseAndEvalSafe
  (parseComplete operatorTable functionTable)
  (\ts -> shuntingYardComplete (BrckOpen : ts ++ [BrckClose]))
-}
