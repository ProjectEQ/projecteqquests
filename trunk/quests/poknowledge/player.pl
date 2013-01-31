sub EVENT_ENTERZONE 
{
	if (quest::istaskcompleted(138) == 0 && quest::istaskactive(138) == 0) #Check if completed Task: New Beginnings
	{ 
    	quest::assigntask(138); #Force assign Task: New Beginnings
  	}
}

sub EVENT_CLICKDOOR 
{
	if($doorid == 138) #guild lobby
  	{ 
    		if($client->CalculateDistance(1408, -377, -113) <= 30) 
    		{
      			if(($client->GetClientVersionBit() & 4294967264)!= 0) 
      			{
        			quest::MovePCInstance(344,5,18,-46,6,225);
      			}
      			else 
      			{  
        			quest::movepc(344,18,-46,6,225);
      			}
    		}
	}
  	if($doorid == 139) #bazaar
  	{ 
    		if($client->CalculateDistance(1452, 347, -113) <= 30) 
    		{
      			quest::movepc(151,-425,0,-25,65);
    		}
  	}
  	if($doorid == 37) #Misty
  	{
  		if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
  		{
  			quest::movepc(33,-1262.71,-546,8,2);
  		}
  		elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
  		{
  			quest::movepc(415,-209,-324,8,126.5);
  		}
  		else  #SoF/SoD/UF
  		{
  			quest::popup("Misty Thicket","Send you to the Classic Misty Thicket? If you do not respond within 5 seconds, you will automatically be sent to the overhauled version.",1,1);
			quest::settimer(1,5);
  		}
  	}
}


sub EVENT_POPUPRESPONSE 
{
	if($popupid == 1)
	{
		quest::movepc(33,-1262.71,-546,8,2);
	}
}

sub EVENT_TIMER
{
	if($timer == 1)
	{
		quest::movepc(415,-209,-324,8,126.5);
	}
}
			
