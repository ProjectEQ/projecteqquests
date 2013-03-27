#201434.pl
#Trial of Flame
#Kilelen

sub EVENT_SAY
{
	if(defined $qglobals{pop_poj_mavuin}) {
		if($text=~/Hail/i) {
			quest::emote(" fixes you with a dark, peircing gaze. 'What do you want, mortal? Are you [prepared]?");
		}
		
		elsif($text=~/prepared/i) {
			quest::say("Very well. When you are ready, you may begin the trial of flame. You must endure the heat of the fire and be sure not to let its creatures reach the center. We shall judge the mark of your success.");
		}
		
		elsif($text=~/begin the trial of flame/i) {
			if (!defined $flame) {
				quest::say("Then begin.");
				#Cast Penance of Flame
				quest::selfcast(1124);
				quest::settimer(201, 30);
				#Tell event burning control about it, 30 second delay
				quest::signalwith(201417, 1, 30);
				$flame=1;
				#Spawn the event controller
				quest::spawn2(201417, 0, 0, 880, -729, 55, 0);
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
	}
}
          

sub EVENT_TIMER
{
	if($timer == 200) {
		$flame = undef;
		quest::stoptimer(200);
		quest::signalwith(201434,0,5);
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
		quest::signalwith(201417, 2, 5);
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
		
	}
	
	plugin::return_items(\%itemcount);

}
