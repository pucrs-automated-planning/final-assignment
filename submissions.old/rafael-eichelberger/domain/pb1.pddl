(define (problem pb1)
    (:domain domain-sfc)
  	(:objects h1 h2 sw1 sw2 sw4 sw3 fw fwv proxy nat)

	(:init 
		(client h1)
		(client h2)
		(switch sw1)
		(switch sw2)
		(switch sw3)
		(device fw)
		(connected sw1 sw2) (connected sw2 sw1)
		(connected sw1 sw3) (connected sw3 sw1)
			
		(connected h1 sw2) (connected sw2 h1)
		(connected h2 sw2) (connected sw2 h2)

		(connected fw sw3) (connected sw3 fw)
		(connectedvirt fw sw1) (connectedvirt sw1 fw)
		
		(atPacket h1))

	(:goal (and  (atPacket fw)     ) )
	(:goal (and  (atPacket h2)     ) )
	
 	(:end)

)