
(define
	(problem blocks-12)
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
			- block
	)
	(:init
		(arm-free)
		(holding b0 b9)
		(on-table b1)
		(holding b2 b3)
		(clear b2)
		(holding b3 b4)
		(holding b4 b11)
		(holding b5 b1)
		(on-table b6)
		(clear b6)
		(holding b7 b8)
		(holding b8 b0)
		(on-table b9)
		(holding b10 b7)
		(clear b10)
		(holding b11 b5)
	)
	(:goal
		(and
			(holding b0 b5)
			(holding b1 b11)
			(clear b1)
			(holding b2 b10)
			(holding b3 b6)
			(holding b4 b0)
			(clear b4)
			(on-table b5)
			(holding b6 b2)
			(holding b7 b9)
			(on-table b8)
			(holding b9 b8)
			(holding b10 b7)
			(holding b11 b3)
		)
	)
)

