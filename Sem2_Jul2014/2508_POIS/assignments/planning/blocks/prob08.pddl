
(define
	(problem blocks-8)
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
			- block
	)
	(:init
		(arm-free)
		(on b0 b3)
		(on-table b1)
		(on b2 b1)
		(clear b2)
		(on-table b3)
		(on b4 b6)
		(clear b4)
		(on b5 b0)
		(on-table b6)
		(on b7 b5)
		(clear b7)
	)
	(:goal
		(and
			(on-table b0)
			(clear b0)
			(on b1 b2)
			(on b2 b3)
			(on-table b3)
			(on b4 b1)
			(clear b4)
			(on-table b5)
			(clear b5)
			(on-table b6)
			(on b7 b6)
			(clear b7)
		)
	)
)

