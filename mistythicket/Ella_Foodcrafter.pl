# #18959 -> ella foodcrafter -> two tasks; shiny tin bowl and a clue
# hardened mixture and runecrested bowl -> softly glowing stone

sub EVENT_WAYPOINT_ARRIVE{
	if(($wp eq 13) || ($wp eq 19)) {
		my $random = int(rand(5));
		if($random == 0) {
			quest::emote("hums a little as she drops off supplies for the deputies.");
		}
		if($random == 1) {
			quest::say("Hope things are going well here.");
		}
		if($random == 2) {
			quest::say("Air's nice as always out here.");
		}
	}
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hi, hi. I've got a lot to do, many mouths to feed, some filthy goblins to smack. If you don't need me for something, please let me go back to my work. Karana watch over you.");
  }
  if (($text=~/two tasks/i) && (defined $qglobals{shiny_tin_bowl})) {
    quest::say("Well, ya ask before ya act. That's a good sign. What I need isn't easy to find. First, I need a mixture. Plain sounding enough but it's a special one. Cleanses the mind and focuses the earth's energies into a forest walker's mind. I don't know how to make it. I don't even know what it's called. I merely know it exists and we'll be needing it for our task. When ya do find how to make it ya can mix it in that bowl. Keep it when you're done, it's a good bowl.");
	quest::summonitem(17860);
	quest::delglobal("shiny_tin_bowl");
  }
  if ($text=~/second task/i) {
    quest::say("Good, ya didn't run off without finding out what else ya need to do. Second, I need a special type of bowl. An ancient type of bowl, which strengthened the food placed inside it, once made by the elves of old. Again, I cannot tell ya how it is made for the making was lost to the ages. Seek this knowledge and these items out in the lands. Come to me when ya have found both.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18959 => 1)) {
    quest::say("Hmmm. I've been waiting for someone to bring me this. I'm sorry such a young one as you has taken up this task. Maybe the sky god blesses ya though. Aye, ya have that look in your eye. Our task is to focus the blessings of the gods and cleanse the filth from the land. I have two tasks for ya.");
    quest::setglobal("shiny_tin_bowl", 1, 0, "F");
  }
  elsif (plugin::check_handin(\%itemcount, 20473 => 1, 20460 => 1)) {
    quest::emote("smiles slowly as she works the mixture in the bowl and it starts to shine with power. 'This is... a piece of a lost magic item known as Nature's Gem. When restored to completeness I've heard its healing powers will be extraordinary. Take it now. I will take the bowl and hopefully do some good from my end. From here, you can go many ways but I can't guide your path step by step. The only advice I can give you is to look for ones such as yourself.'");
    quest::summonitem(20462);
  }
elsif (plugin::check_handin(\%itemcount, 20468 => 1)) {
	quest::emote("hands you a scimitar she usually wears at her side. 'Thank you, $name. With this we can hold back the corruption. We have learned something new though. Not only is this work the responsibility of the lord of hatred alone. For some reason we cannot know the lord of disease has decided it worthy of his time to work in conjunction with Innoruuk. The spirits of the three main continents, Faydwer Antonica and Kunark, have been corrupted. Look for the corrupted forces of the land and heal them. When you have found them all then take my scimitar and the spirits to Xanuusus.'");
    quest::summonitem(20440);
}
    plugin::return_items(\%itemcount);
}

# EOF zone: misty ID: 33077 NPC: Ella_Foodcrafter

