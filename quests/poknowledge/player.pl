sub EVENT_ENTERZONE 
{
	if (quest::istaskcompleted(138) == 0 && quest::istaskactive(138) == 0) #Check if completed Task: New Beginnings
	{
		quest::assigntask(138); #Force assign Task: New Beginnings
	}
	
	if(defined $qglobals{$name}) 
	{
		quest::delglobal("$name");
	}	
}

sub EVENT_CLICKDOOR {
	my $d_id = ($doorid % 256);
  	if($d_id == 138) {
        	if($uguild_id > 0) {
            		if (defined($qglobals{"glinstance$uguild_id"})) {
                		$guildinstance = $qglobals{"glinstance$uguild_id"};
                		quest::AssignToInstance($guildinstance);
                		quest::MovePCInstance(344, $guildinstance, 18, -46, 6);
            		}
            		else {
                		$guildinstance = quest::CreateInstance("guildlobby", 0, 86400);
                		quest::AssignToInstance($guildinstance); 
                		quest::setglobal("glinstance$uguild_id",$guildinstance,7,"H24");
                		quest::MovePCInstance(344, $guildinstance, 18, -46, 6);
            		}
        	}
    	}
}