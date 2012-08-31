
sub EVENT_SPAWN {
  quest::setnexthpevent(99);
}

sub EVENT_SIGNAL {
  if($signal==1) {
    quest::settimer("SpawnAdds");
  }
}

sub EVENT_TIMER {
  if($timer eq "SpawnAdds") }
    if(!$entity_list->GetMobByNpcTypeID(296025) && !$entity_list->GetMobByNpcTypeID(296025)) {
	  quest::modifynpcstat("special_attacks","SQUMCNIDf");
	  SPAWN_MY_ADDS();
	  quest::stoptimer("SpawnAdds");
	}
  }
}

sub EVENT_HP {
  if($hpevent==99) {
    SPAWN_MY_ADDS();
    #go inactive
    quest::modifynpcstat("special_attacks","ABfHG");
  }
}

sub EVENT_DEATH {
  quest::emote("cries out, her booming alto echoing with contempt,");
  quest::say("Your victory here is hollow. With my death, the way to the lower reaches is unsealed. The denizens below destroy everything they touch. You will suffer their wrath!");
  quest::ze(15,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
  $entity_list->FindDoor(41)->SetLockPick(0);
  quest::spawn2(296027,0,0,165,-496,-27,64);
  my $instid = quest::GetInstanceID("inktuta",0);
  quest::setglobal($instid.'_inktuta_status',2,3,"H6");
  quest::depopall(296025);
  quest::depopall(296026);
}

sub SPAWN_MY_ADDS {
  quest::spawn2(quest::chooserandom(296025,296026),0,0,357,-549,-3,63); 
  quest::spawn2(quest::chooserandom(296025,296026),0,0,357,-451,-2,63);
  quest::spawn2(quest::chooserandom(296025,296026),0,0,285,-493,-2,63);
}