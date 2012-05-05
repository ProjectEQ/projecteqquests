sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("$myvalue Hello $name. Come to take a look at the crystal geode? The geode has some very strong magic inside of it that can help you. I can bring out the magic of the geode for you, but a gnome has to make a living! Even if he's stuck in this little hole in the wall all the time. Not that I'm bitter. Each of the crystals I sell is linked to a location in our world. If you give me one of the crystals I can focus the geode to let you and your companions travel there in the blink of an eye!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10092 => 1)){
    quest::setglobal("ghport$uguild_id",10092,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Plane of Hate');
  } elsif(plugin::check_handin(\%itemcount, 10094 => 1)){
    quest::setglobal("ghport$uguild_id",10094,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Plane of Sky');
  } elsif(plugin::check_handin(\%itemcount, 64191 => 1)){
    quest::setglobal("ghport$uguild_id",64191,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Dragonscale Hills');
  } elsif(plugin::check_handin(\%itemcount, 76000 => 1)){
    quest::setglobal("ghport$uguild_id",76000,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Northern Plains of Karana');
  } elsif(plugin::check_handin(\%itemcount, 76001 => 1)){
    quest::setglobal("ghport$uguild_id",76001,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to East Commonlands');
  } elsif(plugin::check_handin(\%itemcount, 76002 => 1)){
    quest::setglobal("ghport$uguild_id",76002,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Lavastorm Mountains');
  } elsif(plugin::check_handin(\%itemcount, 76003 => 1)){
    quest::setglobal("ghport$uguild_id",76003,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Toxxulia Forest');
  } elsif(plugin::check_handin(\%itemcount, 76004 => 1)){
    quest::setglobal("ghport$uguild_id",76004,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Greater Faydark');
  } elsif(plugin::check_handin(\%itemcount, 76005 => 1)){
    quest::setglobal("ghport$uguild_id",76005,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Dreadlands');
  } elsif(plugin::check_handin(\%itemcount, 76006 => 1)){
    quest::setglobal("ghport$uguild_id",76006,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Iceclad Ocean');
  } elsif(plugin::check_handin(\%itemcount, 76007 => 1)){
    quest::setglobal("ghport$uguild_id",76007,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Cobalt Scar');
  } elsif(plugin::check_handin(\%itemcount, 76009 => 1)){
    quest::setglobal("ghport$uguild_id",76009,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Twilight Sea');
  } elsif(plugin::check_handin(\%itemcount, 76010 => 1)){
    quest::setglobal("ghport$uguild_id",76010,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Stonebrunt Mountains');
  } elsif(plugin::check_handin(\%itemcount, 76011 => 1)){
    quest::setglobal("ghport$uguild_id",76011,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Wall of Slaughter');
  } elsif(plugin::check_handin(\%itemcount, 76012 => 1)){
    quest::setglobal("ghport$uguild_id",76012,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Barindu, Hanging Gardens');
  } elsif(plugin::check_handin(\%itemcount, 76070 => 1)){
    quest::setglobal("ghport$uguild_id",76070,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Undershore');
  } elsif(plugin::check_handin(\%itemcount, 88735 => 1)){
    quest::setglobal("ghport$uguild_id",88735,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Arcstone, Isle of Spirits');
  } elsif(plugin::check_handin(\%itemcount, 88736 => 1)){
    quest::setglobal("ghport$uguild_id",88736,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Goru`kar Mesa');
  } elsif(plugin::check_handin(\%itemcount, 88737 => 1)){
    quest::setglobal("ghport$uguild_id",88737,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to your guild banner');
  } elsif(plugin::check_handin(\%itemcount, 88738 => 1)){
    quest::setglobal("ghport$uguild_id",88738,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Katta Castrum');
  } elsif(plugin::check_handin(\%itemcount, 88739 => 1)){
    quest::setglobal("ghport$uguild_id",88739,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to The Plane of Time');
  } elsif(plugin::check_handin(\%itemcount, 88740 => 1)){
    quest::setglobal("ghport$uguild_id",88740,3,"H24");
    quest::emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
    quest::ze(15,'The Guildhall Portal has been aligned to Brell\'s Rest');
  } else {
    quest::say("I have no use for this, $name.");
  }
  plugin::return_items(\%itemcount);
}

#[Sat May 05 10:12:10 2012] LOADING, PLEASE WAIT...
#[Sat May 05 10:12:19 2012] You have entered Guild Hall.
#[Sat May 05 10:12:20 2012] Zeflmin Werlikanin says 'The teleport stone is currently aligned to Greater Faydark.'

sub EVENT_SIGNAL {
  my $pc = $entity_list->GetClientByCharID($signal);
  if ($pc) {
    $uguild_id = $pc->GuildID();
    if(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10092) { #hateplane
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Plane of Hate.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10094) { #airplane
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Plane of Sky.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 64191) { #dragonscale
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to Dragonscale Hills.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76000) { #karana
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Northern Plains of Karana.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76001) { #ecommons
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to East Commonlands.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76002) { #lavastorm
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Lavastorm Mountains.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76003) { #toxxulia
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to Toxxulia Forest.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76004) { #faydark
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Greater Faydark.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76005) { #dreadlands
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Dreadlands.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76006) { #iceclad
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Iceclad Ocean.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76007) { #cobaltscar
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to Cobalt Scar.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76009) { #twilight
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Twilight Sea.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76010) { #stonebrunt
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Stonebrunt Mountains.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76011) { #slaughter
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to Wall of Slaughter.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76012) { #barindu
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to Barindu, Hanging Gardens.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76070) { #eastkorlach
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Undershore.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88735) { #arcstone
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to Arcstone, Isle of Spirits.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88736) { #goru
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to Goru`kar Mesa.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88737) { #guild banner
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to your guild banner.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88738) { #kattacastrum
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to Katta Castrum.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88739) { #potimea
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to The Plane of Time.\'');
    } elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88740) { #brellsrest
      $pc->Message(5, $npc->GetCleanName().' says \'The teleport stone is currently aligned to Brell\'s Rest.\'');  
    }
  }
}