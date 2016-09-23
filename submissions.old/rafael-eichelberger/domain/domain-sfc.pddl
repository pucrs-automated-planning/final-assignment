(define (domain domain-sfc)
(:requirements :strips)
(:types virtual physical)


(:predicates (device ?h)
             (switch ?l)
             (connected ?l ?h)
             (atPacket ?l)
             (client ?b)
             (total-cost ?c)
)


(:action forwardPacket
  :parameters (?from ?to)
  :precondition (and  (switch ?from) (switch ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from)) ))

(:action forwardToVirtualDevice
  :parameters (?from ?to)
  :precondition (and  (switch ?from) (device ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from)) (increase (total-cost 30))))

(:action forwardToDevice
  :parameters (?from ?to)
  :precondition (and  (switch ?from) (device ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from)) (increase (total-cost 2))))

(:action forwardFromDevice
  :parameters (?from ?to)
  :precondition (and  (device ?from) (switch ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from))))

(:action forwardToClient
  :parameters (?from ?to)
  :precondition (and  (switch ?from) (client ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from))))

(:action forwardFromClient
  :parameters (?from ?to)
  :precondition (and  (client ?from) (switch ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from))))

)