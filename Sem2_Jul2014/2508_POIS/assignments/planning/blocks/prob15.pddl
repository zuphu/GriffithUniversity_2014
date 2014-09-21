
(define
	(problem blocks-15)
	(:domain blocks)
	(:objects
		b0
		b1
		b2
		b3
		b4
		b5
		b6
		b7
		b8
		b9
		b10
		b11
		b12
		b13
		b14
			- block
	)
	(:init
		(arm-free)
		(on b0 b7)
		(on b1 b10)
		(on b2 b13)
		(clear b2)
		(on b3 b9)
		(clear b3)
		(on-table b4)
		(on-table b5)
		(on b6 b11)
		(clear b6)
		(on-table b7)
		(on b8 b0)
		(on b9 b4)
		(on b10 b8)
		(on-table b11)
		(on b12 b1)
		(clear b12)
		(on b13 b5)
		(on-table b14)
		(clear b14)
	)
	(:goal
		(and
			(on b0 b8)
			(on-table b1)
			(on b2 b5)
			(clear b2)
			(on b3 b11)
			(on b4 b13)
			(clear b4)
			(on b5 b1)
			(on b6 b12)
			(on b7 b14)
			(clear b7)
			(on b8 b10)
			(on-table b9)
			(on b10 b6)
			(on-table b11)
			(on b12 b3)
			(on b13 b9)
			(on b14 b0)
		)
	)
)

