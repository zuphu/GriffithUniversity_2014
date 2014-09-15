
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
		(on-table b0)
		(on b1 b2)
		(clear b1)
		(on b2 b0)
	)
	(:goal
		(and
			(on-table b0)
			(on b1 b0)
			(clear b1)
			(on-table b2)
			(clear b2)
		)
	)
)


