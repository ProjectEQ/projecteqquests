# Part of quest for Veeshan's Peak key
# items: 19954

sub EVENT_SPAWN {
	quest::settimer("sit",10);
}

sub EVENT_TIMER {
	if($timer eq "sit") {
		$npc->SetAppearance(1);
	} 
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name! I am Xiblin Fizzlebik, renowned archeologist and historian of Ak'Anon. I'm currently in search of artifacts and relics on the Iksar [Jarsath tribe]. If you stumble upon anything, please bring it to me.");
  }
  if ($text=~/Jarsath tribe/i) {
    quest::say("About two thousand years ago, there were five different tribes of Iksar who dwelled on the continent of Kunark. One of these tribes was the Jarsath. They were a very primitive sort, proud and tribal, but also cannibalistic. Often, they went to war with the other tribes that co-existed with them back then. The ruins found on this island were of structures created by the Jarsath. I've been excavating for quite some time now, but haven't been able to find anything of significance.");
  }
  if ($text=~/looking for/i) {
    quest::say("In my studies, I have learned that the Jarsath believed they could draw power from a holy symbol... specifically a medallion that represented their tribe. When Salthir became king of the Iksar empire Sebilis, he had the medallion broken into three pieces and hid them on the Kunark continent so that they would never be found. I'm searching for the pieces so that I can put it back together and learn more about this tribe. Perhaps you wish to help?");
  }
  if ($text=~/help/i) {
    quest::say("All I know is that the pieces were most likely hidden in water regions. If you manage to find them, bring them to me and I will be able to put the medallion of the Jarsath back together. I am sure there is much to be learned from it.");
  }
}

sub EVENT_ITEM {
  if (($itemcount{19959} == 1) && ($itemcount{19960} == 1) && ($itemcount{19961} == 1)) {
    quest::emote("tinkers with the three pieces and snaps the pieces together. 'Wow.. You've done it.. but I suddenly feel very.. strange.. This medallion is cursed! Here, you take it!'");
    quest::summonitem(19954); # Item: Medallion of the Jarsath
    quest::exp(100);
  }
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::emote("sighs to himself in resignation and continues to dig with obvious annoyance.");
	}
	if($signal == 2) {
		quest::emote("mutters to himself. 'Yeah, not because you're a goblin headed moron or anything.'");
		quest::signal(96032,30); # NPC: Alrik_Farsight
	}
	if($signal == 3) {
		quest::say("I didn't say anything! Now get back on your side of the island, you're getting dirt and junk all over mine!");
	}
}

# Quest by mystic414