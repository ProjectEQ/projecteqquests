sub EVENT_SPAWN {
  quest::settimer(1,1);
  }

sub EVENT_SAY {
  if ($text=~/hail/i) {
  if (defined $qglobals{sewers} && $qglobals{sewers} == 4) {
    quest::say("I have found your three stone shaping tools.");
    quest::setglobal("sewers", 5, 5, "F");
	$client->Message(4,"You receive a character flag!");
}
}
}

sub EVENT_TIMER {
   if ($timer == 1) {
     $npc->SetAppearance(3);
     quest::stoptimer(1);
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 68298 =>1 )) {
    quest::say("I will help you if you can help me.  I've lost my tools.  Some of the denziens of the sewers stole them after I got trapped under this rock.  Get my tools so I can escape and I'll show you to the pool.");  #not live text
     quest::signal(286104,0);    #signal to spawn three sets of mobs
  }
  plugin::return_items(\%itemcount);
}