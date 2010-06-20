#zone: tutorialb
#npc: Guard Vyrinn (Beginner Missions)
#quest:
# - Spider Caves - taskid:28 - starts
# - Spider Tamer Gugan - taskid:29 - starts/completes
# - Arachnophobia (Group) - taskid:33 - starts

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("My mate, Rahtiz, and I will hold this position.  We need you to explore the tunnels beyond.");
      quest::taskselector(28,29,33);
   }
}

sub EVENT_ITEM {
   if (quest::istaskactivityactive(29,1)) {
      if (plugin::check_handin(\%itemcount, 54604 => 1)) {
         #Gloomingdeep Violet
         quest::say("Well done, my friend. You have probably saved many lives.");
         quest::updatetaskactivity(29,1);
         quest::exp(12000);
         quest::ding();
      }
      else {
         quest::say("I have no need for this, $name.");
         plugin::return_items(\%itemcount);
      }
   }
   else {
      quest::say("I have no need for this, $name.");
      plugin::return_items(\%itemcount);
   }
} 