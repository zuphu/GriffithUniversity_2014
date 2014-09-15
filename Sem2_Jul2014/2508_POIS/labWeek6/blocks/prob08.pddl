
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
		(on-table b0)
		(holding b1 b7)
		(holding b2 b3)
		(holding b3 b1)
		(holding b4 b6)
		(holding b5 b4)
		(clear b5)
		(holding b6 b2)
		(holding b7 b0)
	)
	(:goal
		(and
			(on-table b0)
			(clear b0)
			(holding b1 b4)
			(holding b2 b7)
			(clear b2)
			(holding b3 b6)
			(holding b4 b5)
			(on-table b5)
			(holding b6 b1)
			(holding b7 b3)
		)
	)
)

