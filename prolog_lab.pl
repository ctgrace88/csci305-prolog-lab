% Connor Grace
% CSCI 305 Prolog Lab 2

mother(M,C):- parent(M,C), female(M).
father(F,C):- parent(F,C), male(F).

spouse(H,W):- married(H,W).

child(P,C):- parent(P,C).

son(P,S):- parent(P,S), male(S).

daughter(P,D):- parent(P,D), female(D).

sibling(X,Y):- parent(P,X), parent(P,Y), not(X=Y).

brother(B,Y):- sibling(B,Y), male(B).

sister(S,Y):- sibling(S,Y), female(S).

uncle(U,Y):- brother(U,X), parent(X,Y).
uncle(U,Y):- brother(U,W), parent(W,X), spouse(X,Y).

aunt(A,Y):- sister(A,X), parent(X,Y).
aunt(A,Y):- sister(A,W), parent(W,X), spouse(X,Y).

grandparent(GP,GC):- parent(GP,P), parent(P,GC).

grandfather(GF,GC):- parent(GF,P), parent(P,GC), male(GF).
grandmother(GM,GC):- parent(GM,P), parent(P,GC), female(GM).

grandchild(GC,GP):- child(GC,P), child(P,GP).

ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(W,Y), ancestor(X,W).

descendant(X,Y):- child(X,Y).
descendant(X,Y):- child(W,Y), descendant(X,W).

older(X,Y):- born(X,W), born(Y,Z), <(W,Z).

younger(X,Y):- born(X,W), born(Y,Z), >(W,Z).

regentWhenBorn(R,B):- born(B,X), reigned(R,F,T), >(X,F), <(X,T).
