; 11. ������������� ������, I-�� ������� �������� �������� ����� ������ I ��������� ��������� ������
(define 
	(Solve arg)
	(define (f _res _list)
		(let ((tmp (+ _res (car  _list))))
			(if (null? (cdr _list))
				(list tmp)
				(append (list tmp) (f tmp (cdr _list)))
			)
		)
	)
	(f 0 arg)
)
(Solve `(1 2 3 4 5))