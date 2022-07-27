# items: 25279, 25104, 25280, 25106, 25281, 25107, 1722, 1721, 1723
sub EVENT_ITEM {
  # Handin: Voucher for toolset
  if(plugin::check_handin(\%itemcount, 25279 => 1)){
    # Toolset Delivery (kael)
    quest::say("Here you go $name. I dunno why master Wenglawks trusts you with this but take it anyways and don't mess up.");
    quest::emote("smacks his fists together as he looks at you.");
    # Summon: Coldain Toolset
    quest::summonitem(25104); # Item: Coldain Toolset
  }
  # Handin: Voucher for spear 
  elsif(plugin::check_handin(\%itemcount, 25280 => 1)){
    # Spear Delivery (kael)
    quest::say("Another delivery eh? Be careful with this spear, if you break it I'll break you.");
    # Summon: Bekerak's New Spear
    quest::summonitem(25106); # Item: Bekerak's New Spear
  }
  # Handin: Voucher for Mechanical Net  
  elsif(plugin::check_handin(\%itemcount, 25281 => 1)){
    # Mechanical Net Delivery (kael)
    quest::say("It's hard to belive a $race like you is going to make a trip like this. I don't envy you little fool.");
    # Summon: Mechanical Net
    quest::summonitem(25107); # Item: Mechanical Net
  }
  elsif(plugin::check_handin(\%itemcount, 1722 => 1)){ #Helssen's Voucher
	quest::say("I still cannot believe we are giving such a prized possesion as the Collar of the Storm to a mere mercenary. You better pray you don't bring shame upon the smith who created and enchanted this item. Oh and here is your seal as Helssen has ordered me to give you. It is proof of your service to us.");
	quest::ding();
	quest::summonitem(1721); # Collar of the Storm
	quest::summonitem(1723); # Noble's Seal
	quest::exp(2000);
  }
  plugin::return_items(\%itemcount);
}


#EOF 
