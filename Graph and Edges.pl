

edge(a,b).  % There is an edge between a and b
edge(a,c).
edge(c,d).
edge(c,e).
edge(e,a).  % Loops back to top of tree/graph

con(X,Y) :- edge(X,Y).
con(X,Y) :- edge(X,Mid), con(Mid,Y).

connects(X, Y, [X,Y]) :- edge(X,Y).
connects(X, Y, [X|Tail]) :- edge(X,Midpoint), connects(Midpoint,Y,Tail).


% connects(a,c,[a,c,e,a,c]). %
% connects(a,c,P). %
% connects(d,e,P). %
% connects(a,End,Path). %
% connects(X,Y,[a,c,d]) % 

subsequence([], _).   
subsequence([X|Tail1], [X|Tail2]) :- subsequence(Tail1, Tail2).
subsequence([X|Tail1], [_|Tail2]) :- subsequence([X|Tail1], Tail2).

common(Sub,List1,List2) :- subsequence(Sub,List1), subsequence(Sub,List2).

%common([3],[8,3,6],[a,b,c]). false
%common([3],[8,3,6],[5,2,3]). true
%common([x,y],[a,x,z,b,y,n],[x,x,a,y,b]). true x2
%common(SS,[1,5,3,2,4],[9,8,5,2,11]). ss = [],5,[5,2],2
%common(SS,[7,5,4,6],[9,2,1]). ss = []


%pairSummingTo(List, Sum, Pair):-  member(X,List), member(Y,List), X+Y=Sum, Pair = [X,Y].
pairSummingTo(List, Sum, [X,Y]):-  member(X,List), member(Y,List), plus(X,Y,Sum).