fatorial(X,Return):- X=:=1, Return is 1.
fatorial(X,Return):- Z is X-1, fatorial(Z, W),Return is W*X.


fibonacci(X,R) :- X=:=0, R is 0.
fibonacci(X,R) :- X=:=1, R is 1.
fibonacci(X,R) :- X1 is X-1, X2 is X-2,
     fibonacci(X1,R1),fibonacci(X2,R2), R is R1+R2.


%removeList(Num,[X|_],Return):- Num =:= 0, Return


%1.Encontrar  o  maior  valor  de  uma  lista  de  valores  numéricos.
maxList([X],Return):- Return is X.
maxList([X,Y|Z], Return):- X>Y, maxList([X|Z],Return).
maxList([X,Y|Z], Return):- X<Y, maxList([Y|Z],Return).
maxList([X,Y|Z], Return):- X=:=Y, maxList([X|Z],Return).


%2.Verificar  se  dois  elementos  são  consecutivos  em  uma  list
consec(A,B,[X,Y|_]):- A=:=X, B=:=Y.
consec(A,B,[_,Y|Z]):- consec(A,B,[Y|Z]).


%3.Somar  elementos  de  uma  lista  numérica.
sumList([X],Return):- Return is X.
sumList([X|Y],Return):-  sumList(Y,Z),Return is X+Z.


%4.Encontrar  n-ésimo  elemento  de  uma  lista.
buscaIndex(Index,[X|_],Return):- Index =:= 0, Return is X.
buscaIndex(Index,[_|Y],Return):-
    X1 is Index-1, buscaIndex(X1,Y,Return).


%5.Determinar  o  número  de  elementos  de  uma  lista.
lenghtList([_],1).
lenghtList([_|Y],R):- lenghtList(Y,Z), R is 1+Z.



% 6.Dividir uma lista numérica em 2 sublistas que contenham os elementos
% iguais ou menores e os maiores que um dado elemento.

separeList([],_,X,Z,X,Z).
separeList([H|T],N,L1,L2,R1,R2):-
    H=<N, separeList(T,N,[H|L1],L2,R1,R2).
separeList([H|T],N,L1,L2,R1,R2):-
    H>N, separeList(T,N,L1,[H|L2],R1,R2).
