
(define
	(problem carrier-25)
	(:domain carrier)
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
		b15
		b16
		b17
		b18
		b19
		b20
		b21
		b22
		b23
		b24
			- ball
	)
	(:init
		(robot-at rooma)
		(free left)
		(free right)
		(ball-at b0 rooma)
		(ball-at b1 rooma)
		(ball-at b2 roomb)
		(ball-at b3 rooma)
		(ball-at b4 roomb)
		(ball-at b5 roomb)
		(ball-at b6 roomb)
		(ball-at b7 roomb)
		(ball-at b8 roomb)
		(ball-at b9 roomb)
		(ball-at b10 roomb)
		(ball-at b11 rooma)
		(ball-at b12 rooma)
		(ball-at b13 rooma)
		(ball-at b14 rooma)
		(ball-at b15 rooma)
		(ball-at b16 rooma)
		(ball-at b17 rooma)
		(ball-at b18 roomb)
		(ball-at b19 roomb)
		(ball-at b20 roomb)
		(ball-at b21 rooma)
		(ball-at b22 roomb)
		(ball-at b23 rooma)
		(ball-at b24 rooma)
	)
	(:goal
		(and
			(ball-at b0 roomb)
			(ball-at b1 roomb)
			(ball-at b2 rooma)
			(ball-at b3 roomb)
			(ball-at b4 rooma)
			(ball-at b5 rooma)
			(ball-at b6 rooma)
			(ball-at b7 rooma)
			(ball-at b8 rooma)
			(ball-at b9 rooma)
			(ball-at b10 rooma)
			(ball-at b11 roomb)
			(ball-at b12 roomb)
			(ball-at b13 roomb)
			(ball-at b14 roomb)
			(ball-at b15 roomb)
			(ball-at b16 roomb)
			(ball-at b17 roomb)
			(ball-at b18 rooma)
			(ball-at b19 rooma)
			(ball-at b20 rooma)
			(ball-at b21 roomb)
			(ball-at b22 rooma)
			(ball-at b23 roomb)
			(ball-at b24 roomb)
		)
	)
)

