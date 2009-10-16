#
#Plane of justice
#
#
#Trial of Execution
#
#
#Tribunal script - ENTRY into the chamber.
#
#
# - Wizardanim
# - tested 4/4/07
#
###################################

sub EVENT_SAY
{
	if(defined $qglobals{pop_poj_mavuin} && ((!defined $execution) || ($execution > 0 && $execution < 6)))
	{

		if($text=~/Hail/i)
		{
			quest::say("The Tribunal fixes you with a dark, peircing gaze. 'What do you want, mortal? Are you [prepared]?");
 		}
 	     	elsif($text=~/prepared/i)
 	     	{
			quest::say("Very well. When you are ready, you may [begin the trial of execution]. The victim will perish should the hooded executioner reach him. Its life will end only when all of the nemeses which accompany it also perish. We shall judge the mark of your success, and you will bring me the mark from the Hooded Executioner Himself!");
		}
		elsif($text=~/trial of execution/i && !defined $execution)
		{
			quest::say("Then begin.");
			quest::movepc(201,192,-1055,75);
			quest::settimer(47,30);
			quest::signal(201076,15000);
			$execution=1;
		}
		elsif($text=~/trial of execution/i && $execution > 0 && $execution < 6)
		{
			quest::movepc(201,192,-1055,75);
			quest::say("Then begin.");		
			$execution++;
		}
	}	
	else 
	{
        quest::say("I'm sorry, the Trial of Execution is currently unavilable to you.");
        }
	{
	$pop_poj_mavuin=undef;
	}
}
          

sub EVENT_TIMER
{
	if($timer == 1)
     	{
   		$execution=undef;
   		quest::stoptimer(1);
   		quest::signal(201078,5);
     	}

   	if($timer == 47) {
		$execution=6;
        	quest::stoptimer(47);
        	quest::settimer(1,1200);
	}
}

sub EVENT_SIGNAL
{
   quest::shout("The trial of Execution is now available."); #notify once timer expires OR FAIL. (~25 minutes)
   $execution=undef;
   quest::signal(201433);
   quest::stoptimer(1);
}

sub EVENT_ITEM 
{
	if(defined $qglobals{pop_poj_mavuin})
	{
		if(plugin::check_handin(\%itemcount, 31842 => 1))  
		{
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_execution", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31842);
		}
		elsif(plugin::check_handin(\%itemcount, 31796 => 1)) 
		{
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_flame", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31796);
		}
		elsif(plugin::check_handin(\%itemcount, 31960 => 1)) 
		{
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_lashing", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31960);
		}
		elsif(plugin::check_handin(\%itemcount, 31845 => 1)) 
		{
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_stoning", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31845);
		}
		elsif(plugin::check_handin(\%itemcount, 31844 => 1)) 
		{
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_torture", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31844);
		}
		else {
			plugin::return_items(\%itemcount);
  		}  
	}
	else 
	{
		plugin::return_items(\%itemcount);
  	}  
	{
	$pop_poj_mavuin=undef;
	}
}
