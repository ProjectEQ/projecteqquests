# Items of Benevolence, starts in Skyshrine with Commander Leuz 

sub EVENT_ITEM { 
  if ($faction<=2) { # at least warmly 
    # she takes scout tools 
    if (plugin::check_handin(\%itemcount,29683=>1)) { 
      quest::say("Great! I was wondering when they would send someone out to give me these. In my haste and excitement of this new assignment I forgot these. This scout business is great I must say. It sure beats setting in Southern Ro studying the ruins. I've been following these Storm Giants for days. They've been wandering up and down the coast looking for something."); 
      quest::faction(42,30); # Claws of Veeshan 
      quest::faction(362,30); # Yelinak 
      quest::faction(189,-20); # Kromzek 
      quest::exp(100000); 
      # we spawn 7 kromzek warriors and 1 captain 
      quest::unique_spawn(120115,0,0,-3501,-4868,-108); # a Kromzek Captain (drops the disk) 
      quest::spawn(120121,0,0,-3507,-4897,-106); # Kromzek Warrior 
      quest::spawn(120121,0,0,-3496,-4874,-109); # Kromzek Warrior 
      quest::spawn(120121,0,0,-3474,-4863,-114); # Kromzek Warrior 
      quest::spawn(120121,0,0,-3463,-4852,-117); # Kromzek Warrior 
      quest::spawn(120121,0,0,-3452,-4841,-119); # Kromzek Warrior 
      quest::spawn(120121,0,0,-3441,-4830,-122); # Kromzek Warrior 
      quest::spawn(120121,0,0,-3430,-4819,-124); # Kromzek Warrior 
      # UNDER ARE OLD LOCS (X & Y inverted) (Muuss)
      #quest::unique_spawn(120115,0,0,-4868,-3501,-108); # a Kromzek Captain (drops the disk) 
      #quest::spawn(120121,0,0,-4897,-3507,-106); # Kromzek Warrior 
      #quest::spawn(120121,0,0,-4874,-3496,-109); # Kromzek Warrior 
      #quest::spawn(120121,0,0,-4863,-3474,-114); # Kromzek Warrior 
      #quest::spawn(120121,0,0,-4852,-3463,-117); # Kromzek Warrior 
      #quest::spawn(120121,0,0,-4841,-3452,-119); # Kromzek Warrior 
      #quest::spawn(120121,0,0,-4830,-3441,-122); # Kromzek Warrior 
      #quest::spawn(120121,0,0,-4819,-3430,-124); # Kromzek Warrior 

    } 

    # she takes the Broken Disk from Kromzek Captain 
    if (plugin::check_handin(\%itemcount,29684=>1)) { 
      quest::faction(42,30); # Claws of Veeshan 
      quest::faction(362,30); # Yelinak 
      quest::faction(189,-20); # Kromzek 
      quest::summonitem(29688); # 29688  Scout Report 
      quest::summonitem(29685); # 29685  Robe of Benevolence 
      quest::exp(100000); 
    } 

    # you give the robe to get the bracer 
    if (plugin::check_handin(\%itemcount,29685=>1)) { 
      quest::summonitem(29686); # 29686  Bracer of Benevolence 
    } 

    # you give the bracer to get the talisman 
    if (plugin::check_handin(\%itemcount,29686=>1)) { 
      quest::summonitem(29687); # 29687  Talisman of Benevolence 
    } 

    # you give the talisman to get the robe 
    if (plugin::check_handin(\%itemcount,29687=>1)) { 
      quest::summonitem(29685); # 29685  Robe of Benevolence 
    } 

  } # end faction<=2 
  plugin::return_items(\%itemcount); # return unused items 
} 

#End of File, Zone:westwastes  NPC:120000 -- #Scout_Charisa 
