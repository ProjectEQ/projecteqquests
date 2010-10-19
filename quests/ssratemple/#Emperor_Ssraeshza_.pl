#BEGIN File: ssratemple\#Emperor_Ssraeshza_.pl (Real)

my $engaged = 0;

sub EVENT_SPAWN {
  quest::settimer("EmpDepop", 600);
}

sub EVENT_TIMER {
  quest::stoptimer("EmpDepop");
  quest::signalwith(162260,3,0); #EmpCycle
  quest::depop();
}

sub EVENT_COMBAT {
  if (($combat_state == 1) && ($engaged == 0)) {
    quest::settimer("EmpDepop", 2400);
    $engaged = 1;
  }
}
  
sub EVENT_DEATH {
  quest::emote("'s corpse says 'How...did...ugh...'");
  quest::spawn2(162210,0,0,953,-332,403.1,190); #Shissar Wraith
  quest::spawn2(162210,0,0,953,-324,403.1,190);
  quest::spawn2(162210,0,0,953,-316,403.1,190);
  quest::spawn2(162210,0,0,937,-332,403.1,190);
  quest::spawn2(162210,0,0,937,-324,403.1,190);
  quest::spawn2(162210,0,0,937,-316,403.1,190);
  quest::signalwith(162260,2,0); #EmpCycle
}

sub EVENT_SLAY {
  quest::say("Your god has found you lacking.");
}

sub EVENT_AGGRO {
  my $guard1 = $entity_list->GetNPCByNPCTypeID(162123); #Heriz
  my $guard2 = $entity_list->GetNPCByNPCTypeID(162124); #Yasiz
  my $guard3 = $entity_list->GetNPCByNPCTypeID(162125); #Zlakas
  my $guard4 = $entity_list->GetNPCByNPCTypeID(162126); #Nilasz
  my $guard5 = $entity_list->GetNPCByNPCTypeID(162127); #Skzik
  my $guard6 = $entity_list->GetNPCByNPCTypeID(162128); #Grziz
  my $guard7 = $entity_list->GetNPCByNPCTypeID(162129); #Slakiz
  my $guard8 = $entity_list->GetNPCByNPCTypeID(162130); #Klazaz

  if ($guard1) {
    $guard1->AddToHateList($client, 1);
  }
  if ($guard2) {
    $guard2->AddToHateList($client, 1);
  }
  if ($guard3) {
    $guard3->AddToHateList($client, 1);
  }
  if ($guard4) {
    $guard4->AddToHateList($client, 1);
  }
  if ($guard5) {
    $guard5->AddToHateList($client, 1);
  }
  if ($guard6) {
    $guard6->AddToHateList($client, 1);
  }
  if ($guard7) {
    $guard7->AddToHateList($client, 1);
  }
  if ($guard8) {
    $guard8->AddToHateList($client, 1);
  }
}

sub EVENT_SIGNAL {
  my $new_guard = $entity_list->GetNPCByNPCTypeID($signal);
  my $hate_target = $npc->GetHateTop();

  $new_guard->AddToHateList($hate_target->CastToClient(), 1);
}

# EOF zone: ssratemple ID: 162227 NPC: #Emperor_Ssraeshza_ (Real)