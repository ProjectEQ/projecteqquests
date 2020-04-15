#Agent_of_The_Tribunal.pl
#All Trials
#Kilelen
#modified by greenbean 03/23/2010

#Variable to stop them from leaving.
#my $hold_them = 0;
my $hold_execution = 0;
my $hold_flame = 0;
my $hold_hanging = 0;
my $hold_lashing = 0;
my $hold_stoning = 0;
my $hold_torture = 0;

sub EVENT_SAY {
   if ($text =~ /hail/i) {
      quest::say("Do you wish to [return]?");
   }
   
   elsif($text =~ /return/i) {
      my $x = int($npc->GetX());
      my $y = int($npc->GetY());
      
      #Execution
      if (($x == 141) && ($y == -1045)) {
         if ($hold_execution == 0) {
            quest::say("Very well.");
            quest::movepc(201,456,825,9); # Zone: pojustice
         }
         else {
            quest::say("You have gotten this far, mortal, you must finish this or die trying.");#Text made up
         }
      }
      #Flame
      elsif (($x == 911) && ($y == -794)) {
         if ($hold_flame == 0) {
            quest::say("Very well.");
            quest::movepc(201,456,825,9); # Zone: pojustice
         }
         else {
            quest::say("You have gotten this far, mortal, you must finish this or die trying.");#Text made up
         }
      }
      #Hanging
      elsif (($x == 490) && ($y == -1047)) {
         if ($hold_hanging == 0) {
            quest::say("Very well.");
            quest::movepc(201,456,825,9); # Zone: pojustice
         }
         else {
            quest::say("You have gotten this far, mortal, you must finish this or die trying.");#Text made up
         }
      }
      #Lashing
      elsif (($x == 1343) && ($y == -1138)) {
         if ($hold_lashing == 0) {
            quest::say("Very well.");
            quest::movepc(201,456,825,9); # Zone: pojustice
         }
         else {
            quest::say("You have gotten this far, mortal, you must finish this or die trying.");#Text made up
         }
      }
      #Stoning
      elsif (($x == -149) && ($y == -1196)) {
         if ($hold_stoning == 0) {
            quest::say("Very well.");
            quest::movepc(201,456,825,9); # Zone: pojustice
         }
         else {
            quest::say("You have gotten this far, mortal, you must finish this or die trying.");#Text made up
         }
      }
      #Torture
      elsif (($x == 772) && ($y == -1148)) {
         if ($hold_torture == 0) {
            quest::say("Very well.");
            quest::movepc(201,456,825,9); # Zone: pojustice
         }
         else {
            quest::say("You have gotten this far, mortal, you must finish this or die trying.");#Text made up
         }
      }
   }
 }
 
 sub EVENT_SIGNAL {
   my $x = int($npc->GetX());
   my $y = int($npc->GetY());
   
   #Trial of Execuction boss up
   if ($signal == 1) {
      $hold_execution = 1;
   }
   #Trial of Flame boss up
   elsif ($signal == 2) {
      $hold_flame = 1;
   }
   #Trial of Hanging boss up
   elsif ($signal == 3) {
      $hold_hanging = 1;
   }
   #Trial of Lashing boss up
   elsif ($signal == 4) {
      $hold_lashing = 1;
   }
   #Trial of Stoning boss up
   elsif ($signal == 5) {
      $hold_stoning = 1;
   }
   #Trial of Torture boss up
   elsif ($signal == 6) {
      $hold_torture = 1;
   }
   #Trial of Execuction boss down
   elsif ($signal == 11) {
      $hold_execution = 0;
   }
   #Trial of Flame boss down
   elsif ($signal == 12) {
      $hold_flame = 0;
   }
   #Trial of Hanging boss down
   elsif ($signal == 13) {
      $hold_hanging = 0;
   }
   #Trial of Lashing boss down
   elsif ($signal == 14) {
      $hold_lashing = 0;
   }
   #Trial of Stoning boss down
   elsif ($signal == 15) {
      $hold_stoning = 0;
   }
   #Trial of Torture boss down
   elsif ($signal == 16) {
      $hold_torture = 0;
   }
}
