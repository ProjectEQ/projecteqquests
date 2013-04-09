sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hellooo!!  My name is Jogl, master engineer with the Eldrithch Collective.  And this here is Charlotte.  Pay no mind to her, She won't bite unless you attack me.");
	quest::signalwith(56108,1,1);
  }
}

sub EVENT_WAYPOINT_ARRIVE{
	if($wp==12){
		quest::signalwith(56108,2,1);
	}
	if($wp==18){
		quest::signalwith(56108,3,1);
	}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13209 =>1 )) {
    quest::say("Hmmm. Here you go. Take this log to Drekon Vebnebber. He is the in-house merchant at Gemchoppers Hall. It is his duty to file away all these logs.");
    quest::summonitem(quest::ChooseRandom(18837,18838));  #see not below
    quest::faction( 91,1 );
    quest::faction( 176,1 );
    quest::faction(115 ,1 );
    quest::faction( 209,-1 );
    quest::faction( 322,-1 );
    quest::exp(1000);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}

#random 18837 and 18838 for two sepearte quests beginnings Red V and duster
#18837 used for Red V