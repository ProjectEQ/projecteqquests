#modified by greenbean 03/23/2010

#my $wave = 0;
my $rspeed = 1.1;
my $dest = 0;

sub EVENT_SPAWN {
   quest::settimer("begin_delay", 3);
}

sub EVENT_SIGNAL {
   if ($signal == 0) {
      #Depop & Respawn
      #Stop the timers
      quest::stoptimer("begin_delay");
      quest::stoptimer("move_check");
      quest::stoptimer("talk_prisoner");
      quest::stoptimer("sig_prisoner");
      quest::stoptimer("do_execution");
      #Spawn new executioner
      quest::spawn2(201439,0,0,232,-1048,74,180);
      #Depop this executioner
      quest::depop();
   }
   
   elsif ($signal == 1) {
      #wave 1
      $rspeed = 1.1; # prisoner dies in 34s
   }
   elsif ($signal == 2) {
      #wave 2
      $rspeed = 1.3; # prisoner dies in 33s
   }
   elsif ($signal == 3) {
      #wave 3
      $rspeed = 1.5; # prisoner dies in 32s
   }
   elsif ($signal == 4) {
      #wave 4
      $rspeed = 1.6; # prisoner dies in 30s
   }
   elsif ($signal == 5) {
      #Depop no respawn
      quest::stoptimer("begin_delay");
      quest::stoptimer("move_check");
      quest::stoptimer("talk_prisoner");
      quest::stoptimer("sig_prisoner");
      quest::stoptimer("do_execution");
      quest::depop();
   }
}

sub EVENT_TIMER {
   if ($timer eq "begin_delay") {
      quest::stoptimer("begin_delay");
      quest::modifynpcstat("runspeed", $rspeed);
      quest::moveto(196, -1052, 73.1, -1, 1);
      $dest = 1;
      quest::settimer("move_check",1);
   }
   elsif ($timer eq "move_check") {
      quest::stoptimer("move_check");
      my $x = $npc->GetX();
      my $y = $npc->GetY();
      
      if ($dest == 1) {
         $dist = $npc->CalculateDistance(196, -1052, $npc->GetZ());
         if ($dist < 1.5) {
            quest::moveto(196, -1156, 80.1, -1, 1);
            $dest = 2;
         }
         quest::settimer("move_check", 1);
      }
      elsif ($dest == 2) {
         $dist = $npc->CalculateDistance(196, -1156, $npc->GetZ());
         if ($dist < 1.5) {
            quest::moveto(173, -1156, 80.1, -1, 1);   
            $dest = 3;
         }
         quest::settimer("move_check", 1);
      }
      elsif ($dest == 3) {
         $dist = $npc->CalculateDistance(173, -1156, $npc->GetZ());
         if ($dist < 1.5) {
            quest::settimer("talk_prisoner", 2);
            $dest = 0;
         }
         else {
            quest::settimer("move_check", 1);         
         }
      }
   }
   elsif ($timer eq "talk_prisoner") {
      quest::stoptimer("talk_prisoner");
      quest::emote("intones, 'Do you have any final words before your sentence is carried out?'");
      quest::settimer("sig_prisoner", 3);
   }
   elsif ($timer eq "sig_prisoner") {
      quest::stoptimer("sig_prisoner");
      #prisoner emote
      quest::signalwith(201424,1,0);
      quest::settimer("do_execution", 13);
   }
   elsif ($timer eq "do_execution") {
      quest::stoptimer("do_execution");
      quest::say("Very well.");
      #Signal prisoner death. (depop)
      quest::signalwith(201424,0,5);
      #Executed - Let controller know this was a fail
      quest::signalwith(201425, 3, 5);
   }
}

