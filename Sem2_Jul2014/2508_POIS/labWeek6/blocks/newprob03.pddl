
(define
	(problem blocks-5)
	(:domain blocks)
	(:objects
		b0
		b3
		b2
		b1
		b4
			- block
	)
	(:init
		(arm-free)
		(on b0 b3)
		(clear b0)
		(on-table b4)
		(on b1 b4)
		(on b2 b1)
		(on b3 b2)
		(on b0 b3)
	)
	(:goal
		(and
			(on b1 b0)
			(on b2 b1)
			(on b3 b2)
			(on b4 b3)
			(on-table b0)
			(clear b4)
		)
	)
)

