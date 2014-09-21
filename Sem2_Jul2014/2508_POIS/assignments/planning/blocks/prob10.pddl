
(define
	(problem blocks-10)
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
			- block
	)
	(:init
		(arm-free)
		(on-table b0)
		(on b1 b4)
		(clear b1)
		(on-table b2)
		(on b3 b5)
		(on b4 b3)
		(on b5 b2)
		(on-table b6)
		(on b7 b6)
		(on b8 b7)
		(clear b8)
		(on b9 b0)
		(clear b9)
	)
	(:goal
		(and
			(on b0 b1)
			(on b1 b4)
			(on b2 b0)
			(clear b2)
			(on-table b3)
			(on b4 b5)
			(on b5 b3)
			(on-table b6)
			(clear b6)
			(on-table b7)
			(clear b7)
			(on b8 b9)
			(clear b8)
			(on-table b9)
		)
	)
)

