sub EVENT_SPAWN {
  quest::ze(15,"My time here is short!  Come find me for your reward!");
  quest::settimer(1,900);
  quest::depop(288086);
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::ze(15,"I must leave now, farewell.");
    quest::depop();
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55608 =>1, 55609 =>1, 55610 =>1, 55611 =>1 )) {
   quest::stoptimer(1);
   quest::say("Great job!");
     quest::setglobal("sewers", 3, 5, "F");
	$client->Message(4,"You receive a character flag!");
 }
    plugin::return_items(\%itemcount);
}