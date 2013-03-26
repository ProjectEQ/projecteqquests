#############
#Quest Name: Yuio's Illness
#Author: RealityIncarnate
#NPCs Involved: Jali Kaliio, Khonza Ayssla, 
#Items Involved: Asp poison sac (16984), tiger skin (13762), bamboo shoot (6973), kejekan palm fruit (6974), panda claws (6961), vial of healing liquid (6976), burlap satchel (17884)
#################

sub EVENT_SAY
{
 if($text =~ /hail/i)
  {
   quest::say("Greetings outsider. I trust you have [peaceful intentions] while visiting our village?");
 }
 if($text =~ /peaceful intentions/i) {
   quest::say("That is good to hear. Those filthy kobolds have caused enough trouble. We do not need more enemies.");
   quest::me("Jali turns around and glances at another Kejekan. This one seems somewhat ill. Her fur is coming out in patches and strange sores cover her body.");
   quest::say("That is my wife, Yuio. She has come down with a sickness, no doubt caused by those accursed kobolds.");
   quest::me("Anger wracks Jali's face as he speaks.");
   quest::say("I would ask you for [help] but you are a stranger and owe us nothing. Of course if you did assist me, I would be forever greatful.");
 }
 if($text =~ /help/i) {
   quest::say("Oh thank you! You are most kind. I fear that there is not much time left for my dear Yuio. Please speak to [Khonza Ayssla]. She is most wise and perhaps can find some cure for this affliction.");
 }
 
 if($text =~ /khonza ayssla/i) {
   quest::say("Khonza Ayssla is the village's High Shaman. She teaches the ancient ways of Okanjo and is most wise. If she cannot assist you I do not know who can. I would go myself but I am too worried to leave my dear wife behind. When you find Khonza, tell her that Jali sent you. Please hurry, friend!");
 }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 6976 => 1)) {
   quest::say("Khonza Ayssla gave this to you? We must try it at once then.");
   quest::me("Jali opens the vial and gently tilts back Yuio's head. He pours the liquid into her mouth and waits. Miraculously, Yuios fur begins to take on a healthy sheen and the sores begin to disappear! Yuio falls into Jali's arms then goes slack, passing out.");    
   quest::say("She needs much rest. I cannot begin to thank you enough for helping us. Please accept this as a reward. It is not much but it should be of some use. You are indeed a friend of ours and if you ever need shelter from the wilds, please visit us again.");
   quest::summonitem(6952);
 }
 plugin::return_items(\%itemcount);
}

#END of FILE Zone:stonebrunt