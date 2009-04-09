sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13209 =>1 )) {
    quest::say("Hmmm. Here you go. Take this log to Drekon Vebnebber. He is the in-house merchant at Gemchoppers Hall. It is his duty to file away all these logs.");
    quest::summonitem(quest::chooserandom(18837,18838));  #see not below
    quest::faction( 91,1 );
    quest::faction( 176,1 );
    quest::faction(115 ,1 );
    quest::faction( 209,-1 );
    quest::faction( 322,-1 );
    quest::exp(1000);
    quest::ding();
    
  }
}

sub EVENT_SPAWN {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(56108,0,0,$x - 5,$y,$z,$h);
}

#random 18837 and 18838 for two sepearte quests beginnings Red V and duster
#18837 used for Red V