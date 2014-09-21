
(define
	(problem blocks-3)
	(:domain blocks)
	(:objects
		b0
		b1
		b2
			- block
	)
	(:init
		(arm-free)
		(on b0 b1)
		(on-table b1)
		(on b2 b0)
		(clear b2)
	)
	(:goal
		(and
			(on-table b0)
			(on-table b1)
			(clear b1)
			(on b2 b0)
			(clear b2)
		)
	)
)

