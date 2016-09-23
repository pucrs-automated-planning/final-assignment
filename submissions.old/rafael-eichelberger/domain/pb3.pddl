(define (problem pb3)
    (:domain domain-sfc)
  	(:objects h1 h2 h3 h4 sw1 sw2 sw3 sw4 h11
  	          sw11 sw12 sw13 sw14 sw21 sw22 sw23 sw24
  	          sw31 sw32 sw33 sw34 sw41 sw42 sw43 sw44
  	          fw ips proxy nat)

	(:init 
		(client h1) (client h2) (client h3) (client h4) (client h11)
		
		(switch sw1) (switch sw2) (switch sw3) (switch sw4)
		(switch sw11) (switch sw12) (switch sw13) (switch sw14)
		(switch sw21) (switch sw22) (switch sw23) (switch sw24)
		(switch sw31) (switch sw32) (switch sw33) (switch sw34)
		(switch sw41) (switch sw42) (switch sw43) (switch sw44)

		(device fw)
		(device ips)
		(device proxy)
		(device nat)

		(connected sw11 sw13) (connected sw13 sw11)
		(connected sw11 sw12) (connected sw12 sw11)
		(connected sw13 sw14) (connected sw14 sw13)
		(connected sw14 sw12) (connected sw12 sw14)

		(connected sw21 sw23) (connected sw23 sw21)
		(connected sw21 sw22) (connected sw22 sw21)
		(connected sw23 sw24) (connected sw24 sw23)
		(connected sw24 sw22) (connected sw22 sw24)

		(connected sw31 sw33) (connected sw33 sw31)
		(connected sw31 sw32) (connected sw32 sw31)
		(connected sw33 sw34) (connected sw34 sw33)
		(connected sw34 sw32) (connected sw32 sw34)

		(connected sw41 sw43) (connected sw43 sw41)
		(connected sw41 sw42) (connected sw42 sw41)
		(connected sw43 sw44) (connected sw44 sw43)
		(connected sw44 sw42) (connected sw42 sw44)


		(connected sw1 sw11) (connected sw11 sw1)
		(connected sw1 sw24) (connected sw24 sw1)
		(connected sw1 sw34) (connected sw34 sw1)
		(connected sw1 sw41) (connected sw41 sw1)

		(connected sw2 sw11) (connected sw11 sw2)
		(connected sw2 sw21) (connected sw21 sw2)
		(connected sw2 sw34) (connected sw34 sw2)
		(connected sw2 sw44) (connected sw44 sw2)

		(connected sw3 sw14) (connected sw14 sw3)
		(connected sw3 sw21) (connected sw21 sw3)
		(connected sw3 sw31) (connected sw31 sw3)
		(connected sw3 sw44) (connected sw44 sw3)

		(connected sw4 sw14) (connected sw14 sw4)
		(connected sw4 sw24) (connected sw24 sw4)
		(connected sw4 sw31) (connected sw31 sw4)
		(connected sw4 sw41) (connected sw41 sw4)

		(connected h1 sw13) (connected sw13 h1)
		(connected h2 sw23) (connected sw23 h2)
		(connected h3 sw33) (connected sw33 h3)
		(connected h4 sw43) (connected sw43 h4)


		(connected fw sw12) (connectedvirt sw12 fw)
		(connected fw sw22) (connected sw22 fw)
		(connected nat sw23) (connectedvirt sw23 nat)
		(connected nat sw32) (connected sw32 nat)

		(connected ips sw42) (connectedvirt sw42 ips)
		(connected ips sw33) (connected sw33 ips)




		
		(atPacket h1))

	(:goal (and  (atPacket fw  )     ) )
	(:goal (and  (atPacket nat)     ) )
	(:goal (and  (atPacket ips)     ) )
	(:goal (and  (atPacket h4)     ) )
	(:goal (and  (atPacket ips)     ) )
	(:goal (and  (atPacket h1)     ) )

	
 	(:end)

)