syn match constantKey /\v<[_A-Z]+>/
syn cluster jsExpression add=constantKey


hi def link constantKey   Constant
hi def link jsFuncCall    Title
hi def link jsFunctionKey Function
hi def link jsFuncArgs    Identifier


