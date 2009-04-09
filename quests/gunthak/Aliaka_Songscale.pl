#Aliaka_Songscale.pl
#Dark Ice(Part of Frozen Harpoon)

sub EVENT_SAY { 
	if ($text=~/Hail/i){
		quest::emote("flinches as you initially approach, but appears more at ease when she realizes you are not an immediate threat. 'Ah, thank Prexus you are not one of them. Not that this guarantees that you are any less dangerous, so please state your intentions clearly. We have suffered much [abuse] at the hands of other races, and in particular I do not appreciate the pain that the sea trolls inflict upon my sisters.'");
	}
	if ($text=~/abuse/i){
		quest::emote("speaks, her visage one of sadness and despair, 'This shore has forever been the home of my people, but we are practically driven into hiding now, forced to flee and scatter when the Luggalds come near. At their whim, the fiendish beasts lance us with their icy spears. The cold chill bites and the pain is horrible. In fact, there are still fragments of the dark ice embedded in my scales from their last attack. I believe they only mean to torment and not kill us, as so far there have been few deaths. Now that you understand our plight, what is it you want from me?'");
	}
	if ($text=~/fragments of the dark ice/i){
		quest::emote("smirks, 'Forgive my hesitance in trusting a stranger, but the frozen shards are quite painful, and removing them would be even more so. Perhaps we can trade services? I will give you some willingly if you would complete a [task] first.'");
	}
	if ($text=~/task/i){
		quest::say("As a sign of loyalty, and to avenge the innocent blood that was spilt by the Luggalds, I would like you to cut down some of the fiends and bring proof of their demise. Use whatever means necessary. Grant them no quarter and expect none in return. For each of their dark hearts, I will trade pieces of the ice that you seem so interested in. I will accept nothing else.");
	}
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 58007 => 1)) {#Luggald Heart
    quest::say("Yes!  For this I will gladly give you a fragment of the dark ice!");#text made up
    quest::summonitem(58008);#Fragment of Dark Ice
  }
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
}#Done