sub EVENT_ENTERZONE {
	quest::settimer("spires",30);
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}

sub EVENT_TIMER {
	if ($timer eq "spires" && defined $qglobals{antonica_port} && defined $qglobals{nexus_ant}) {
		quest::selfcast("2708"); #antonica
		quest::setglobal("nexus_ant",0,1,"S60");
		$nexus_ant = undef;
		$antonica_port = undef;
	}
	elsif ($timer eq "spires" && defined $qglobals{faydwer_port} && defined $qglobals{nexus_fay}) {
		quest::selfcast("2706"); #faydwer
		quest::setglobal("nexus_fay",0,1,"S60");
		$nexus_fay = undef;
		$qglobals{faydwer_port} = undef;
	}
	elsif ($timer eq "spires" && defined $qglobals{odus_port} && !defined $qglobals{velious_port} && defined $qglobals{nexus_vos}) {
		quest::selfcast("2707"); #odus
		quest::setglobal("nexus_vos",0,1,"S60");
		$qglobals{nexus_vos} = undef;
		$qglobals{odus_port} = undef;
	}
	elsif ($timer eq "spires" && defined $qglobals{velious_port} && !defined $qglobals{odus_port} && defined $qglobals{nexus_vos}) {
		quest::selfcast("2062"); #velious
		quest::setglobal("nexus_vos",0,1,"S60");
		$qglobals{nexus_vos} = undef;
		$qglobals{velious_port} = undef;
	}
	elsif ($timer eq "spires" && defined $qglobals{kunark_port} && defined $qglobals{nexus_kun}) {
		quest::selfcast("2709"); #kunark
		quest::setglobal("nexus_kun",0,1,"S60");
		$qglobals{nexus_kun} = undef;
		$qglobals{kunark_port} = undef;
	}
	elsif ($timer eq "spires" && defined $qglobals{velious_port} && defined $qglobals{odus_port} && defined $qglobals{nexus_vos}) {
		$client->Message(15,"The Odus and Velious port is very volatile, and often misplaces people. Feel lucky you ended up back here! You should be ported properly next cycle. We're sorry for the inconvenience!");
		quest::selfcast("2433"); #unlikely but could happen. send to nexus.
		quest::setglobal("nexus_vos",0,1,"S60");
		$qglobals{nexus_vos} = undef;
		$qglobals{velious_port} = undef;
		$qglobals{odus_port} = undef;
	}
if ($timer == 1) {
$whimsy_count++;
}
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
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