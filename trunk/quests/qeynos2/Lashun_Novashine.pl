#BeginFile: Lashun_Novashine.pl
#Quest for North Qeynos - Lashun Novashine: Bone Chips (Qeynos)

sub EVENT_SPAWN {
  $ItemCount=0; #Bone Chip counter
  quest::settimer(1,60); #Emote timer (2 minutes)
}

sub EVENT_TIMER {
  quest::emote("shouts, 'Cease this endless conflict...'");
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met, $name. My name is Lashun Novashine and I am a humble priest of Rodcet Nife, the Prime Healer. I wish to spread His word to every corner of Norrath. My job gets more difficult each day with so many so willing to take lives rather than preserve them.");
  }
}

sub EVENT_ITEM {
  if ($ItemCount==0) { #No item left over
    if (plugin::check_handin(\%itemcount, 13073 => 1)) { #Bone Chips (1)
      quest::say("Ah good, I see you seek healing. But you must offer the remains of one more minion of Bertoxxulous before Rodcet will deem you worthy.");
      $ItemCount=1;
    }
    elsif (plugin::check_handin(\%itemcount, 13073 => 2)) { #Bone Chips (2)
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      $npc->CastSpell(17,$userid); #Light Healing
      quest::faction(257,1); #Priests of Life
      quest::faction(183,1); #Knights of Thunder
      quest::faction(135,1); #Guards of Qeynos
      quest::faction(21,-1); #Bloodsabers
      quest::faction(9,1);   #Antonius Bayle
      $ItemCount=0;
    }
    elsif (plugin::check_handin(\%itemcount, 13073 => 3)) { #Bone Chips (3)
      quest::say("Ah good, I see you seek healing. But you must offer the remains of one more minion of Bertoxxulous before Rodcet will deem you worthy.");
      $ItemCount=1;
    }
    elsif (plugin::check_handin(\%itemcount, 13073 => 4)) { #Bone Chips (4)
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      $npc->CastSpell(17,$userid); #Light Healing
      quest::faction(257,1); #Priests of Life
      quest::faction(183,1); #Knights of Thunder
      quest::faction(135,1); #Guards of Qeynos
      quest::faction(21,-1); #Bloodsabers
      quest::faction(9,1);   #Antonius Bayle
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      quest::faction(257,1); #Priests of Life
      quest::faction(183,1); #Knights of Thunder
      quest::faction(135,1); #Guards of Qeynos
      quest::faction(21,-1); #Bloodsabers
      quest::faction(9,1);   #Antonius Bayle
      $ItemCount=0;
    }
    elsif ($gold == 2) { #Gold (2) / This portion of quest needs verification. Does it mean he is corrupt for accepting coin?
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      $npc->CastSpell(17,$userid); #Light Healing
      quest::faction(257,2); #Priests of Life
      quest::faction(183,2); #Knights of Thunder
      quest::faction(135,2); #Guards of Qeynos
      quest::faction(21,-2); #Bloodsabers
      quest::faction(9,2);   #Antonius Bayle
    }
    else {
      quest::say("I have no need for this, $name.");
      plugin::return_items(\%itemcount);
    }
  }
  elsif ($ItemCount==1) { #Item left over
    if (plugin::check_handin(\%itemcount, 13073 => 1)) { #Bone Chips (1)
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      $npc->CastSpell(17,$userid); #Light Healing
      quest::faction(257,1); #Priests of Life
      quest::faction(183,1); #Knights of Thunder
      quest::faction(135,1); #Guards of Qeynos
      quest::faction(21,-1); #Bloodsabers
      quest::faction(9,1);   #Antonius Bayle
      $ItemCount=0;
    }
    elsif (plugin::check_handin(\%itemcount, 13073 => 2)) { #Bone Chips (2)
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      $npc->CastSpell(17,$userid); #Light Healing
      quest::faction(257,1); #Priests of Life
      quest::faction(183,1); #Knights of Thunder
      quest::faction(135,1); #Guards of Qeynos
      quest::faction(21,-1); #Bloodsabers
      quest::faction(9,1);   #Antonius Bayle
      quest::say("Ah good, I see you seek healing. But you must offer the remains of one more minion of Bertoxxulous before Rodcet will deem you worthy.");
      $ItemCount=1;
    }
    elsif (plugin::check_handin(\%itemcount, 13073 => 3)) { #Bone Chips (3)
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      $npc->CastSpell(17,$userid); #Light Healing
      quest::faction(257,1); #Priests of Life
      quest::faction(183,1); #Knights of Thunder
      quest::faction(135,1); #Guards of Qeynos
      quest::faction(21,-1); #Bloodsabers
      quest::faction(9,1);   #Antonius Bayle
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      quest::faction(257,1); #Priests of Life
      quest::faction(183,1); #Knights of Thunder
      quest::faction(135,1); #Guards of Qeynos
      quest::faction(21,-1); #Bloodsabers
      quest::faction(9,1);   #Antonius Bayle
      $ItemCount=0;
    }
    elsif (plugin::check_handin(\%itemcount, 13073 => 4)) { #Bone Chips (4)
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      $npc->CastSpell(17,$userid); #Light Healing
      quest::faction(257,1); #Priests of Life
      quest::faction(183,1); #Knights of Thunder
      quest::faction(135,1); #Guards of Qeynos
      quest::faction(21,-1); #Bloodsabers
      quest::faction(9,1);   #Antonius Bayle
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      quest::faction(257,1); #Priests of Life
      quest::faction(183,1); #Knights of Thunder
      quest::faction(135,1); #Guards of Qeynos
      quest::faction(21,-1); #Bloodsabers
      quest::faction(9,1);   #Antonius Bayle
      quest::say("Ah good, I see you seek healing. But you must offer the remains of one more minion of Bertoxxulous before Rodcet will deem you worthy.");
      $ItemCount=1;
    }
    elsif ($gold == 2) { #Gold (2) / This portion of quest needs verification. Does it mean he is corrupt for accepting coin?
      quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
      $npc->CastSpell(17,$userid); #Light Healing
      quest::faction(257,2); #Priests of Life
      quest::faction(183,2); #Knights of Thunder
      quest::faction(135,2); #Guards of Qeynos
      quest::faction(21,-2); #Bloodsabers
      quest::faction(9,2);   #Antonius Bayle
    }
    else {
      quest::say("I have no need for this, $name.");
      plugin::return_items(\%itemcount);
    }

  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:qeynos2 ID:2032 -- Lashun_Novashine.pl