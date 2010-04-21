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
                		$guildinstance = quest::CreateInstance("guildhall", 0, 86400);
                		quest::AssignToInstance($guildinstance); 
                		quest::setglobal("ginstance$uguild_id",$guildinstance,7,"H24");
                		quest::MovePCInstance(345, $guildinstance, 0, 0, 0);
            		}
        	}
    	}
}