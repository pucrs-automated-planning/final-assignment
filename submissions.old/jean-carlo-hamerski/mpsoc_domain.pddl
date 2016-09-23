(define (domain mpsoc)
;(:requirements :strips :fluents :equality)
(:requirements :strips :equality)
(:predicates (pe ?p)
			 (task-ini ?t)
			 (task-noini ?t)
			 (task-dep ?t1 ?t2)
			 (not-mapped ?t)
			 (at ?t ?p)
			 (not-full ?p))

(:functions
  (cost ?from ?to)
  (comm ?t1 ?t2)
  (total-cost)
)		   

(:action map-task-ini
  :parameters  (?pe ?t)
  :precondition (and (pe ?pe) (task-ini ?t) 
					 (not-mapped ?t)
					 (not-full ?pe)
				)
  :effect (and (at ?t ?pe)  
			   (not (not-mapped ?t)) (not (not-full ?pe))
		  )
)

;map task not initial t2 into pe2 (tast t1 is communicating with t2)			 					 
(:action map-task-noini
  :parameters  (?pe1 ?pe2 ?t1 ?t2)
  :precondition (and (pe ?pe1) (pe ?pe2) (task-noini ?t2)
					 (at ?t1 ?pe1) (not-mapped ?t2) (task-dep ?t1 ?t2)  
					 (not-full ?pe2)
                     (not (= ?pe1 ?pe2))
				)
  :effect (and (at ?t2 ?pe2) 
			   (not (not-mapped ?t2)) (not (not-full ?pe2))
			   (increase (total-cost) (* (comm ?t1 ?t2) (cost ?pe1 ?pe2)))
	      )
)
		
)