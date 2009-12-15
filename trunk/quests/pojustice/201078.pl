#Plane of justice
#Trial of Execution
#
#Tribunal script - ENTRY into the chamber.
#
#
# - Wizardanim
# - tested 4/4/07
# - Modified by Kilelen
###################################

sub EVENT_SAY
{
	if(defined $qglobals{pop_poj_mavuin}) {
		if($text=~/Hail/i) {
			quest::emote(" fixes you with a dark, peircing gaze. 'What do you want, mortal? Are you [prepared]?");
		}
		
		elsif($text=~/prepared/i) {
			quest::say("Very well. When you are ready, you may begin the trial of execution. The victim will perish should the hooded executioner reach him. Its life will end only when all of the nemeses which accompany it also perish. We shall judge the mark of your success.");
		}
		
		elsif($text=~/begin the trial of execution/i) {
			if (!defined $execution) {
				quest::say("Then begin.");
				#Cast Penance of Execution
				$npc->CastSpell(1127, $userid);
				quest::settimer(101, 30);
				quest::signal(201076, 15000);
				$execution=1;
			}
			else {
				if (($execution > 0) && ($execution < 6)) {
					$npc->CastSpell(1127, $userid);
					quest::say("Then begin.");		
					$execution++;
				}
				else {
					quest::say("I'm sorry, the Trial of Execution is currently unavilable to you.");
				}
			}
		}
	}
}
          

sub EVENT_TIMER
{
	if($timer == 100) {
		$execution=undef;
		quest::stoptimer(100);
		quest::signalwith(201078,1,5);
	}

   	elsif($timer == 101) {
		$execution=6;
		quest::stoptimer(101);
		quest::settimer(100,1200);
	}
}

sub EVENT_SIGNAL
{
	if ($signal == 0) {
		quest::shout("The Trial of Execution is now available."); #notify once timer expires OR FAIL. (~25 minutes)
		$execution=undef;
		quest::signal(201433);
		quest::stoptimer(100);
	}
}

sub EVENT_ITEM 
{
	if(defined $qglobals{pop_poj_mavuin}) {
		if(plugin::check_handin(\%itemcount, 31842 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_execution", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31842);
		}
		
		elsif(plugin::check_handin(\%itemcount, 31796 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_flame", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31796);
		}
		
		elsif(plugin::check_handin(\%itemcount, 31960 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_lashing", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31960);
		}
		
		elsif(plugin::check_handin(\%itemcount, 31845 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_stoning", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31845);
		}
		
		elsif(plugin::check_handin(\%itemcount, 31844 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_torture", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31844);
		}
		
		elsif(plugin::check_handin(\%itemcount, 31846 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_hanging", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31846);
		}
		
		else {
			plugin::return_items(\%itemcount);
  		}  
	}
	else 
	{
		plugin::return_items(\%itemcount);
  	}
}
