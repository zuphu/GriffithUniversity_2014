
(define
	(problem blocks-15)
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
		b12
		b13
		b14
			- block
	)
	(:init
		(arm-free)
		(holding b0 b3)
		(clear b0)
		(holding b1 b6)
		(holding b2 b13)
		(clear b2)
		(holding b3 b5)
		(on-table b4)
		(holding b5 b10)
		(holding b6 b14)
		(holding b7 b9)
		(holding b8 b7)
		(on-table b9)
		(holding b10 b12)
		(holding b11 b4)
		(clear b11)
		(on-table b12)
		(holding b13 b1)
		(holding b14 b8)
	)
	(:goal
		(and
			(holding b0 b3)
			(on-table b1)
			(on-table b2)
			(holding b3 b7)
			(holding b4 b2)
			(holding b5 b4)
			(holding b6 b13)
			(clear b6)
			(holding b7 b12)
			(holding b8 b5)
			(clear b8)
			(holding b9 b11)
			(holding b10 b9)
			(clear b10)
			(holding b11 b0)
			(on-table b12)
			(on-table b13)
			(holding b14 b1)
			(clear b14)
		)
	)
)

