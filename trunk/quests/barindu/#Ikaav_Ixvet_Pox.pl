sub EVENT_SIGNAL {
  if($signal == 1) { # signal from #Abena_Taifa
    quest::say("Be gone. I've no interest in your fruits today.");
    # signal the Aneuk Controller
    quest::signalwith(283047,1,10);
  } elsif($signal == 2) { # signal from Aneuk_Controller
    quest::say("What have you done, slave! Try to poison me? You will pay for your insolence!");
	# attack #Abena_Taifa
    quest::attacknpctype(283081);
    # signal the Aneuk Controller
    quest::signalwith(283047,3,1);
	# repop as Ikaaz_Ixvet_Pox??
    quest::depop_withtimer();
    quest::spawn2(283162,0,0,$x,$y,$z,$h);
  }
}

sub EVENT_DEATH_COMPLETE {
  #repop the lootable talwin's remains
  quest::depop(283153);
  quest::spawn2(283048,0,0,-574,568,-98,168);
}
