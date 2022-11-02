#zone: tutorialb
#npc: Guard Vyrinn (Beginner Missions)
#quest:
# - Spider Caves - taskid:5092 - starts
# - Spider Tamer Gugan - taskid:5702 - starts/completes
# - Arachnophobia (Group) - taskid:33 - starts
# items: 54604

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("My mate, Rahtiz, and I will hold this position.  We need you to explore the tunnels beyond.");
      quest::taskselector(5092,5702,33);
   }
}

sub EVENT_ITEM {
   if (quest::istaskactivityactive(5702,1)) {
      if (plugin::check_handin(\%itemcount, 54604 => 1)) {
         #Gloomingdeep Violet
         quest::say("Well done, my friend. You have probably saved many lives.");
         quest::updatetaskactivity(5702,1);
         quest::exp(12000);
         quest::ding();
      }
   }
   plugin::return_items(\%itemcount);
} 