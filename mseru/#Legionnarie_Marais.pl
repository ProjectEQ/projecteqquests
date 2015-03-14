sub EVENT_SPAWN {
  quest::settimer("appearance", 1);
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    $npc->SetAppearance(1);
    quest::say("Corporal Donfeld?");
  }
} 

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18332 => 1)) { #Torn Half of a Note
    quest::say("I knew someone would come if I... just held out... long enough... Take these... be careful... ' And with that, Marais allows himself to finally die.");
    quest::summonitem(18333); #Marais' Notes
    quest::summonitem(18334); #Marais' Notes
    $npc->SetAppearance(3);
    quest::settimer("depop",10);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  if($timer eq "depop") {
    quest::stoptimer("depop");
    quest::depop();
  }
  if($timer eq "appearance") {
    quest::stoptimer("appearance");
    $npc->SetAppearance(3);
  }
} 

#END of FILE Zone:mseru ID:168094 -- Legionnaire_Marais