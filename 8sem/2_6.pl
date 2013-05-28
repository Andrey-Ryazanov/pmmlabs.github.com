% 6. ���������� ������������ ���������� �������� ����� � ������.
% ������ = tr(<�������� ����>,<����� �����>,<������ �����>).

% ���������:
% tree_weight(<������>,RES).

% ��� ������� ������ ���������� ������������ ���������� �����, 
% ������� ����������� �� ����� ������. ����� ���������� ������ ������, 
% ���������� ������ �������� ������� � ��� ������������� �������� ��� ����������� ������ ������.

% ������:
% tree_weight(tr(1,tr(1,tr(1,void,void),tr(1,void,void)),tr(1,tr(1,void,void),tr(1,void,void))),SHIRINA).

%% ������� ������������ �������� �� ������.
 
max_from_list([],RES):- RES=0. %������������ ������� �� ������� ������ = 0
 
max_from_list([X|TAIL],RES) :-  %���� ������ ������� ������ ������ ���������
  max_from_list(TAIL,RES1),     %�� �������������� ������ - �� �������� �����
  X<RES1,                       %��������� �� ����������� ������ (�� ��� ��� �����)
  !,                            %������ �� ����, ������� ���������
  RES=RES1.
 
max_from_list([X|_],RES) :-     %���� �� ��������� ���������� �������, �� ��������
  RES=X.                        %����� ������� �������� �������� ������
 
 
%������� ��� ������ �����������
 
add([],X,RES) :- RES=X.        %�������� ������ � ������ = ��� �� ������
 
add(X,[],RES) :- RES=X.        %�������� ������ � ������ = ��� �� ������
 
add([H1|T1],[H2|T2], RES) :- 
  T is H1+H2,                  %�������� ����� ������ ��������� �
  add(T1,T2,RES2),             %��������� ������ �������
  append([T],RES2,RES).        %��������� � �������� ������ ����� ������ ���������
 
%������ �� ������ ������, ������� �������� ���������� ����� ����������
%�� ���� ���� ������ ����� ������ ���, � ���������� ��, �� ������ ����� ���������
%[1,2,4,0]- �� ������ ������ 1 ������� - ������, �� ������ - ���, �� ������� - 4, 
%�� ��������� - 0
 
tree_list(void,[0]).           %������ ������ �������� 0 ����� �� ���� ������ 
 
tree_list(tr(_,L,R),D) :-      
  tree_list(L,T1),             %�������� ������ ���������� ����� ������ ������
  tree_list(R,T2),             %�������� ������ ���������� ����� ������� ������
  add(T1,T2,RES),              %��������� ������ �����������
  append([1],RES,D).           %��������� ������� � ������ ������ (������� ������)
 
 
%������� ������ ������
tree_weight(Tree,RES):-       
  tree_list(Tree,List),        %�������� ������ ���������� ����� ������ ���������� 
  max_from_list(List,RES).     %������� �������� �� ����� ������, �� ����� ����� ������