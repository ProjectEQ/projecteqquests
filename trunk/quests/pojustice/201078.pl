#Plane of justice
#Trial of Execution
#
#Tribunal script - ENTRY into the chamber.
#
#
# - Wizardanim
# - tested 4/4/07
# - Modified by Kilelen
# - Modified by greenbean 03/23/2010
###################################

my $hold_event = 0;

sub EVENT_SPAWN {
   #Depop any existing controllers
	quest::depopall(201425);
   #Spawn the controller
   quest::spawn2(201425, 0, 0, 194, -1120, 72, 0);
}

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
         if (!defined $in_progress) {
            quest::say("Then begin.");
            $in_progress = 1;
            quest::settimer("delay_start", 30);
            #Tell Event_Execution_Control about it
            quest::signalwith(201425, 1, 0);            
            #Cast Penance of Execution
            quest::selfcast(1127); #required db edit targettype = 41
         }
         
         else {
            quest::say("I'm sorry, the Trial of Execution is currently unavailable to you.");
         }
      }
      
      elsif($text=~/what evidence of Mavuin/i) {
         if(plugin::check_hasitem($client, 31842)) {
            $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
            quest::setglobal("pop_poj_tribunal", 1, 5, "F");
            quest::setglobal("pop_poj_execution", 1, 5, "F");
            $client->Message(15,"You receive a character flag!");
         }
         
         elsif(plugin::check_hasitem($client, 31796)) {
            $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
            quest::setglobal("pop_poj_tribunal", 1, 5, "F");
            quest::setglobal("pop_poj_flame", 1, 5, "F");
            $client->Message(15,"You receive a character flag!");
         }
         
         elsif(plugin::check_hasitem($client, 31960)) {
            $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
            quest::setglobal("pop_poj_tribunal", 1, 5, "F");
            quest::setglobal("pop_poj_lashing", 1, 5, "F");
            $client->Message(15,"You receive a character flag!");
         }
         
         elsif(plugin::check_hasitem($client, 31845)) {
            $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
            quest::setglobal("pop_poj_tribunal", 1, 5, "F");
            quest::setglobal("pop_poj_stoning", 1, 5, "F");
            $client->Message(15,"You receive a character flag!");
         }
         
         elsif(plugin::check_hasitem($client, 31844)) {
            $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
            quest::setglobal("pop_poj_tribunal", 1, 5, "F");
            quest::setglobal("pop_poj_torture", 1, 5, "F");
            $client->Message(15,"You receive a character flag!");
         }
         
         elsif(plugin::check_hasitem($client, 31846)) {
            $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
            quest::setglobal("pop_poj_tribunal", 1, 5, "F");
            quest::setglobal("pop_poj_hanging", 1, 5, "F");
            $client->Message(15,"You receive a character flag!");
         }
      }
		elsif($text=~/i seek knowledge/i) {
			if (plugin::check_hasitem($client, 31842) && plugin::check_hasitem($client, 31796) && plugin::check_hasitem($client, 31960) && plugin::check_hasitem($client, 31845) && plugin::check_hasitem($client, 31844) && plugin::check_hasitem($client, 31846) ) { 
				if (!plugin::check_hasitem($client, 31599)) {
					quest::summonitem(31599);
				} 
			}elsif (plugin::check_hasitem($client, 31842) || plugin::check_hasitem($client, 31796) || plugin::check_hasitem($client, 31960) || plugin::check_hasitem($client, 31845) || plugin::check_hasitem($client, 31844) || plugin::check_hasitem($client, 31846) ) { 
				quest::say("You have done well, mortal, but there are more trials yet for you to complete.");
			}
		}
   }
}
         

sub EVENT_TIMER
{
   if ($timer eq "delay_start") {
      quest::stoptimer("delay_start");
   }
   
   elsif ($timer eq "reset_execution") {
      quest::stoptimer("reset_execution");
      $hold_event = 0;
      quest::signalwith(201078,0,5);
   }
}

sub EVENT_SIGNAL
{
   if ($signal == 0) {
      if ($in_progress && !$hold_event) {
         quest::shout("The Trial of Execution is now available."); #notify once timer expires OR FAIL.
         quest::stoptimer("delay_start");
         quest::stoptimer("reset_execution");
         $in_progress=undef;
      }
      elsif ($hold_event) {
         #Boss killed & trial area clear - start timer for reset (20 min normally, reduced to 1 min since only one trial is working)
         quest::stoptimer("reset_execution");
         quest::settimer("reset_execution", 60);
      }
   }
   
   if ($signal == 1 ) {      
      #Prime Executioner was killed
      $hold_event = 1;
   }
}

sub EVENT_ITEM
{
   if(defined $qglobals{pop_poj_mavuin}) {
      if(plugin::check_handin(\%itemcount, 31842 => 1)) {
         $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
         quest::setglobal("pop_poj_tribunal", 1, 5, "F");
         quest::setglobal("pop_poj_execution", 1, 5, "F");
         $client->Message(15,"You receive a character flag!");
         quest::summonitem(31842);
      }
      
      if(plugin::check_handin(\%itemcount, 31796 => 1)) {
         $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
         quest::setglobal("pop_poj_tribunal", 1, 5, "F");
         quest::setglobal("pop_poj_flame", 1, 5, "F");
         $client->Message(15,"You receive a character flag!");
         quest::summonitem(31796);
      }
      
      if(plugin::check_handin(\%itemcount, 31960 => 1)) {
         $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
         quest::setglobal("pop_poj_tribunal", 1, 5, "F");
         quest::setglobal("pop_poj_lashing", 1, 5, "F");
         $client->Message(15,"You receive a character flag!");
         quest::summonitem(31960);
      }
      
      if(plugin::check_handin(\%itemcount, 31845 => 1)) {
         $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
         quest::setglobal("pop_poj_tribunal", 1, 5, "F");
         quest::setglobal("pop_poj_stoning", 1, 5, "F");
         $client->Message(15,"You receive a character flag!");
         quest::summonitem(31845);
      }
      
      if(plugin::check_handin(\%itemcount, 31844 => 1)) {
         $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
         quest::setglobal("pop_poj_tribunal", 1, 5, "F");
         quest::setglobal("pop_poj_torture", 1, 5, "F");
         $client->Message(15,"You receive a character flag!");
         quest::summonitem(31844);
      }
      
      if(plugin::check_handin(\%itemcount, 31846 => 1)) {
         $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
         quest::setglobal("pop_poj_tribunal", 1, 5, "F");
         quest::setglobal("pop_poj_hanging", 1, 5, "F");
         $client->Message(15,"You receive a character flag!");
         quest::summonitem(31846);
      }
   }
   plugin::return_items(\%itemcount);
}

