module GLua.AST where

import GLua.TokenTypes

data AST = AST deriving (Show)

data AReturn = AReturn [Expr] deriving (Show)

data FuncName = FuncName [MToken] (Maybe MToken) deriving (Show)-- name(.name)*(:name)?

data Var = Var MToken | TblIndexExpr PrefixExp Expr | TblIndexStr PrefixExp MToken deriving (Show)

data PrefixExp = PfVar Var | FuncCall FunctionCall | PFExp Expr deriving (Show)

data FunctionCall = FC PrefixExp Args | FCMeta PrefixExp MToken Args deriving (Show)

data Expr = ANil | AFalse | ATrue | ANumber String | AString MToken | AVarArg | AFunctionDef {- todo -} | APrefixExpr PrefixExp | ATableConstructor [Field]
            | BinOpExpr Expr BinOp Expr
            | UnOpExpr UnOp Expr deriving (Show)

data Args = ListArgs [Expr] | TableArg [Field] | StringArg MToken deriving (Show)

data Field = ExprField Expr Expr | NamedField MToken Expr | UnnamedField Expr deriving (Show)

data BinOp = APlus | BinMinus | AMultiply | ADivide | AModulus | APower | AConcatenate |
             ALT | ALEQ | AGT | AGEQ | AEq | ANEq | AAnd | AOr deriving (Show)

data UnOp = UnMinus | ANot | AHash deriving (Show)
