% 14. Проверить, является ли заданный граф связным.
% Вызов: is_connected.

edge(a, c).
edge(a, b).
edge(c, d).
edge(b, d).
edge(e, d).
 
e(A,B):-edge(A,B);edge(B,A). %считаем, что граф не правильный
 
%вспомогательный предикат member(E,L),проверяет, принадлежит ли E списку L
member(H,[H|_]). %елси элемент равен голове, то да
member(X,[_|Tail]):-member(X,Tail). %если элемент встречается в хвосте, то тоже да
 
path(A,B,P):-p(A,[B],P).%Ищем путь из конечной вершины в начальную. Исходный путь будет состоять из одной вершины
 
p(A,[A|Tail],[A|Tail]).%если текущая вершина в пути равна начальной, то этот путь является искомым
p(A,[B|Tail],P):-e(B,C),not(member(C,Tail)),p(A,[C,B|Tail],P). %B-текущая вершина пути
 
%not_connected - вспомогательный предикат, проверяет, есть ли в графе несвязная пара вершин
not_connected:-e(A,_),e(B,_),A\=B,not(path(A,B,_)).%истенен, если есть 2 вершины, для которых не выполним предикат path
 
%is_connected
is_connected:-not(not_connected).%граф связный, если нет пары несвязных вершин