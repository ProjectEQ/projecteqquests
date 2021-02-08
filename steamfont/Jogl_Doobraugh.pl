# items: 13209, 18837, 18838
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hellooo!!  My name is Jogl, master engineer with the Eldrithch Collective.  And this here is Charlotte.  Pay no mind to her, She won't bite unless you attack me.");
	quest::signalwith(56108,1,1); # NPC: Charlotte
  }
}

sub EVENT_WAYPOINT_ARRIVE{
	if($wp==12){
		quest::signalwith(56108,2,1); # NPC: Charlotte
	}
	if($wp==18){
		quest::signalwith(56108,3,1); # NPC: Charlotte
	}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13209 =>1 )) {
    quest::say("Hmmm. Here you go. Take this log to Drekon Vebnebber. He is the in-house merchant at Gemchoppers Hall. It is his duty to file away all these logs.");
    quest::summonitem(quest::ChooseRandom(18837,18838));  #see not below
    quest::faction( 245,1 ); # Faction: Eldritch Collective
    quest::faction( 333,1 ); # Faction: King Ak`Anon
    quest::faction(255 ,1 ); # Faction: Gem Choppers
    quest::faction( 287,-1 ); # Faction: Meldrath
    quest::faction( 239,-1 ); # Faction: The Dead
    quest::exp(1000);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}

#random 18837 and 18838 for two sepearte quests beginnings Red V and duster
#18837 used for Red V
