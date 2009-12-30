sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("'Hail to you. I don't have a lot of free time. If you're going to stand around here and pretend you have something interesting to say, how about you let me put you to [work] instead. I know my ears would approve of the silence.");
  }
  if ($text=~/work/i) {
    quest::say("There is plenty for you to do, even if you are almost completely incompetent. I only need you to do the simple things to allow me to work on things that are more worthwhile. I am collecting the contents of internal organs pulled from the Muramites. Killing them appears to be a difficult task, so their organs are hard to come by. The only one that we've been able to figure out at all seems to be a waste-product storage organ. I haven't seen one inside one of the creatures, so I can't confirm what function is serves for them, nor do I really care. We have decided to call that waste product, bile. The bile can be extremely toxic, even more so than some of the Muramite blood we've found. So, if you can do some [simple things] for me, I can investigate the [Muramite bile].");
  }
  if ($text=~/muramite bile/i) {
    quest::say("Muramite bile is a complicated substance. I have, however, discovered a way to extract the bile from the organs that hold it in such a way that it is not spoiled. It's interesting that the different races all have this dangerous bile. It appears that this organ is underdeveloped in many of these creatures, though. I suspect it has to do with their maturity. I believe that it develops much more slowly than the rest of their bodies. Only the older ones will have bile sacks. Bring me a bile sack and I will extract the bile for you and give it to you stored properly. I will keep a portion of the bile for my own research as payment for my efforts.");
  }
  if ($text=~/simple things/i) {
    quest::say("Give me a Muramite Blood Distillate and I will give you supplies. If you do enough work, I'll teach you how to process the muramite blood and bile. Since you are providing me with some materials, I will teach you sooner than Uiyaniv would.");
    quest::taskselector(174);
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58151 => 1) && quest::istaskactivityactive(174,0)) {
  quest::say("It looks like you're ready to get started. Good. Take a small vial of Muramite blood distillate and Wayfarers Secret Suspension and combine them in your mortar and pestle to create a simple contact poison. The Muramite blood makes it pretty potent, so don't leave it lying around. Bring it right back to me when you're done.");
  quest::summonitem(58143,10);
  quest::summonitem(58206,10);
}
  if (plugin::check_handin(\%itemcount, 58151 => 1) && quest::istaskactivityactive(174,1)) {
     quest::say("There is plenty for you to do. Don't just stand around gawking. Take a small vial of Muramite blood distillate and Wayfarers secret anti-coagulant and combine them in your mortar and pestle. If you aren't a completely incompetent creature, you should be able to produce a reasonable quantity of simple Muramite blood-injected poison. Bring it to me when you're done.");
     quest::summonitem(58143,10);
     quest::summonitem(58206,10);
     }
  if (plugin::check_handin(\%itemcount, 58151 => 1) && quest::istaskactivityactive(174,2)) {
    quest::say("There is no lack of work for you. Take this small vial of Muramite blood distillate and simple paralytic and combine them in your mortar and pestle. Don't screw it up and you'll be able to make some simple Muramite blood paralytic. Handy stuff when you don't want to kill someone, but you don't want them killing you either. Bring to me whatever you can make.");
    quest::summonitem(58143,10);
    quest::summonitem(58111,10);
}
  if (plugin::check_handin(\%itemcount, 58151 => 1) && quest::istaskactivityactive(174,3)) {
    quest::say("Good. For now I am in need of some atrophic. Don't ask why, just combine a small vial of Muramite blood distillate and simple wasting poison in your mortar and pestle. Don't lick your fingers while working on this or you'll find yourself unable to beg for my help in the future. Bring me the atrophic when you have it finished.");
    quest::summonitem(58143,10);
    quest::summonitem(58132,10);
 }
 if (plugin::check_handin(\%itemcount, 58048 =>1 )) {
   quest::summonitem(58047,2);
 }
 plugin::return_items(\%itemcount);
 }