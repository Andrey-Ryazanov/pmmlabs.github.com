#!/bin/bash
# 2. ���� ��� ����������, �������� ������, ��������� ����� �������� ������, ������� ���� � � �����, � � ������ ����������.
du -ab $1 | awk '{ if ($1 != 0) print $2 }' | xargs -I _ basename _ | sort > tmp
du -ab $2 | awk '{ if ($1 != 0) print $2 }' | xargs -I _ basename _ | sort | join - tmp
rm tmp