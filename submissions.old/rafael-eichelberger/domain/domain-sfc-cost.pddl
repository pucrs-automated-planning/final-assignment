(define (domain domain-sfc)
(:requirements :strips :action-costs)

(:predicates (device ?h)
             (prevSW ?h)
             (switch ?l)
             (connected ?l ?h)
             (connectedvirt ?l ?h)
             (atPacket ?l)
             (client ?b)
             (total-cost ?c))

(:action forwardPacket
  :parameters (?from ?to)
  :precondition (and  (switch ?from) (switch ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from)) ))

(:action forwardToDevice
  :parameters (?from ?to)
  :precondition (and  (switch ?from) (device ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (prevSW ?from) (not (atPacket ?from)) ))

(:action forwardFromDevice
  :parameters (?from ?to)
  :precondition (and  (device ?from) (switch ?to) (connected ?from ?to) (atPacket ?from) (prevSW ?to))
  :effect (and  (atPacket ?to) (not (atPacket ?from) ) (not (prevSW ?to))))

(:action forwardToClient
  :parameters (?from ?to)
  :precondition (and  (switch ?from) (client ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from))))

(:action forwardFromClient
  :parameters (?from ?to)
  :precondition (and  (client ?from) (switch ?to) (connected ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from))))

(:action forwardPacketVirtual
  :parameters (?from ?to)
  :precondition (and  (switch ?from) (switch ?to) (connectedvirt ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (not (atPacket ?from)) (increase (total-cost 2)) ))

(:action forwardToVirtDevice
  :parameters (?from ?to)
  :precondition (and  (switch ?from) (device ?to) (connectedvirt ?from ?to) (atPacket ?from))
  :effect (and  (atPacket ?to) (prevSW ?from) (not (atPacket ?from)) (increase (total-cost 2)) ))

(:action forwardFromVirtDevice
  :parameters (?from ?to)
  :precondition (and  (device ?from) (switch ?to) (connectedvirt ?from ?to) (atPacket ?from) (prevSW ?to))
  :effect (and  (atPacket ?to) (not (atPacket ?from)) (not (prevSW ?to)) (increase (total-cost 2))))

)

