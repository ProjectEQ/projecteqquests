sub EVENT_SPAWN {
 quest::settimer("Feign",1);
}

sub EVENT_TIMER {
 if($timer eq "Feign") {
 $npc->SetAppearance(3);
 quest::stoptimer("Feign");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5994 =>1 )) {
    quest::say("$name, you have bested me, here is a locket.  My potion!");
    quest::summonitem(5996);
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}