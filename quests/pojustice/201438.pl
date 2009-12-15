#201438.pl
#Trial of Torture

sub EVENT_SAY
{
	if(defined $qglobals{pop_poj_mavuin}) {
		if($text=~/Hail/i) {
			quest::emote(" fixes you with a dark, peircing gaze. 'What do you want, mortal? Are you [prepared]?");
		}
		
		elsif($text=~/prepared/i) {
			quest::say("Very well. When you are ready, you may begin the trial of torture. Only when a wraith of agony dies will the prisoners feel any relief. Take care to find and kill it quickly, lest their torment overcome them. We shall judge the mark of your success.");
		}

		elsif($text=~/begin the trial of torture/i) {
			if (!defined $torture) {
				quest::say("Then begin.");
				#Cast Penance of Torture 
				$npc->CastSpell(1129, $userid);
				quest::settimer(601,30);
				quest::signal(201076,15000);
				$torture=1;
			}
			else {
				if (($torture > 0) && ($torture < 6)) {
					$npc->CastSpell(1129, $userid);
					quest::say("Then begin.");		
					$torture++;
				}
				else {
					quest::say("I'm sorry, the Trial of Torture is currently unavilable to you.");
				}
			}
		}
	}
}
          

sub EVENT_TIMER
{
	if($timer == 600) {
		$torture=undef;
		quest::stoptimer(600);
		quest::signalwith(201078,6,5);
	}
	
	elsif($timer == 601) {
		$torture=6;
		quest::stoptimer(601);
		quest::settimer(600, 1200);
	}
}

sub EVENT_SIGNAL
{
	if ($signal == 0) {
		quest::shout("The Trial of Torture is now available."); #notify once timer expires OR FAIL. (~25 minutes)
		$flame=undef;
		quest::signal(201433);
		quest::stoptimer(600);
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
