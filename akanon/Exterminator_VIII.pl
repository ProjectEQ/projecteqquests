#Start of Exterminate the Vermin Quest(Scripted By: Fatty Beerbelly)
# items: 10967

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, citizen. Welcome to Akanon. *whirr whirr* Mission *Terminate Vermin* initiated. Bring four clockwork rat leg sections from defective cleaners for reward. All defective models must be eradicated *bzzzt whirr*.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10967 => 4)){ #Clockwork Rat Leg Section x 4
    quest::say("Four Clockwork Rat Leg Sections recieved *bzzzt* processing reward. Reward mode initiated. Coins given. Mission *Terminate Vermin* reset one second *bzzt whirr*.");
    quest::faction(333,10); # +King Ak'Anon
    quest::faction(245,10); # +Eldritch Collective
    quest::faction(255,10); # +Gem Choppers
    quest::faction(238,-10); # -Dark Reflection
    quest::faction(287,-10); # -Meldrath
    quest::exp(5);
    quest::givecash(1,1,1,0);
  }
  plugin::return_items(\%itemcount);
}
#ItemID: 10967 - ItemName: Clockwork Rat Leg Section
#NpcID: 00000 - NpcName: Exterminator VII - Zone: akanon
#End of Exterminate the Vermin(Scripted By: Fatty Beerbelly)
