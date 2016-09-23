(define (problem pb4)
    (:domain domain-sfc)
  	(:objects h1 h2 h3 h4 sw1 sw21 sw22
  	          sw31 sw32 sw33 sw34 sw41 sw42 sw43 sw44
  	          sw45 sw46 sw47 sw48
		 	  sw51 sw52 sw53 sw54 sw55 sw56 sw57 sw58
		 	  sw59 sw510 sw511 sw512 sw513 sw514 sw515 sw516
  	          fw ips proxy nat)

	(:init 
		(client h1) (client h2) (client h3) (client h4)
		
		(switch sw1) (switch sw21) (switch sw22) (switch sw31)
		(switch sw32) (switch sw33) (switch sw34)
		(switch sw41) (switch sw42) (switch sw43) (switch sw44)
		(switch sw45) (switch sw46) (switch sw47) (switch sw48)
		(switch sw51) (switch sw52) (switch sw53) (switch sw54)
		(switch sw55) (switch sw56) (switch sw57) (switch sw58)
		(switch sw59) (switch sw510) (switch sw511) (switch sw512)
		(switch sw513) (switch sw514) (switch sw515) (switch sw516)

		(device fw)
		(device ips)
		(device proxy)
		(device nat)

		(connectedN1 sw1 sw21) (connectedN1 sw21 sw1)
		(connectedN1 sw1 sw22) (connectedN1 sw22 sw1)


		(connectedN2 sw21 sw31) (connectedN2 sw31 sw21)
		(connectedN2 sw21 sw32) (connectedN2 sw32 sw21)
		(connectedN2 sw22 sw33) (connectedN2 sw33 sw22)
		(connectedN2 sw22 sw34) (connectedN2 sw34 sw22)


		(connectedN3 sw31 sw41) (connectedN3 sw41 sw31)
		(connectedN3 sw31 sw42) (connectedN3 sw42 sw31)
		(connectedN3 sw32 sw43) (connectedN3 sw43 sw32)
		(connectedN3 sw32 sw44) (connectedN3 sw44 sw32)

		(connectedN3 sw33 sw45) (connectedN3 sw45 sw33)
		(connectedN3 sw33 sw46) (connectedN3 sw46 sw33)
		(connectedN3 sw34 sw47) (connectedN3 sw47 sw34)
		(connectedN3 sw34 sw48) (connectedN3 sw48 sw34)


        (connected sw41 sw51) (connected sw51 sw41)
		(connected sw41 sw52) (connected sw52 sw41)
		(connected sw42 sw53) (connected sw53 sw42)
		(connected sw42 sw54) (connected sw54 sw42)

		(connected sw43 sw55) (connected sw55 sw43)
		(connected sw43 sw56) (connected sw56 sw43)
		(connected sw44 sw57) (connected sw57 sw44)
		(connected sw44 sw58) (connected sw58 sw44)

        (connected sw45 sw59) (connected sw59 sw45)
		(connected sw45 sw510) (connected sw510 sw45)
		(connected sw46 sw511) (connected sw511 sw46)
		(connected sw46 sw512) (connected sw512 sw46)

		(connected sw47 sw513) (connected sw513 sw47)
		(connected sw47 sw514) (connected sw514 sw47)
		(connected sw48 sw515) (connected sw515 sw48)
		(connected sw48 sw516) (connected sw516 sw48)



		(connected h1 sw51)  (connected sw51 h1)
		(connected h2 sw516) (connected sw516 h2)
		(connected h3 sw58)  (connected sw58 h3)
		(connected h4 sw512) (connected sw512 h4)

		(connected fw sw52)    (connectedvirt sw52  fw)
		(connected ips sw53)   (connectedvirt sw53 ips)
		(connected proxy sw55) (connectedvirt sw55  proxy)
		(connected nat sw57)   (connectedvirt sw57 nat)

		(connected fw sw59)     (connectedvirt sw59  fw)
		(connected ips sw510)   (connectedvirt sw510 ips)
		(connected proxy sw512) (connectedvirt sw512  proxy)
		(connected nat sw514)   (connectedvirt sw514 nat)

		(connected fw sw21)     (connected sw21  fw)
		(connected ips sw21)   (connected sw21 ips)
		(connected proxy sw22) (connected sw22  proxy)
		(connected nat sw22)   (connected sw22 nat)

		
		(atPacket h1))


	(:goal (and  (atPacket fw  )     ) )
	(:goal (and  (atPacket ips)     ) )
	(:goal (and  (atPacket nat)     ) )
	(:goal (and  (atPacket proxy)     ) )
	(:goal (and  (atPacket h2)     ) )
	(:goal (and  (atPacket ips)     ) )
	(:goal (and  (atPacket h1)     ) )


	
 	(:end)

)