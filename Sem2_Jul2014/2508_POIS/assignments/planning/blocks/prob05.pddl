
(define
	(problem blocks-5)
	(:domain blocks)
	(:objects
		b0
		b1
		b2
		b3
		b4
			- block
	)
	(:init
		(arm-free)
		(on b0 b4)
		(clear b0)
		(on-table b1)
		(clear b1)
		(on b2 b3)
		(clear b2)
		(on-table b3)
		(on-table b4)
	)
	(:goal
		(and
			(on-table b0)
			(on b1 b0)
			(on b2 b1)
			(on b3 b4)
			(clear b3)
			(on b4 b2)
		)
	)
)

