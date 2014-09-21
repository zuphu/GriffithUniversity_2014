
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
		(on-table b0)
		(on b1 b3)
		(clear b1)
		(on-table b2)
		(clear b2)
		(on b3 b11)
		(on-table b4)
		(on-table b5)
		(clear b5)
		(on b6 b10)
		(on b7 b4)
		(clear b7)
		(on b8 b6)
		(clear b8)
		(on-table b9)
		(on b10 b9)
		(on b11 b0)
	)
	(:goal
		(and
			(on b0 b10)
			(clear b0)
			(on b1 b6)
			(on b2 b8)
			(on-table b3)
			(on b4 b11)
			(clear b4)
			(on-table b5)
			(on b6 b9)
			(on b7 b2)
			(on b8 b1)
			(on b9 b5)
			(on b10 b3)
			(on b11 b7)
		)
	)
)

