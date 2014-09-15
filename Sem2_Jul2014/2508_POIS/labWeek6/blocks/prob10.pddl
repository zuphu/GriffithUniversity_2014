
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
		(holding b0 b2)
		(clear b0)
		(holding b1 b8)
		(on-table b2)
		(holding b3 b1)
		(holding b4 b6)
		(holding b5 b4)
		(holding b6 b3)
		(holding b7 b5)
		(on-table b8)
		(holding b9 b7)
		(clear b9)
	)
	(:goal
		(and
			(holding b0 b3)
			(holding b1 b4)
			(holding b2 b5)
			(holding b3 b6)
			(holding b4 b2)
			(holding b5 b9)
			(holding b6 b1)
			(on-table b7)
			(clear b7)
			(holding b8 b0)
			(clear b8)
			(on-table b9)
		)
	)
)

