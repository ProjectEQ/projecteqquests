#Hoshkar NPCID 108043
# items: 27249, 27208, 27209, 27204, 69351, 69352, 69380, 69379

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("So, you have found your way into the Veeshan's Peak and into my lair. It has been a long time since I've seen an outlander like you. I should think you'd find the history of our order very entertaining indeed. I should so enjoy telling it. Would you [" . quest::saylink("like to hear") . "] it?");
	} elsif ($text=~/like to hear/i) {
		quest::say("A long time ago, before the imprisonment of Kerafyrm himself, the Ring of Scale involved all dragons. All of us lived on the Velious continent. As time went on, a differing of ideals perpetuated amongst us. Some of us believed the newly created mortals of this world were something we could control, something that would serve us and our interests. Mortals were weak and ignorant, and easily influenced by our magic and knowledge. Some other dragons thought these mortals were inconsequential to the overall workings of the universe and chose to ignore them and concentrate on the worship of Veeshan, the almighty crystalline dragon. Lines were drawn between dragon kind. Eventually, dragons chose different paths, some the Claws of Veeshan and others chose the Ring of Scale. We of the Ring of Scale decided to come to this continent and settle here, mostly to reduce the [" . quest::saylink("tension") . "] between us and the Claws of Veeshan.");
	} elsif ($text=~/tension/i) {
		quest::say("Over time, most of the dragons left behind have calmed, though there are still some who are aggressively against what we stand for. Some of those dragons have taunted me for years and I have much disdain for them. I have an idea. How about you [" . quest::saylink("assist me") . "] in teaching them a lesson? Would you be interested in a task for me?");
	} elsif ($text=~/assist/i) {
		quest::say("As you must know, we, as dragons, have a sacred law to not harm others like us. This law cannot be broken, for it is a crime that has a severe punishment. As such, I will need you to assist me. Now, I cannot condone any killing of dragons either, so my task entails you acquiring the talismans of specific dragons in Western Wastes. The Sky dragons have taunted me for a very long time, and their most vocal member, Ayillish, has been a thorn in my side for a very long time. Go now and fetch their talismans for me.");
	}
}

sub EVENT_ITEM {
	if ($faction == 1) {
		if (plugin::check_handin(\%itemcount, 27249 => 1, 27208 => 1, 27209 => 1, 27204 => 1)) { # 4 talismans
			quest::say("You impress me, mortal. I would never have thought you would be fit for this task and now you have proved me wrong. As I said earlier, I cannot condone the killing of other dragons, so I will assume that you acquired these through other methods. If you did slay these dragons however, that does bring a small bit of joy to me. I have one final task for you before we part ways. There is a certain Wyvern that has become an unwelcome outcast in the frozen lands. End his suffering and return proof of the deed to me.");
			quest::summonitem(69351); #Hoshkar's Bag of Holding
		} elsif (plugin::check_handin(\%itemcount, 69352 => 1)) { #Full Hoshkar's Bag of Holding
			quest::say("Splendid $name. This Wyvern has been a thorn in my side as long as those Sky dragons have been. You have gained my trust, outlander, and here is your reward. If the reward does not impress you, I have a different one that might. Return that to me if you wish to see it.");
			quest::summonitem(69380); #Wand of the Lava Shaper
		} elsif (plugin::check_handin(\%itemcount, 69380 => 1)) {
			quest::say("How utterly obtuse and arrogant. How about this one then?");
			quest::summonitem(69379); # Item: Bow of the Ring
		} elsif (plugin::check_handin(\%itemcount, 69379 => 1)) {
			quest::say("How utterly obtuse and arrogant. How about this one then?");
			quest::summonitem(69380); # Item: Wand of the Lava Shaper
		}
	}
	plugin::return_items(\%itemcount);

}

# Quest by mystic414