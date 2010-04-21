sub EVENT_CLICKDOOR {
	my $d_id = ($doorid % 256);
  	if($d_id == 2) {
        	if($uguild_id > 0) {
            		if (defined($qglobals{"glinstance$uguild_id"})) {
                		$guildinstance = $qglobals{"glinstance$uguild_id"};
                		quest::AssignToInstance($guildinstance);
                		quest::MovePCInstance(344, $guildinstance, -2.3, 582, 0.2);
            		}
            		else {
                		$guildinstance = quest::CreateInstance("guildlobby", 1, 86400);
                		quest::AssignToInstance($guildinstance); 
                		quest::setglobal("glinstance$uguild_id",$guildinstance,7,"H24");
                		quest::MovePCInstance(344, $guildinstance, -2.3, 582, 0.2);
            		}
        	}
    	}
}