sub EVENT_ENTERZONE 
{
	if(!defined $qglobals{tutbind} && $ulevel == 1) 
	{
		quest::selfcast(2049);
		quest::setglobal("tutbind",1,1,"D30");
	}
	
	if(!defined $qglobals{tutpop}) 
	{
		quest::popup("Join the revolution!", "Welcome to the Revolt! You have been given two new quests:
			<br><br><c \"#FFFF00\">Rally with Rahtiz:</c><br>If you are ready to begin fighting for the revolt, 
			hail Guard Rahtiz and see where you are needed.<br><br><c \"#FFFF00\">Basic Training:</c><br>If you 
			would like more training on the finer points of Everquest, speak with Arias and he will direct you to other knowledgeable 
			members of the slave revolt.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
			quest::assigntask(22);
			quest::assigntask(23);
			quest::setglobal("tutpop",1,1,"D30");
	}
	
	if($ulevel > 15 && $status < 80)
	{
		$client->Message(15,"You are too high in level to be in this zone.");
		quest::selfcast(2433);
	}  
}

sub EVENT_TASK_STAGE_COMPLETE 
{
	if ($task_id == 34)
	{
		quest::ze(15, "A cheer arises from the slaves as the last of the Kobold overseers fall.");
	}
} 

sub EVENT_CLICKDOOR 
{
	my $d_id = ($doorid % 256);
	if($d_id == 11)
	{
		my $s_zone = $client->GetStartZone();
		if($s_zone == 9)
		{
			quest::movepc(9,-60.9,-61.5,-24.9);
		}
		elsif($s_zone == 19)
		{
			quest::movepc(19,-98.4,11.5,3.1);
		}
		elsif($s_zone == 24)
		{
			quest::movepc(24,-309.8,109.6,23.1);
		}
		elsif($s_zone == 25)
		{
			quest::movepc(25,-965.3,2434.5,5.6);
		}
		elsif($s_zone == 29)
		{
			quest::movepc(29,12.2,-32.9,3.1);
		}
		elsif($s_zone == 45)
		{
			quest::movepc(45,-343,189,-38.22);
		}
		elsif($s_zone == 49)
		{
			quest::movepc(49,520.1,235.4,59.1);
		}
		elsif($s_zone == 50)
		{
			quest::movepc(50,560,-2234,3);
		}
		elsif($s_zone == 52)
		{
			quest::movepc(52,1.1,14.5,3.1);
		}
		elsif($s_zone == 54)
		{
			quest::movepc(54,-197,27,-0.7);
		}
		elsif($s_zone == 55)
		{
			quest::movepc(55,7.6,489.0,-24.9);
		}
		elsif($s_zone == 61)
		{
			quest::movepc(61,26.3,14.9,3.1);
		}
		elsif($s_zone == 68)
		{
			quest::movepc(68,-214.5,2940.1,0.1);
		}
		elsif($s_zone == 75)
		{
			quest::movepc(75,200,800,3.39);
		}
		elsif($s_zone == 106)
		{
			quest::movepc(106,-415.7,1276.6,3.1);
		}
		elsif($s_zone == 155)
		{
			quest::movepc(155,105.6,-850.8,-190.4);
		}
		else
		{
			quest::movepc(202,-55,44,-158.81);
		}
	}
}