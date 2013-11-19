sub EVENT_ENTERZONE
{
	if (quest::istaskcompleted(138) == 0 && quest::istaskactive(138) == 0) #Check if completed Task: New Beginnings
	{
    	quest::assigntask(138); #Force assign Task: New Beginnings
  	}
}

sub EVENT_CLICKDOOR
{
	my $popuptext = "If you do not respond within 5 seconds, you will automatically be sent to the overhauled version.";

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
  	if($doorid == 19)
	{
		$zonename = "Innothule Swamp";
		if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
	  	{
	  		quest::movepc(46,-34,-721,-27,221.21);
	  	}
	  	elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
	  	{
	  		quest::movepc(413,-361,-462,5);
	  	}
	  	else  #SoF/SoD/UF
	  	{
	  		quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",2,1);
			quest::settimer(2,5);
	  	}
  	}
  	if($doorid == 22)    #erud
	{
		#$zonename = "Toxxulia Forest";
		#if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
		#{
		#  	quest::movepc(38,296,-2330,-45.4,127);
		#}
		#elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
		#{
		#  	quest::movepc(414,248,-1684,33,88);
		#}
		#else  #SoF/SoD/UF
		#{
		#       quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",3,1);
		#       quest::settimer(3,5);
		#}
		quest::movepc(38,296,-2330,-45.4,127);
  	}
  	if($doorid == 32)    #paineel
	{
		#$zonename = "Toxxulia Forest";
		#if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
		#{
		#  	quest::movepc(38,-569,2325,-43.4,39);
		#}
		#elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
		#{
		#  	quest::movepc(414,-1801,1907,119,195.5);
		#}
		#else  #SoF/SoD/UF
		#{
		#       quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",4,1);
		#       quest::settimer(4,5);
		#}
		quest::movepc(38,-569,2325,-43.4,39);
  	}
  	if($doorid == 24)
	{
		$zonename = "Steamfont Mountains";
		if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
		{
		  	quest::movepc(56,933.79,-1358,-109);
		}
		elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
		{
		  	quest::movepc(448,940,-1122,5,98);
		}
		else  #SoF/SoD/UF
		{
		       quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",5,1);
		       quest::settimer(5,5);
		}
  	}
  	if($doorid == 25)
	{
		$zonename = "Freeport West";
		if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
		{
		  	quest::movepc(9,77.31,-660.57,-30.24);
		}
		elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
		{
		  	quest::movepc(383,-173,-188,-69,192);
		}
		else  #SoF/SoD/UF
		{
		       quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",6,1);
		       quest::settimer(6,5);
		}
  	}
}


sub EVENT_POPUPRESPONSE
{
	if($popupid == 2)
	{
		quest::movepc(46,-34,-721,-27,221.21);
	}
	if($popupid == 3)
	{
		quest::movepc(38,296,-2330,-45.4,127);
	}
	if($popupid == 4)
	{
                quest::movepc(38,-569,2325,-43.4,39);
	}
	if($popupid == 5)
	{
                quest::movepc(56,933.79,-1358,-109);
	}
	if($popupid == 6)
	{
                quest::movepc(9,77.31,-660.57,-30.24);
	}
}

sub EVENT_TIMER
{
	if($timer == 2)
	{
		quest::movepc(413,-361,-462,5);
	}
	if($timer == 3)
	{
		quest::movepc(414,248,-1684,33,88);
	}
	if($timer == 4)
	{
		quest::movepc(414,-1801,1907,119,195.5);
	}
	if($timer == 5)
	{
                quest::movepc(448,940,-1122,5,98);
	}
	if($timer == 6)
	{
                quest::movepc(383,-173,-188,-69,192);
	}
}
