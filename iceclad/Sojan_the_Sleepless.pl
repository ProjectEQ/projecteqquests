# items: 25104, 20474
sub EVENT_ITEM {
  # Handin: Coldain Toolset
  if(plugin::check_handin(\%itemcount, 25104 => 1)){
    # Toolset Delivery (kael)
    quest::say("Uhhh, thank you... Now I can uhh... work on fixing some things around...");
    quest::emote("seems to nod off for a moment as he drops a small note on the ground.");
    # Summon: Receipt
    quest::summonitem(20474); # Item: Receipt
  }
}

sub EVENT_SIGNAL {
	quest::emote("sighs and stares at the ground solemnly");
}

#EOF