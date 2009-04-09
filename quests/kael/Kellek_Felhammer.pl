sub EVENT_ITEM {
  # Handin: Voucher for toolset
  if(plugin::check_handin(\%itemcount, 25279 => 1)){
    # Toolset Delivery (kael)
    quest::say("Here you go $name. I dunno why master Wenglawks trusts you with this but take it anyways and don't mess up.");
    quest::emote("smacks his fists together as he looks at you.");
    # Summon: Coldain Toolset
    quest::summonitem(25104);
  }
  # Handin: Voucher for spear 
  elsif(plugin::check_handin(\%itemcount, 25280 => 1)){
    # Spear Delivery (kael)
    quest::say("Another delivery eh? Be careful with this spear, if you break it I'll break you.");
    # Summon: Bekerak's New Spear
    quest::summonitem(25106);
  }
  # Handin: Voucher for Mechanical Net  
  elsif(plugin::check_handin(\%itemcount, 25281 => 1)){
    # Mechanical Net Delivery (kael)
    quest::say("It's hard to belive a $race like you is going to make a trip like this. I don't envy you little fool.");
    # Summon: Mechanical Net
    quest::summonitem(25107);
  }
}


#EOF 
