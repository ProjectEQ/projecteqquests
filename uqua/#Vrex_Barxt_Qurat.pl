my $hpatinvul = 0;

sub EVENT_SPAWN {
  quest::settimer(1,180);
  quest::settimer(3,1);
  quest::setnexthpevent(40);
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::stoptimer(1);
    quest::settimer(2,30);
    quest::spawn2(292072,0,0,-830,-83,59,239);
    quest::spawn2(292072,0,0,-822,-77,59,237);
    quest::spawn2(292072,0,0,-813,-74,59,236);  
    quest::spawn2(292072,0,0,-921,-76,59,16);
    quest::spawn2(292072,0,0,-911,-79,59,11);
    quest::spawn2(292072,0,0,-902,-83,59,13);
    quest::spawn2(292072,0,0,-886,117,59,113);
    quest::spawn2(292072,0,0,-895,112,59,114);
    quest::spawn2(292072,0,0,-904,109,59,113);
    quest::spawn2(292072,0,0,-808,102,59,145);
    quest::spawn2(292072,0,0,-817,106,59,141);
    quest::spawn2(292072,0,0,-827,110,59,135);
    quest::depopall(292071);
    quest::modifynpcstat("special_attacks","ABfHG");
    $hpatinvul = $npc->GetHP(); #remember HP when mob went invulnerable
    $npc->WipeHateList();
  }
  elsif ($timer == 2) {
    #safety check for signal getting lost
    $signal = 1;
    EVENT_SIGNAL();
  }
  if($timer == 3){
   if($y < -184) {
    $npc->GMMove(-869,-16,65,125);
   }
  } 
}

sub EVENT_HP {
  if($hpevent == 40) {
    quest::emote("Barxt's bond with the Guardian of Destruction causes his skin to harden like rock, giving his lithe body an onyx sheen.  He cracks a devilish smile and beckons you to continue.");
    quest::spawn2(292074,0,0,-748,16,60,191);
    quest::spawn2(292075,0,0,-985,15,60,62);
    $npc->ModSkillDmgTaken(0, -70); #1h blunt
    $npc->ModSkillDmgTaken(1, -70); #1h slashing
    $npc->ModSkillDmgTaken(2, -70); #2h blunt
    $npc->ModSkillDmgTaken(3, -70); #2h slashing
    $npc->ModSkillDmgTaken(7, -70); #archery
    $npc->ModSkillDmgTaken(28, -70); #hand to hand
    $npc->ModSkillDmgTaken(36, -70); #piercing
    $npc->ModSkillDmgTaken(51, -70); #throwing
    $npc->ModSkillDmgTaken(77, -70); #2h piercing
    quest::setnexthpevent(10);
  } elsif ($hpevent == 10) {
    quest::emote("Barxt's cronies focus their attention to his defense, causing tendrils of dark magic to wrap around his slender frame.  He laughs, reveling in his newfound resistance to offensive spells.");
    quest::modifynpcstat("mr","300");
    quest::modifynpcstat("pr","300");
    quest::modifynpcstat("fr","300");
    quest::modifynpcstat("cr","300");
    quest::modifynpcstat("dr","300");
  }
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    $npc->SetHP($hpatinvul);
    if(!$entity_list->IsMobSpawnedByNpcTypeID(292072)) {
      quest::modifynpcstat("special_attacks","RFQUMCNIDFf");
      if($entity_list->IsMobSpawnedByNpcTypeID(292070)) {
        quest::spawn2(292073,0,0,-866,-43,61,130);
        quest::depop(292070);
      }
      quest::settimer(1,180);
      quest::stoptimer(2);
    }
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(292076,0,0,$x,$y,$z,$h);
}
