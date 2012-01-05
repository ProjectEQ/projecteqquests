#This simple script sets the glowing cliff golem to a path when he spawns

sub EVENT_SPAWN{
 quest::settimer(1,640);
 quest::start(274);
}

sub EVENT_TIMER {
 quest::depop();
}

#Submitted by Jim Mills