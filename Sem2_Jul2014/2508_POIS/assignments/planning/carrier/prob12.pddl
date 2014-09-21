
(define
	(problem carrier-12)
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
			- ball
	)
	(:init
		(robot-at rooma)
		(free left)
		(free right)
		(ball-at b0 roomb)
		(ball-at b1 roomb)
		(ball-at b2 roomb)
		(ball-at b3 rooma)
		(ball-at b4 rooma)
		(ball-at b5 roomb)
		(ball-at b6 roomb)
		(ball-at b7 rooma)
		(ball-at b8 roomb)
		(ball-at b9 rooma)
		(ball-at b10 rooma)
		(ball-at b11 rooma)
	)
	(:goal
		(and
			(ball-at b0 rooma)
			(ball-at b1 rooma)
			(ball-at b2 rooma)
			(ball-at b3 roomb)
			(ball-at b4 roomb)
			(ball-at b5 rooma)
			(ball-at b6 rooma)
			(ball-at b7 roomb)
			(ball-at b8 rooma)
			(ball-at b9 roomb)
			(ball-at b10 roomb)
			(ball-at b11 roomb)
		)
	)
)

