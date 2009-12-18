#201437.pl
#Trial of Stoning

sub EVENT_SAY
{
	if(defined $qglobals{pop_poj_mavuin}) {
		if($text=~/Hail/i) {
			quest::emote(" fixes you with a dark, peircing gaze. 'What do you want, mortal? Are you [prepared]?");
		}
		
		elsif($text=~/prepared/i) {
			quest::say("Very well. When you are ready, you may begin the trial of stoning. The archers will not cease their punishment until nothing else stands. Do not let the prisoners take more than they can bear. We shall judge the mark of your success.");
		}
	
		elsif($text=~/begin the trial of stoning/i) {
			if (!defined $stoning) {
				quest::say("Then begin.");
				#Cast Penance of Stone 
				$npc->CastSpell(1128, $userid);
				quest::settimer(501,30);
				#quest::signal(201076,15000);
				$stoning=1;
			}
			
			else {
				if (($stoning > 0) && ($stoning < 6)) {
					$npc->CastSpell(1128, $userid);
					quest::say("Then begin.");		
					$stoning++;
				}
				
				else {
					quest::say("I'm sorry, the Trial of Stoning is currently unavilable to you.");
				}
			}
		}
		
		elsif($text=~/what evidence of Mavuin/i) {
			if(plugin::check_hasitem($client, 31842)) {
				$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
				quest::setglobal("pop_poj_tribunal", 1, 5, "F");
				quest::setglobal("pop_poj_execution", 1, 5, "F");
				$client->Message(4,"You receive a character flag!");
			}
			
			elsif(plugin::check_hasitem($client, 31796)) {
				$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
				quest::setglobal("pop_poj_tribunal", 1, 5, "F");
				quest::setglobal("pop_poj_flame", 1, 5, "F");
				$client->Message(4,"You receive a character flag!");
			}
			
			elsif(plugin::check_hasitem($client, 31960)) {
				$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
				quest::setglobal("pop_poj_tribunal", 1, 5, "F");
				quest::setglobal("pop_poj_lashing", 1, 5, "F");
				$client->Message(4,"You receive a character flag!");
			}
			
			elsif(plugin::check_hasitem($client, 31845)) {
				$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
				quest::setglobal("pop_poj_tribunal", 1, 5, "F");
				quest::setglobal("pop_poj_stoning", 1, 5, "F");
				$client->Message(4,"You receive a character flag!");
			}
			
			elsif(plugin::check_hasitem($client, 31844)) {
				$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
				quest::setglobal("pop_poj_tribunal", 1, 5, "F");
				quest::setglobal("pop_poj_torture", 1, 5, "F");
				$client->Message(4,"You receive a character flag!");
			}
			
			elsif(plugin::check_hasitem($client, 31846)) {
				$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
				quest::setglobal("pop_poj_tribunal", 1, 5, "F");
				quest::setglobal("pop_poj_hanging", 1, 5, "F");
				$client->Message(4,"You receive a character flag!");
			}
		}
	}
}
          

sub EVENT_TIMER
{
	if($timer == 500) {
		$stoning=undef;
		quest::stoptimer(500);
		quest::signalwith(201078,5,5);
	}
	
	elsif($timer == 501) {
		$stoning=6;
		quest::stoptimer(501);
		quest::settimer(500, 1200);
	}
}

sub EVENT_SIGNAL
{
	if ($signal == 0) {
		quest::shout("The Trial of Stoning is now available."); #notify once timer expires OR FAIL. (~25 minutes)
		$flame=undef;
		quest::signal(201433);
		quest::stoptimer(500);
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
