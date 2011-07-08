sub EVENT_ENTERZONE {
    quest::settimer(1,30);
}

sub EVENT_TIMER {
  if (defined($qglobals{antonica_port}) && defined($qglobals{nexus_ant})) {
    quest::selfcast(2708); #antonica
    quest::setglobal("nexus_ant",0,1,"S60");
    $nexus_ant = undef;
    $antonica_port = undef;
  }
  elsif (defined($qglobals{faydwer_port}) && defined($qglobals{nexus_fay})) {
    quest::selfcast(2706); #faydwer
    quest::setglobal("nexus_fay",0,1,"S60");
    $nexus_fay = undef;
    $qglobals{faydwer_port} = undef;
  }
  elsif (defined($qglobals{odus_port}) && !defined($qglobals{velious_port}) && defined($qglobals{nexus_vos})) {
    quest::selfcast(2707); #odus
    quest::setglobal("nexus_vos",0,1,"S60");
    $qglobals{nexus_vos} = undef;
    $qglobals{odus_port} = undef;
  }
  elsif (defined($qglobals{velious_port}) && !defined($qglobals{odus_port}) && defined($qglobals{nexus_vos})) {
    quest::selfcast(2062); #velious
    quest::setglobal("nexus_vos",0,1,"S60");
    $qglobals{nexus_vos} = undef;
    $qglobals{velious_port} = undef;
  }
  elsif (defined($qglobals{kunark_port}) && defined($qglobals{nexus_kun})) {
    quest::selfcast(2709); #kunark
    quest::setglobal("nexus_kun",0,1,"S60");
    $qglobals{nexus_kun} = undef;
    $qglobals{kunark_port} = undef;
  }
  elsif (defined($qglobals{velious_port}) && defined($qglobals{odus_port}) && defined($qglobals{nexus_vos})) {
    $client->Message(15,"The Odus and Velious port is very volatile, and often misplaces people. Feel lucky you ended up back here! You should be ported properly next cycle. We're sorry for the inconvenience!");
    quest::selfcast(2433); #unlikely but could happen. send to nexus.
    quest::setglobal("nexus_vos",0,1,"S60");
    $qglobals{nexus_vos} = undef;
    $qglobals{velious_port} = undef;
    $qglobals{odus_port} = undef;
  }
  $qglobals{nexus_ant} = undef;
  $qglobals{antonica_port} = undef;
  $qglobals{nexus_fay} = undef;
  $qglobals{faydwer_port} = undef;
  $qglobals{nexus_vos} = undef;
  $qglobals{odus_port} = undef;
  $qglobals{velious_port} = undef;
  $qglobals{nexus_kun} = undef;
  $qglobals{kunark_port} = undef;
}