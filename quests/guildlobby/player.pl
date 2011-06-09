sub EVENT_ENTERZONE {
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}
sub EVENT_TIMER  {
$whimsy_count++;
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
  	if($d_id == 2 || $d_id == 4) {
        	if($uguild_id > 0) {
            		if (defined($qglobals{"ginstance$uguild_id"})) {
                		$guildinstance = $qglobals{"ginstance$uguild_id"};
                		quest::AssignToInstance($guildinstance);
                		quest::MovePCInstance(345, $guildinstance, -1.2, -126, 2.2);
            		}
            		else {
                		$guildinstance = quest::CreateInstance("guildhall", 1, 86400);
                		quest::AssignToInstance($guildinstance); 
                		quest::setglobal("ginstance$uguild_id",$guildinstance,7,"H24");
                		quest::MovePCInstance(345, $guildinstance, -1.2, -126, 2.2);
            		}
        	}
    	}
}