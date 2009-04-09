sub EVENT_SAY {
  if($text=~/Hail/i){ #Start of Exterminate the Vermin Quest(Scripted By: Fatty Beerbelly)
    quest::say("Greetings, citizen. Welcome to Akanon. *whirr whirr* Mission *Terminate Vermin* initiated. Bring four clockwork rat leg sections from defective cleaners for reward. All defective models must be eradicated *bzzzt whirr*.");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Clockwork Rat Leg Section 
  if(plugin::check_handin(\%itemcount, 10967 => 4)){ #End of Exterminate the Vermin(Scripted By: Fatty Beerbelly)
    quest::say("Four Clockwork Rat Leg Sections recieved *bzzzt* processing reward. Reward mode initiated. Coins given. Mission *Terminate Vermin* reset one second *bzzt whirr*.");
    quest::faction(176,10); # +King Ak'Anon
    quest::faction(91,10); # +Eldritch Collective
    quest::faction(115,10); # +Gem Choppers
    quest::faction(71,-10); # -Dark Reflection
    quest::faction(209,-10); # -Meldrath
    quest::exp(5);
    quest::givecash(1,1,1,0);
  }
} 


#ItemID: 10967 - ItemName: Clockwork Rat Leg Section
#NpcID: 00000 - NpcName: Exterminator VII - Zone: akanon