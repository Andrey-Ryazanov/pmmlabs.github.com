#!/bin/bash
# 3. ����� � ������� ���������� ��� ����������� �����, ���������� shell-���������, �.�. ������������ � ����� ��������.
for a in $(find . -type f)
do 
    if [ head -1 $a | grep "^#!/bin/bash" ] && [ -x $a ]
    then echo $a
    fi
done