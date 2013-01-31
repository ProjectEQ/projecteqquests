sub EVENT_CLICKDOOR 
{
	if($doorid == 2 || $doorid == 4 || $doorid == 40 || $doorid == 42) 
	{
    		if($uguild_id > 0) 
    		{
      			if (defined($qglobals{"ginstance$uguild_id"})) 
      			{
        			$guildinstance = $qglobals{"ginstance$uguild_id"};
        			quest::AssignToInstance($guildinstance);
        			quest::MovePCInstance(345, $guildinstance, -1.00, -1.00, 3.34);
      			}
      			else 
      			{
        			$guildinstance = quest::CreateInstance("guildhall", 1, 86400);
        			quest::AssignToInstance($guildinstance); 
        			quest::setglobal("ginstance$uguild_id",$guildinstance,7,"H25");
        			quest::MovePCInstance(345, $guildinstance, -1.00, -1.00, 3.34)
      			}
    		}
  	}
  	if((($doorid >= 5) && ($doorid <= 38)) ||  (($doorid >= 43) && ($doorid <= 76)))
  	{
		$client->OpenLFGuildWindow();
  	}
}

sub EVENT_ENTERZONE 
{
	if(($client->GetClientVersionBit() & 4294967264)!= 0) 
	{
		if($client->GetInstanceID() != 5) 
		{
			quest::settimer(1,10);
			$client->Message(0,"Invalid Zone(344:0): You will be redirected to the proper instance in 10 seconds.");
		}
	}
	else {
		if($client->GetInstanceID() == 5) 
		{
			quest::settimer(2,10);
			$client->Message(0,"Invalid Zone(344:5): You will be redirected to the proper zone in 10 seconds.");
		}
	}
}
	
sub EVENT_TIMER 
{
	if($timer == 1)
	{
		quest::MovePCInstance(344,5,$x,$y,$z,225);
	}
	if($timer == 2)
	{
		quest::movepc(344,$x,$y,$z,225);
	}
}