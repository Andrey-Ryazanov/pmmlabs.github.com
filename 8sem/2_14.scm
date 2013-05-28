; 14. ���������, �������� �� �������� ���� �������.
; ������� ������� (������ ������� �����, ������ ������� �����, 
;   ������ ��������� ������, ������ ����� ������) 
(defun smezver(x y snaid snov) 
         (cond 
         ((not (member x snov)) nil)    ;x �� �������� ����� �������� 
         ((member y snov) nil)    ;y �������� ����� �������� 
         ((member y snaid)         nil)    ;y �������� ����� ��������� �������� 
         (t       t)))     ;������� �������� ����� ������� �������� 
;����� ������� ������ (������ ��������� ������, ������ ����� ������, ������ �����) 
(defun smez(snaid snov sreb) 
         (cond 
         ((null sreb)  nil)    ;����� ������ 
         ((smezver (caar sreb) (cadar sreb) snaid snov)    ;������� ������� 
         (cons (cadar sreb) (smez snaid snov (cdr sreb))))         ;���������� � ������ 
         ((smezver (cadar sreb) (caar sreb) snaid snov)    ;������� ������� 
         (cons (caar sreb) (smez snaid snov (cdr sreb))))  ;���������� � ������ 
         (t       (smez snaid snov (cdr sreb)))))         ;������� ����� 
;����� � ������ (������ ��������� ������, ������ ����� ��������� ������, 
;     ������� ��� ������, ������ �����) 
(defun shir(snaid snov y sreb) 
(cond 
 ((null snov)         nil)    ;�� ������� �� ����� ����� ������� 
 ((member y snov)         t)       ;������� ������� 
 (t      (shir (append snaid snov) (smez snaid snov sreb) y sreb)))) ;���������� ����� ������ 
;����� ���� (������ �������, ������ �������, ������ �����) 
(defun path(x y sreb) 
         (shir nil (list x) y sreb)) ;����� � ������ 
;������� ������ (������ �������, ������ ������, ������ �����) 
(defun perebor(fver sver sreb) 
         (cond 
 ((null sver) t)       ;����� �������� 
 ((path fver (car sver) sreb)     (perebor fver (cdr sver) sreb)) ;���� ������ 
 (t      nil)))  ;��� ���� 
;����������� ����������� �����(������ ������, ������ �����) 
(defun svgraf(sver sreb) 
 (perebor (car sver) (cdr sver) sreb))          ;������� ������ � ����� ���� �� ������ ������� �� ���� ��������� 