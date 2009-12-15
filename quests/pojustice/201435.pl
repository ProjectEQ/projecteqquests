#201435.pl
#Trial of Lashing

sub EVENT_SAY
{
	if(defined $qglobals{pop_poj_mavuin}) {
		if($text=~/Hail/i) {
			quest::emote(" fixes you with a dark, peircing gaze. 'What do you want, mortal? Are you [prepared]?");
		}
		
		elsif($text=~/prepared/i) {
			quest::say("Very well. When you are ready, you may begin the trial of lashing. You must protect the victims from their tormentors. Be wary of the scourge of honor - you cannot fight it directly. You must find and destroy its life force to defeat it. We shall judge the mark of your success.");
		}

		elsif($text=~/begin the trial of lashing/i) {
			if (!defined $lashing) {
				quest::say("Then begin.");
				#Cast Penance of the Whip 
				$npc->CastSpell(1125, $userid);
				quest::settimer(401,30);
				#quest::signal(201076,15000);
				$lashing=1;
			}
			else {
				if (($lashing > 0) && ($lashing < 6)) {
					$npc->CastSpell(1125, $userid);
					quest::say("Then begin.");		
					$lashing++;
				}
				else {
					quest::say("I'm sorry, the Trial of Lashing is currently unavilable to you.");
				}
			}
		}
	}
}
          

sub EVENT_TIMER
{
	if($timer == 400) {
		$lashing=undef;
		quest::stoptimer(400);
		quest::signalwith(201078,4,5);
	}
	
	elsif($timer == 401) {
		$lashing=6;
		quest::stoptimer(401);
		quest::settimer(400, 1200);
	}
}

sub EVENT_SIGNAL
{
	if ($signal == 0) {
		quest::shout("The Trial of Lashing is now available."); #notify once timer expires OR FAIL. (~25 minutes)
		$lashing=undef;
		quest::signal(201435);
		quest::stoptimer(400);
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
