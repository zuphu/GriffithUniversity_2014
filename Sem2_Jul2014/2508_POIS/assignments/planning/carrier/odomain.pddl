
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


			)
		:effect
			(and


			)
	)
	(:action drop
		:parameters (?b - ball ?a - arm ?r - room)
		:precondition
			(and


			)
		:effect
			(and



			)
	)
	(:action move
		:parameters (?f ?t - room)
		:precondition
			(and


			)
		:effect
			(and


			)
	)
)

