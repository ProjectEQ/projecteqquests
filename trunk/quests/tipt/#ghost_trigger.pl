my $instid = 0;

#trigger for the an_enraged_maternal_cragbeast event
sub EVENT_SPAWN {
  quest::set_proximity($x-75,$x+75,$y-75,$y+75);
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    SPAWN_GARJAH();
  }
}

sub SPAWN_GARJAH {
  #if there are no more ghosts and Garjah is not up
  if(!$entity_list->GetMobByNpcTypeID(289035) && !$entity_list->GetMobByNpcTypeID(289048) && !$entity_list->GetMobByNpcTypeID(289038)) {
    quest::spawn2(289033,0,0,$x,$y,$z,$h); #spawn Garkah Zotaki
    quest::setglobal($instid.'_tipt_status',5,7,"H6");
    quest::stoptimer(1);
    $npc->Depop(0);
  } else {
    quest::settimer(1,5);
  }
}

sub EVENT_TIMER {
  if($timer == 1) {
    SPAWN_GARJAH();
  }
}

sub EVENT_ENTER {
  if($instid == 0) {
    $instid = quest::GetInstanceID("tipt",0);
  }
  if($qglobals{$instid.'_tipt_status'} == 3) {
    my $close_clount = 0;
    foreach $pc ($entity_list->GetClientList()) {
      if($pc->CalculateDistance($x, $y, $z) <= 50) {
        $close_count++;
      }
    }
    if($close_count >= 3) {
      quest::ze(13,'shivers run up and down your spine, something is not quite right here, the area feels quite chill and desolate'); 
      quest::spawn2(289035,0,0,-1274,996,396,191);
      quest::spawn2(289035,0,0,-1351,796,394,4);
      quest::spawn2(289035,0,0,-1323,996,396,64);
      quest::spawn2(289035,0,0,-1275,779,396,193);
      quest::spawn2(289035,0,0,-1348,973,394,122);
      quest::spawn2(289035,0,0,-1321,779,396,63);
      quest::spawn2(289035,0,0,-1254,799,395,246);
      quest::spawn2(289035,0,0,-1249,962,394,153);

      #set zone status to 4
      quest::setglobal($instid.'_tipt_status',4,7,"H6");
    }
  }
}