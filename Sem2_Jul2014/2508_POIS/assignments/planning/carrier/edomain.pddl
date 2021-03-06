(define
	(domain carrier)
	(:requirements
		:strips :typing
	)
	(:types
		ball arm room
	)
	(:constants
		left right - arm
		rooma roomb - room
	)
	(:predicates
		(free ?a - arm)
		(robot-at ?r - room)
		(ball-at ?b - ball ?r - room)
		(holding ?a - arm ?b - ball)
	)
	(:action pick
		:parameters (?b - ball ?a - arm ?r - room)
		:precondition
			(and
				(free ?a)
				(ball-at ?b ?r)
				(robot-at ?r)
			)
		:effect
			(and
				(holding ?a ?b)
				(not (free ?a))
				(not (ball-at ?b ?r))
			)
	)
	(:action drop
		:parameters (?b - ball ?a - arm ?r - room)
		:precondition
			(and
				(robot-at ?r)
				(holding ?a ?b)
			)
		:effect
			(and
				(robot-at ?r)
				(free ?a)
				(ball-at ?b ?r)
				(not (holding ?a ?b))
			)
	)
	(:action move
		:parameters (?f ?t - room)
		:precondition
			(and
				(robot-at ?f)
			)
		:effect
			(and
				(not (robot-at ?f))
				(robot-at ?t)
			)
	)
	(:action move-pick-move-drop-move
		:parameters (?b - ball ?a - arm ?f ?t - room)
		:precondition
			(and
				(free ?a)
			)
		:effect
			(and
				(not (robot-at ?f))
				(robot-at ?t)
				(holding ?a ?b)
				(not (ball-at ?b ?f))
				(ball-at ?b ?t)
				(not (holding ?a ?b))
				(free ?a)
				(not (robot-at ?f))
				(robot-at ?t)
			)
	)
)
