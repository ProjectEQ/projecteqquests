sub EVENT_ENTERZONE 
{
  	if(!defined($qglobals{time_enter}) && $status < 10)
  	{
    		quest::we(15, "The earth rumbles, sky thunders, volcanoes erupt, and tidal waves crash as the Gods prepare their armies for battle. The first of the mortals have obtained the power to cross into the Plane of Time!");
    		quest::setglobal("time_enter",1,7,"F");
  	}
}

sub EVENT_CLICKDOOR 
{
	my $instance = quest::GetInstanceID("potimeb", 0);
  	if ($instance > 0) 
  	{
    		if ($doorid == 8) 
    		{
			DOORA($instance);
    		}
    		elsif ($doorid == 9) 
    		{
			DOORB($instance);
    		}
    		elsif ($doorid == 10) 
    		{
			DOORC($instance);
    		}
    		elsif ($doorid == 11) 
    		{
			DOORD($instance);
    		}
    		elsif ($doorid == 12) 
    		{
			DOORE($instance);
    		}
  	}
  	else
  	{
  		if ($doorid == 8) 
		{
			CREATEINSTANCE($doorid);
		}
		elsif ($doorid == 9) 
		{
			CREATEINSTANCE($doorid);
		}
		elsif ($doorid == 10) 
		{
			CREATEINSTANCE($doorid);
		}
		elsif ($doorid == 11) 
		{
			CREATEINSTANCE($doorid);
		}
		elsif ($doorid == 12) 
		{
			CREATEINSTANCE($doorid);
    		}
  		
  	}
}

sub CREATEINSTANCE 
{
	my $doorid = $_[0];
	$running = quest::GetInstanceID("potimeb", 0);
	$raid = $client->GetRaid();
	
	if ($raid) 
	{
		if (defined($qglobals{potimeLockout}) || defined($qglobals{potime_canzone})) 
		{
			$client->Message(13, "You are not ready yet to start a new raid");
		} 
		elsif ($running == 0 && !(defined($qglobals{potimeLockout}) || defined($qglobals{potime_canzone}))) 
		{
			$instance = quest::CreateInstance("potimeb", 0, 232000);
			quest::AssignRaidToInstance($instance);
			if ($doorid == 8) 
			{
				DOORA($instance);
			}
			elsif ($doorid == 9) 
			{
				DOORB($instance);
			}
			elsif ($doorid == 10) 
			{
				DOORC($instance);
			}
			elsif ($doorid == 11) 
			{
				DOORD($instance);
			}
			elsif ($doorid == 12) 
			{
				DOORE($instance);
    			}

		}
	} 
	else 
	{
		$client->Message(13, "You are not a part of an instance and are not in a raid!");
	}
}

sub DOORA 
{
	my $instance = $_[0];
	$client->Message(10, "The portal, dim at first, begins to glow brighter.");
	$client->Message(10, "The portal flashes briefly, then glows steadily.");
	quest::MovePCInstance(223, $instance, -36, 1352, 496);
}

sub DOORB
{
	my $instance = $_[0];
	$client->Message(10, "The portal, dim at first, begins to glow brighter.");
	$client->Message(10, "The portal flashes briefly, then glows steadily.");
	quest::MovePCInstance(223, $instance, -51, 857, 496);
}

sub DOORC
{
	my $instance = $_[0];
	$client->Message(10, "The portal, dim at first, begins to glow brighter.");
	$client->Message(10, "The portal flashes briefly, then glows steadily.");
	quest::MovePCInstance(223, $instance, -35, 1636, 496);
}

sub DOORD
{
	my $instance = $_[0];
	$client->Message(10, "The portal, dim at first, begins to glow brighter.");
	$client->Message(10, "The portal flashes briefly, then glows steadily.");
	quest::MovePCInstance(223, $instance, -55, 569, 496);
}

sub DOORE
{
	my $instance = $_[0];
	$client->Message(10, "The portal, dim at first, begins to glow brighter.");
	$client->Message(10, "The portal flashes briefly, then glows steadily.");
	quest::MovePCInstance(223, $instance, -27, 1103, 496);
}