
(define
	(domain blocks)
	(:requirements
		:strips :typing
	)
	(:types
		block
	)
	(:predicates
		(arm-free)
		(clear ?b - block)
		(on ?ab ?ub - block)
		(on-table ?b - block)
		(holding ?b - block)
	)
	(:action pick
		:parameters (?b - block)
		:precondition
			(and
				(arm-free)
				(clear ?b)
				(on-table ?b)
			)
		:effect
			(and
				(holding ?b)
				(not (arm-free))
				(not (clear ?b))
				(not (on-table ?b))
			)
	)
	(:action drop
		:parameters (?b - block)
		:precondition
			(and
				(holding ?b)
			)
		:effect
			(and
				(arm-free)
				(clear ?b)
				(on-table ?b)
				(not (holding ?b))
			)
	)
	(:action stack
		:parameters (?ab ?ub - block)
		:precondition
			(and
				(clear ?ub)
				(holding ?ab)
			)
		:effect
			(and
				(arm-free)
				(clear ?ab)
				(on ?ab ?ub)
				(not (holding ?ab))
				(not (clear ?ub))
			)
	)
	(:action unstack
		:parameters (?ab ?ub - block)
		:precondition
			(and
				(arm-free)
				(clear ?ab)
				(on ?ab ?ub)
			)
		:effect
			(and
				(clear ?ub)
				(holding ?ab)
				(not (arm-free))
				(not (clear ?ab))
				(not (on ?ab ?ub))
			)
	)
	(:action pick-stack
		:parameters (?a ?u - block)
		:precondition
			(and
				(arm-free)
				(clear ?a)
				(on-table ?a)
				(clear ?u)
			)
		:effect
			(and
				(on ?a ?u)
				(not (on-table ?a))
				(not (clear ?u))
			)
	)
)

