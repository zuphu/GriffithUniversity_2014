
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
		(holding b0 b3)
		(clear b0)
		(on-table b1)
		(clear b1)
		(holding b2 b4)
		(holding b3 b2)
		(on-table b4)
	)
	(:goal
		(and
			(holding b0 b2)
			(clear b0)
			(holding b1 b3)
			(on-table b2)
			(on-table b3)
			(holding b4 b1)
			(clear b4)
		)
	)
)

