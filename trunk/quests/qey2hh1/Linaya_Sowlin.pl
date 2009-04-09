####################################
# NPC: Linaya Sowlin
# Loc: -7655 -3745
# Zone: qey2hh1
# Quest:  Nitrates and the Assassin (Qrg)
# Author:  Andrew80k
####################################
sub EVENT_SAY {
   if ($text =~ /hail/i) {
       quest::say("Greetings!  It is always nice to meet another traveler.  The roads of the Plains of Karana are heavily trodden, but sparsely patrolled.  Be careful of bandits and especially of giants.  I have seen a few since my [move from the Jaggedpine].");
   }
   if ($text =~ /note/i) {
       quest::say("The note spoke of the [Unkempt Druids]. I did not get a chance to read it all, only a glimpse. Perhaps the man still has the note. Too bad. I am sure Gerael Woodone of the druids of Surefall Glade should look at it.");
   }
   if ($text =~ /Unkempt Druids/i) {
      quest::say("The Unkempt Druids are a crazed group of druids and rangers. I learned of them when I was in the Jaggedpine. They are a secret group and aim to keep it that way. They would kill anyone who learned of their whereabouts.");
   }
   if ($text =~/move from the Jaggedpine/i) {
      quest::say("I inherited this farmhouse from my late uncle so I left the Jaggedpine to live here.  The Jaggedpine is a beautiful forest but I believe my skills as a druid may come in handy as a farmer.");
   }
}
sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount,13945=>1)) {
      quest::say("Oh thank Tunare you showed up when you did. I was at a nearby merchant house when a fellow dropped a [note] and I picked it up and read it. It talked of the [Unkempt Druids] and before I could read on, the man swiped it from my hands. I ran for dear life, for surely he would kill me for reading the note. I think I lost him in the woods but I am not sure. Please stay with me a while to be sure.");
      quest::faction(265,10);
      quest::faction(159,10);
      quest::faction(267,10);
      quest::faction(347,-30);
      quest::faction(135,10);
      quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
      quest::spawn2(12181,0,0,-8000,-3400,23,102.9);
   }
   plugin::return_items(\%itemcount);
}