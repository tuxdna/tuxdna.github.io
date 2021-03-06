---
layout: page
title: "Akka"
description: "Scaling Software with Akka framework"
---

{% include JB/setup %}

Akka

[Scaling Software With Akka](http://www.slideshare.net/scalaconfjp/scaling-software-with-akka)

Manage System Overload

Automatic Replication & Distributio for Fault-tolearance & Scalability

Program at a Higher Level
 * Never think in terms of shared state, shared visiblity, threads, locks, concurrent collections, thread notifications etc.
 * You only think about messages flow in the system
 * You get high CPU utilization, low latency, high throughput and scalability
 * Proven and superior model for detecting and recovering from errors
 
Distributed by design
 * Actors are location transparent & distributed by design
 * Scale UP and OUT for free as part of the model
 * perfect fabric for the cloud
  * elastic & dymanic
  * fault-tolerant & self-healing
  * adaptive load-balancing, cluster rebalancing & actor migration
  * build extremely loosely coupled and dynamic systems that can cnage and adapt at runtime
  
What is an Actor?

 * The fundamental unit of computation that embodies:
   * processing
   * storage
   * communication

 * 3 axioms - When an Actor receives a message it can:
   * create new actors
   * send messages to actors it knows
   * designamte how it shoudl handle the next message it receives
 
 Actor operations
  * DEFINE
  * CREATE
  * SEND
  * BECOME
  * SUPERVISE
  
## DEFINE

    case class Greeting(who: String)

    class GreetingActor extends Actor with ActorLogging {
       def receive = {
          case Greeting(who) => log.info("Hello " + who)
       }
    }
    
## CREATE

Actor encapsulates: state, behaviour and message queue

    val system = ActorSystem("MySystem")
    val greeter = system.actorOf(Props[GreetingActor], name = "greeter")

## SEND

    greeter ! Greeting("Charlie Parker")
	
### Load Balancing

*Routers + Resizer*

Only Router:

    val router =
     system.actorOf(
      Props[SomeActor].withRouter(
      RoundRobinRouter(nrOfInstances = 5)))

Router and Resizer:

    val resizer =
      DefaultResizer(lowerBound = 2, upperBound = 15)
    
    val router =
     system.actorOf(
      Props[ExampleActor1].withRouter(
        RoundRobinRouter(resizer = Some(resizer))))

## BECOME

## SUPERVISE

Manage other failures of another Actor(s)

Clean separation of processing and error handling

We can override the default failure strategy

    class Supervisor extends Actor {
      override val supervisorStrategy =
                  (maxNrOfRetries = 10, withinTimeRange = 1 minute) {
        case _: ArithmeticException => Resume
        case _: NullPointerException => Restart
        case _: Exception => Escalate
      }
	  
      val worker = context.actorOf(Props[Worker])
      def receive = {
        case n: Int => worker forward n
      }
	}

Manage failure

	class Worker extends Actor {
		...
		override def preRestart(
			reason: Throwable, message: Option[Any]) {
			... // clean up before restart
		}
		override def postRestart(reason: Throwable) {
			... // init after restart
		}
	}

Remote deployment: Zero code changes

    akka {
		actor {
		provider = akka.remove.RemoteActorRefProvider
		deployment {
			/greeter {
				remote = akka://MySystem@machine1:2552
			}
		}
	}

Remote Lookup

    val greeter = system.actorFor(
        "akka://MySystem@machine1:2552/user/greeter")



Clustered router:


    akka.actor.deployment {
	   /statsService/workerRouter {
	      router = consistent‐hashing
	  	  nr‐of‐instances  =  100
	  	  cluster  {
	  	    enabled  =  on
	  	    max-nr-of-instances-per-node = 3
	  	    allow‐local‐routees  =  on
	  	  }
	   }
    } 
