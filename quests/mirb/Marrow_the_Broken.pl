my $size = 16;
my $marrow_hp_event = 90;

sub EVENT_SPAWN {
  quest::depopall(294137);
  quest::setnexthpevent($marrow_hp_event);
}

sub EVENT_DEATH {
  #send signal to Durgin_Skell(237743) that Marrow the Broken has died
  quest::signalwith(237743,3,1);
  #quest::ze(15, "Marrow the Broken's corpse crackles as bones shatter under its immense dead weight");
}

sub EVENT_HP {
  # As Marrow the Broken loses health, he shrinks and spawns a splinterbone. The last fragment occurs at 30%.
  if($hpevent == $marrow_hp_event) {
    quest::emote("Fragments of body parts splinter from the golem and shower the floor. Within moments, these pieces of ossified bone reassemble with scattered debris to form something else.");
    $size=$size-1;
    quest::npcsize($size);
    quest::spawn2(237792,0,0,$x,$y,$z,$h); #spawn a splinterbone skeleton
    $marrow_hp_event = $marrow_hp_event - 10;
    if ($marrow_hp_event > 20) {
      quest::setnexthpevent($marrow_hp_event);
    }
  }
}