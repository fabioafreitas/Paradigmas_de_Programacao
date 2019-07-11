import Data.List
import Data.Char
{-1)Escreva  a  função  numFactors  n,  que  calcula  
o  número  de  divisores  de  n no  intervalo  1..n-}

numFactors :: Int -> [Int] -> Int
numFactors num [] = 0
numFactors num (n : ns) = 
    if (mod n num) == 0 then 1 + numFactors num ns
    else 0 + numFactors num ns
   
numFactors2 :: Int -> Int
numFactors2 n = length [x | x <- [1..n], mod n x == 0 ]   

{-2) Defina uma função que dada uma lista de inteiros 
e um número n, retorne o total de elementos de
valor superior a n.

Exemplo: retornaSup 5 [3, 2, 5, 6, 9] retorna 2-}

retornaSup :: Int -> [Int] -> Int
retornaSup n [] = 0
retornaSup n (x:xs) = 
    if x > n then 1 + retornaSup n xs
    else 0 + retornaSup n xs

retornaSup2 :: Int -> [Int] -> Int
retornaSup2 n xs = length [x | x <- xs, x > n]

{-3) Escreva uma função para realizar a união de duas 
listas. A função deve receber duas listas (sem elementos 
repetidos) e retornar uma nova lista com todos os 
elementos das listas originais sem repetições.

Exemplo: uniao [3, 6, 5, 7] [2, 9, 7, 5, 1] retorna 
[3, 6, 5, 7, 2, 9, 1]-}

pertence :: Int -> [Int] -> Bool
pertence n []  = False
pertence n (x:xs) = if n == x then True
                    else pertence n xs

uniao :: [Int] -> [Int] -> [Int]
uniao ns [] = ns
uniao x (a:b) =
    if (pertence a x) == False then uniao (x++([a])) (b)
    else uniao x b

{-4) Escreva uma função para que recebe uma lista e um número n e ele 
deve calcular a média dos elementos da lista que são maiores do que n.

Exemplo: mediaMaiores 3 [4,1,5,2,3,6]retorna 5-}

somaSup :: Int -> [Int] -> Int
somaSup n [] = 0
somaSup n (x:xs) =
    if x > n then x + somaSup n xs
    else 0 + somaSup n xs

mediaMaiores :: Int -> [Int] -> Int
mediaMaiores n [] = 0
mediaMaiores n xs = 
    if retornaSup n xs > 0 then (somaSup n xs) `div` (retornaSup n xs)
    else 0

{-5) Escreva uma função que receba duas listas de mesmo tamanho e
retorne outra lista com os elementos das listas originais intercalados.

Exemplo: intercala [1, 2, 3] [4, 5, 6] retorna [1, 4, 2, 5, 3, 6]-}

intercala :: [Int] -> [Int] -> [Int]
intercala (x:xs) [] = (x:xs)
intercala [] (x:xs) = (x:xs)
intercala (x:xs) (n:ns) = [x]++[n]++intercala xs ns

-- parte 2

{-1) Defina uma função que recebe uma lista de listas de
elementos de um tipo t (genérico) e retorna uma lista de
tuplas-2 onde o primeiro elemento é um valor do tipo t que
existe em pelo menos uma das sub-listas da entrada e o 
segundo é o número de ocorrências desse valor nas sub-listas.

Exemplos: contaOcorr ["haskell","eh","legal"] retorna
[('h',2),('a',2),('s',1),('k',1),('e',3),('l',4),('g',1)]
contaOcorr [[2,45,6,2,1],[7,7,4,3,2]] retorna
[(2,3),(45,1),(6,1),(1,1),(7,2),(4,1),(3,1)]-}

contaOcorr y = listaTupla $ concatena y

concatena [] = []
concatena(x:xs) = x++concatena xs

listaTupla x = zip (tiraRep x) (contaRep x)

contaRep [] = []
contaRep (x:xs) = 1+(length $ filter(== x) xs):(contaRep [y | y<-xs,y/=x])

tiraRep [] = []
tiraRep (x:xs) = x: (tiraRep $ filter(/=x) xs)


{-2) Um player de músicas digitais precisa ranquear as músicas de acordo com os seus nomes. O ranking
de cada música consiste na soma dos valores de cada caractere alfabético do nome de acordo com
seus valores na tabela ASCII. Por exemplo, “olhar 43” deve retornar 111(o) + 108(l) + 104(h) +
97(a) + 114(r) = 534. Assim, Crie uma função que dada uma lista de strings (lista com nomes das
músicas) retorne uma lista com os rankings de cada uma das músicas descritas na lista de entrada.
OBS: Lembre-se que as funções isAlpha e ord já estão disponíveis, onde a primeira retorna um
booleano True caso o caractere passado como parâmetro seja alfabético e False caso contrario,
enquanto que a segunda retorna o valor ordinal de um caractere de acordo com a tabela ASCII.-}

musicas = ["Feels Like We Only Go Backwards","Ten Years Gone","Afterlife","Dream On","Fortress","In My Head"]

{- Ranqueia as músicas em ordem crescente pelo valor
   ASCII de cada umma
   Recebe a lista de músicas-}
ranquearMusicas :: [[Char]] -> [[Char]]
ranquearMusicas [] = []
ranquearMusicas musicas =
    auxRanquearMusicas (musicas) (sort (listNumMusicas musicas))


-- função auxiliar de ranquearMusicas
{- Recebe a lista de musicas e a lista ordenada dessas
   musicas em seu valor numérico.
   Retorna os nomes das musicas ordenados pelo seu
   valor numérico-}
auxRanquearMusicas :: [[Char]] -> [Int] -> [[Char]]
auxRanquearMusicas num [] = [] 
auxRanquearMusicas num (n:ns) = 
    [(buscarMusica num n)] ++ auxRanquearMusicas num (ns)

-- retorna a lista de musicas em sua forma numerica
listNumMusicas :: [[Char]] -> [Int]
listNumMusicas [] = []
listNumMusicas (x:xs) =
    [valorMusica x] ++ listNumMusicas xs

-- a musica desejada buscando pelo seu numero
buscarMusica :: [[Char]] -> Int -> [Char]
buscarMusica [] n = []
buscarMusica (song:xs) num = 
    if (valorMusica song == num) then song
    else buscarMusica xs num

-- converte o nome de uma musica em sua forma numerica
valorMusica :: [Char] -> Int
valorMusica [] = 0
valorMusica (x:xs) = 
    if isAlpha x then ord x + valorMusica xs
    else 0 + valorMusica xs




{-3)Faça  um  função  que  recebe  uma  lista  de  inteiros  e  retorna 
todas  as  permutações  de  elementos  desta  lista. 

Exemplo:perms  [1,  2,  3]  retorna
[[1,  2,  3],[2,  1,  3],[2,  3,  1],[1,  3,  2],[3,  1,  2],[3,  2,  1]]-}


perm [] = [[]]
perm l = [c:r | c <- l , r <- perm(delete c l)]

conjPartes [] = [[]]
conjPartes (x:xs) =
    conjPartes xs ++ [x:ys | ys <- conjPartes xs] 
                 






{-2º (prova 2017.2)-}

valorString:: [Char] -> Int
valorString [] = 0
valorString (x:xs) = 
        if isAlpha x then (ord x) + (valorString xs)
        else 0 + valorString xs

somaCarac:: [[Char]] -> Int
somaCarac [] = 0
somaCarac (x:xs) = valorString x + somaCarac xs

{-4º (prova 2016.2)-}

formarLista :: [[Char]] -> [Int]
formarLista [] = []
formarLista (x:xs) = [(valorString x)]++formarLista xs

{-4º (prova 2015.2)-}

getIndice :: Int -> [Int] -> Int
getIndice n (x:xs) = 
    if n == x then 1 
    else 1+getIndice n xs

getMaior :: [Int] -> Int
getMaior [a] = a
getMaior (a : t) = if (a > (getMaior t)) then a
                   else (getMaior t)

getMaiorIndice :: [Int] -> (Int,Int)
getMaiorIndice x = (getMaior x, getIndice (getMaior x) x)

{-3º (prova 2016.1)-}

testCirculo [] raio = []
testCirculo ((a,b):xs) raio = 
    if ( sqrt((a*a)+(b*b)) ) <= raio
    then [(a,b)]++ testCirculo xs raio
    else []++ testCirculo xs raio


multDigitos [] = 1
multDigitos (x:xs) =
    if not (isAlpha x) then (digitToInt x)*multDigitos xs
    else 1*multDigitos xs

{-3º (prova 2016.1)-}
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------














soma 1 = 1
soma n = n + soma(n-1)

fatorial 0 = 1
fatorial n = n*fatorial(n-1)

fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci(n-1)+fibonacci(n-2)

-- algebra booleana
my_and :: Bool->Bool->Bool
my_and False _ = False
my_and _ False = False
my_and True True = True

my_or :: Bool->Bool->Bool
my_or True _ = True
my_or _ True = True
my_or False False = False

my_not :: Bool->Bool
my_not True = False
my_not False = True
---------------------

-- faz uma soma vetorial
vector_sum :: (Int,Int) -> (Int,Int) -> (Int,Int)
vector_sum (a,b) (c,d) = (a+c,b+d)

-- soma os quadrados de cada elemento de uma lista de inteiros
sum_list :: [Int] -> Int
sum_list [] = 0
sum_list (n:ns) = n + sum_list ns

quadrado :: Int -> Int
quadrado n = n*n

sum_quadrados :: [Int] -> Int
sum_quadrados ns = sum_list( map quadrado ns )
----------------------------------------------

-- retorna o tamanho da lista
size_list [] = 0
size_list (n:ns) = 1 + size_list ns

-- checa se duas listas de inteiros são iguais
equals_list :: [Int] -> [Int] -> Bool
equals_list [] [] = True
equals_list [] _  = False
equals_list _ []  = False
equals_list ns xs = if size_list ns /= size_list xs then False
                    else if head ns == head xs then equals_list (tail ns) (tail xs)
                    else False

-- passar a lista para outra auxiliar e inverter
reverse_list :: [t] -> [t]
reverse_list [] = []
reverse_list ns = reverse_aux ns []

reverse_aux :: [t] -> [t] -> [t]
reverse_aux [] ns = ns
reverse_aux (x:xs) ns = reverse_aux (xs) ([x]++ns) 



--menor :: [Int] -> int
menor [a] = a
menor (a : t) = if (a < (menor t)) then a
                else (menor t)

-- soma os quadrados de uma lista de 1 até N
sumsq :: [Int] -> Int
sumsq [] = 0
sumsq (x:xs) = x^2 + sumsq xs

-- checa se o numero é primo 
primo :: Int -> Bool
primo n = length [x | x <- [1..n],n `mod` x == 0] == 2

-- equação do segundo grau
bhaskara a b c =
    let delta = sqrt (b^2 - 4*a*c)
    in ((-b + delta)/2*a , (-b - delta)/2*a)



