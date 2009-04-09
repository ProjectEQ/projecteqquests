####################################
# NPC: Gerael Woodone
# Zone:  Qrg
# Quest:  Nitrates and the Assassin
# Author: Andrew80k
####################################
sub EVENT_SAY { 

   if ($text=~/Hail/i){
       quest::say("It is good to meet you, $name. You, my friend, are an adventurer. The rugged look of you testifies to that. Let me know if you plan to adventure in the Plains of Karana. I have need of a person such as yourself to [deliver a flask]");

   }

   if ($text=~/deliver a flask/i){
       quest::say("That is splendid! I thought I would have to take the long journey to the western Plains of Karana myself. Here you are, my friend. Take this flask of nitrates to a woman named Linaya Sowlin. It will help her crops grow stronger. You will find her farm alongside the road to Highpass Hold. She should pay you well for the delivery. Farewell.");
       quest::summonitem("13945","1"); 
   }
   if ($text=~/Jale Phlintoes/i) {
       quest::say("Jale Phlintoes was trained in the ways of the Jaggedpine Treefolk since his birth. He was only eight when his parents were killed by poachers. Young Jale would have had his throat slit also if he were not off fishing at the lake. Unfortunate. The now orphaned Jale was brought up by us druids. After many conflicts with our council, he ran off to start his own sect somewhere in the nearby lands. For his terrorist activities his head now brings a high price.");
   }
   if ($text=~/Unkempt Druids/i) {
       quest::say("The Unkempt Druids are a radical splinter group of druids. Their beliefs have been contorted by the mad druid [Jale Phlintoes]. It is he who engineers and coordinates the druids' transgressions. From setting lumbermills aflame to murdering any man who dares to wear a bearhide. They must be stopped!! Citizens must learn to understand Tunare's will, not fear it.");
   }

}
sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount,18911=>1)) {
      quest::say("Oh my!! Our Qeynos Ambassador, Gash, is in danger. Please take the note over to Captain Tillin of the Qeynos Guard then find Gash and inform him [they are trying to kill him]. Go!!");
      quest::faction(265,10);
      quest::faction(159,10);
      quest::faction(267,10);
      quest::faction(347,-30);
      quest::faction(135,10);
      quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
      quest::summonitem(18912);
   }
   elsif (plugin::check_handin(\%itemcount,12141=>1)) {
      quest::say("So the Unkempt Druids are alive and well.  We shall keep a watchful eye out as should you.  Take this for your bravery and defense of the Jaggedpine.");
      quest::faction(265,10);
      quest::faction(159,10);
      quest::faction(267,10);
      quest::faction(347,-30);
      quest::faction(135,10);
      quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
   }
}

#END of FILE Zone:qrg  ID:1666 -- Gerael_Woodone
