sub EVENT_ENTERZONE {
	BEGINRAID();
	quest::settimer("player_check", 10);
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}

sub EVENT_TIMER {
	if ($timer eq "player_check") {
		if (defined($qglobals{potimeb_finished})) {
			quest::delglobal("potimeLockout");
			quest::setglobal("potimeLockout", 6, 5, "D7");
			quest::delglobal("potime_canzone");
			quest::movepc(202, -55.82, 43.93, -158.81);
		}
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
}

sub EVENT_CLICKDOOR {
	my $d_id = ($doorid % 256);
	my $instance = quest::GetInstanceID("potimeb", 0);

	my $three = $entity_list->GetMobByNpcTypeID(223997);
        my $four = $entity_list->GetMobByNpcTypeID(223998);
        my $five = $entity_list->GetMobByNpcTypeID(223999);

	if ($d_id == 62 && $three) {
                quest::setglobal("potimeLockout", 3, 5, "H24");
		quest::MovePCInstance(223, $instance, -401, 0, 348);
	} elsif($d_id == 24 && $four) {
                quest::setglobal("potimeLockout", 4, 5, "H24");
		quest::MovePCInstance(223, $instance, -419, 0, 3);
	} elsif($d_id == 51 && $five) {
                quest::setglobal("potimeLockout", 5, 5, "H24");
		quest::MovePCInstance(223, $instance, 251, -1124, -1);
	} 
}

sub BEGINRAID {
	if (!defined($qglobals{potimeLockout}) && !defined($qglobals{potime_canzone})) {
		quest::setglobal("potimeLockout", 1, 5, "H24");
		quest::setglobal("potime_canzone", 1, 5, "H24");
	}
}