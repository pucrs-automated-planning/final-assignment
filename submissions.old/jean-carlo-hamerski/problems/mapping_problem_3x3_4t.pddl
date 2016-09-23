(define (problem mapping)
   (:domain mpsoc)
   (:objects pe1-1 pe2-1 pe3-1 pe1-2 pe2-2 pe3-2 pe1-3 pe2-3 pe3-3 t1 t2 t3 t4)
   (:init 
		(pe pe1-1)
		(pe pe2-1)
		(pe pe3-1)
		(pe pe1-2)
		(pe pe2-2)
		(pe pe3-2)
		(pe pe1-3)
		(pe pe2-3)
		(pe pe3-3)
		
		(not-full pe1-1)
		(not-full pe2-1)
		(not-full pe3-1)
		(not-full pe1-2)
		(not-full pe2-2)
		(not-full pe3-2)
		(not-full pe1-3)
		(not-full pe2-3)
		(not-full pe3-3)
				
		(task-ini t1)
		(task-noini t2)
		(task-noini t3)
		(task-noini t4)
		
		(not-mapped t1)
		(not-mapped t2)
		(not-mapped t3)
		(not-mapped t4)
		
		(task-dep t1 t2)
		(task-dep t1 t3)
		(task-dep t3 t4)
		
		(= (cost pe1-1 pe1-2) 1)
        (= (cost pe1-1 pe1-3) 2)
		(= (cost pe1-1 pe2-1) 1)
		(= (cost pe1-1 pe2-2) 2)
        (= (cost pe1-1 pe2-3) 3)
		(= (cost pe1-1 pe3-1) 2)
		(= (cost pe1-1 pe3-2) 3)
		(= (cost pe1-1 pe3-3) 4)
		
		(= (cost pe1-2 pe1-1) 1)
        (= (cost pe1-2 pe1-3) 1)
		(= (cost pe1-2 pe2-1) 2)
		(= (cost pe1-2 pe2-2) 1)
        (= (cost pe1-2 pe2-3) 2)
		(= (cost pe1-2 pe3-1) 3)
		(= (cost pe1-2 pe3-2) 2)
		(= (cost pe1-2 pe3-3) 3)
		
		(= (cost pe1-3 pe1-1) 2)
        (= (cost pe1-3 pe1-2) 1)
		(= (cost pe1-3 pe2-1) 3)
		(= (cost pe1-3 pe2-2) 2)
        (= (cost pe1-3 pe2-3) 1)
		(= (cost pe1-3 pe3-1) 4)
		(= (cost pe1-3 pe3-2) 3)
		(= (cost pe1-3 pe3-3) 2)
		
		(= (cost pe2-1 pe1-1) 1)
        (= (cost pe2-1 pe1-2) 2)
		(= (cost pe2-1 pe1-3) 3)
		(= (cost pe2-1 pe2-2) 1)
        (= (cost pe2-1 pe2-3) 2)
		(= (cost pe2-1 pe3-1) 1)
		(= (cost pe2-1 pe3-2) 2)
		(= (cost pe2-1 pe3-3) 3)
		
		(= (cost pe2-2 pe1-1) 2)
        (= (cost pe2-2 pe1-2) 1)
		(= (cost pe2-2 pe1-3) 2)
		(= (cost pe2-2 pe2-1) 1)
        (= (cost pe2-2 pe2-3) 1)
		(= (cost pe2-2 pe3-1) 2)
		(= (cost pe2-2 pe3-2) 1)
		(= (cost pe2-2 pe3-3) 2)
		
		(= (cost pe2-3 pe1-1) 3)
        (= (cost pe2-3 pe1-2) 2)
		(= (cost pe2-3 pe1-3) 1)
		(= (cost pe2-3 pe2-1) 2)
        (= (cost pe2-3 pe2-2) 1)
		(= (cost pe2-3 pe3-1) 3)
		(= (cost pe2-3 pe3-2) 2)
		(= (cost pe2-3 pe3-3) 1)
		
		(= (cost pe3-1 pe1-1) 2)
        (= (cost pe3-1 pe1-2) 3)
		(= (cost pe3-1 pe1-3) 4)
		(= (cost pe3-1 pe2-1) 1)
        (= (cost pe3-1 pe2-2) 2)
		(= (cost pe3-1 pe2-3) 3)
		(= (cost pe3-1 pe3-2) 1)
		(= (cost pe3-1 pe3-3) 2)
		
		(= (cost pe3-2 pe1-1) 3)
        (= (cost pe3-2 pe1-2) 2)
		(= (cost pe3-2 pe1-3) 3)
		(= (cost pe3-2 pe2-1) 2)
        (= (cost pe3-2 pe2-2) 1)
		(= (cost pe3-2 pe2-3) 2)
		(= (cost pe3-2 pe3-1) 1)
		(= (cost pe3-2 pe3-3) 1)
		
		(= (cost pe3-3 pe1-1) 4)
        (= (cost pe3-3 pe1-2) 3)
		(= (cost pe3-3 pe1-3) 2)
		(= (cost pe3-3 pe2-1) 3)
        (= (cost pe3-3 pe2-2) 2)
		(= (cost pe3-3 pe2-3) 1)
		(= (cost pe3-3 pe3-1) 2)
		(= (cost pe3-3 pe3-2) 1)
	                 
		(= (total-cost) 0)
		
		(= (comm t1 t2)	50)
		(= (comm t1 t3) 150)
		(= (comm t3 t4) 80)		
						        
        )
   (:goal (and (not (not-mapped t1)) (not (not-mapped t2)) (not (not-mapped t3)) (not (not-mapped t4))))
   (:metric minimize (total-cost))
   )