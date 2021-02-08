#201434.pl
#Trial of Flame
#Kilelen
# items: 31599, 31842, 31796, 31960, 31845, 31844, 31846

sub EVENT_SAY
{
	if(defined $qglobals{pop_poj_mavuin}) {
		if($text=~/Hail/i) {
			quest::emote(" fixes you with a dark, peircing gaze. 'What do you want, mortal? Are you [" . quest::saylink("prepared") . "]?");
		}
		
		elsif($text=~/prepared/i) {
			quest::say("Very well. When you are ready, you may [" . quest::saylink("begin the trial of flame", 0, "begin the trial of flame") . "]. You must endure the heat of the fire and be sure not to let its creatures reach the center. We shall judge the mark of your success.");
		}
		
		elsif($text=~/begin the trial of flame/i) {
			if (!defined $flame) {
				quest::say("Then begin.");
				#Cast Penance of Flame
        #quest::selfcast(1124);
        $group = $entity_list->GetGroupByClient($client);
        if ($group) { 
          for ($count = 0; $count < $group->GroupCount(); $count++) {
            $pc = $group->GetMember($count);
            if ($pc && $pc->IsClient() && $pc->CalculateDistance($x,$y,$z) <= 50) {
              $pc->MovePC(201,937,-703, 53, 300); # Zone: pojustice
            }
          }
        }
				quest::settimer(201, 30);
				#Tell event burning control about it, 30 second delay
				quest::signalwith(201417, 1, 30); # NPC: #Event_Burning_Control
				$flame=1;
				#Spawn the event controller
				quest::spawn2(201417, 0, 0, 880, -729, 55, 0); # NPC: #Event_Burning_Control
			}
			else {
				quest::say("I'm sorry, the Trial of Flame is currently unavilable to you.");
				#if (($flame > 0) && ($flame < 6)) {
				#	$npc->CastSpell(1124, $userid);
				#	quest::say("Then begin.");		
				#	$flame++;
				#}
				#else {
				#	quest::say("I'm sorry, the Trial of Flame is currently unavilable to you.");
				#}
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
		elsif($text=~/i seek knowledge/i) {
			if (plugin::check_hasitem($client, 31842) && plugin::check_hasitem($client, 31796) && plugin::check_hasitem($client, 31960) && plugin::check_hasitem($client, 31845) && plugin::check_hasitem($client, 31844) && plugin::check_hasitem($client, 31846) ) { 
				if (!plugin::check_hasitem($client, 31599)) {
					quest::summonitem(31599); # Item: The Mark of Justice
				} 
			}elsif (plugin::check_hasitem($client, 31842) || plugin::check_hasitem($client, 31796) || plugin::check_hasitem($client, 31960) || plugin::check_hasitem($client, 31845) || plugin::check_hasitem($client, 31844) || plugin::check_hasitem($client, 31846) ) { 
				quest::say("You have done well, mortal, but there are more trials yet for you to complete.");
			}
		}
	}
}
          

sub EVENT_TIMER
{
	if($timer == 200) {
		$flame = undef;
		quest::stoptimer(200);
		quest::signalwith(201434,0,5); # NPC: The_Tribunal Flame Trial
	}
	
	elsif($timer == 201) {
		$flame = 6;
		quest::stoptimer(201);
		quest::settimer(200, 1200);
	}
}

sub EVENT_SIGNAL
{
	if ($signal == 0) {
		quest::shout("The Trial of Flame is now available."); #notify once timer expires OR FAIL. (~25 minutes)
		$flame=undef;
		quest::stoptimer(200);
		#Actually tell the controller to fail the trial, if I can.
		quest::signalwith(201417, 2, 5); # NPC: #Event_Burning_Control
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
			quest::summonitem(31842); # Item: Mark of Execution
		}
		
		elsif(plugin::check_handin(\%itemcount, 31796 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_flame", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31796); # Item: Mark of Flame
		}
		
		elsif(plugin::check_handin(\%itemcount, 31960 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_lashing", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31960); # Item: Mark of Lashing
		}
		
		elsif(plugin::check_handin(\%itemcount, 31845 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_stoning", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31845); # Item: Mark of Stone
		}
		
		elsif(plugin::check_handin(\%itemcount, 31844 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_torture", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31844); # Item: Mark of Torture
		}
		
		elsif(plugin::check_handin(\%itemcount, 31846 => 1)) {
			$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
			quest::setglobal("pop_poj_tribunal", 1, 5, "F");
			quest::setglobal("pop_poj_hanging", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
			quest::summonitem(31846); # Item: Mark of Suffocation
		}
		
	}
	
	plugin::return_items(\%itemcount);

}
