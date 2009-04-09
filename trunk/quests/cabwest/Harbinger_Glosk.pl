sub EVENT_SAY { 
 if ($text=~/Hail/i){
	quest::emote("halts his chanting.");
	quest::say("You dare to interrupt me? You had best have a good reason. I care not for small talk.");
 }
 if ($text=~/new revenant/i) {
	quest::say("Yes. You are. You shall do as I command. Take this. It is incomplete and must be ready for the emperor within the half season. You must find the [Four Missing Gems]. When you have them, then you will have to Quest for the [Grand Forge of Dalnir]. Within it's fire, all shall combine. Return the Sceptre to me with your Revenant Skullcap. Go. "); 
        quest::summonitem(12873);
 }
 if ($text=~/forge of dalnir/i){
	quest::emote("scratches his chin.");
	quest::say("I know little of it other than that it once belonged to the ancient Haggle Baron, Dalnir. From what I have read, its fires require no skill, but will melt any common forge hammer used. Dalnir was said to have called upon the ancients for a hammer which could tolerate the magickal flames.");
}
if($text=~/gem of reflection/i) {
quest::say("I have not been asked that in ages but I can recall the last person that asked me. If you are in league with that scoundrel Ixpacan, I will slay you where you stand! But if you are not, you will not mind ridding your kin of a [menace] as of late.");
}
if($text=~/menace/i) {
quest::say("It seems as though a rogue marauder in a jungle near here has attacked several of our trade suppliers. If you can bring me back his head I will gladly share the information you have asked for.");
}
 }

sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount,18204=> 1)){
 	quest::say("Another apprentice has reached rebirth. You now have become one with the Brood of Kotiz. We study the ancient writing of Kotiz. Through his writing we have found the power of the dark circles. Listen well to the scholars within this tower and seek the [Keepers Grotto] for knowledge of our spells. This drape shall be the sign to all Iksar that you walk with the Brood. Now go speak with Xydoz.");
	quest::summonitem(12407);
	quest::exp("100");
 }
if(plugin::check_handin(\%itemcount,12874=> 1, 4265=> 1)){
        quest::emote("presents to you a glowing skullcap.");
 	quest::say("This is the treasured cap of the sorcerers of this tower. Let all gaze upon you in awe. You are what others aspire to be. I look forward to reading of your adventures, Sorceror $name.");
	quest::summonitem(4266);
        quest::faction(193,20);
        quest::faction(24,20);
	quest::exp("10000");
        quest::givecash(0,0,0,2);
}
if (plugin::check_handin(\%itemcount, 48037 => 1)) {
quest::say("You have done well in doing what I have asked. To make a gem of reflection you will need some Mt Death mineral salts, a green goblin skin, spiroc bone dust, essence of rathe, blue slumber fungus, and a vial of pure essence. Combine all of these in this container and you will have what it is you seek.");
quest::summonitem(48039);
}
if (plugin::check_handin(\%itemcount, 14813 =>1 )) {
  quest::emote("hisses and says venomously,");
  quest::say("And I am disturbed yet again. I hope for your sake it is important.");
  quest::emote("The gaunt necromancer looks down at the paper in his hands and after reading a few lines gasps, then falls into a violent coughing fit. After recovering he takes a deep breath, puffs his chest out and hands the paper back to you. With his head held high, he says in a raspy voice");
  quest::say("Show this to Rixiz. He will test you.");  
  quest::summonitem(14813);
}
plugin::return_items(\%itemcount); # return unused items
}

#END of FILE Zone:cabwest  ID:2517 -- Harbinger_Glosk 

