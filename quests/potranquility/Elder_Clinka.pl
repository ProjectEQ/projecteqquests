sub EVENT_SAY {
 if($text =~ /Hail, Elder Clinka/i) {
	quest::emote("does not seem to notice you.");
 }
}


sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28291 => 1)) {
	quest::say("It is a pleasure to meet you. I've heard a great deal about you from the other elders. Please give me a moment to scan over this for you.");
	quest::emote("scans the schematic for a few seconds, mumbling as she reads, 'This parchment states that you are to place a small shard of concentrated elemental matter into each of the holes in your talisman.' She points a finger to the diagram as she begins to recount what she has learned from it, 'They would then need to be locked into place, as the diagram indicates here.'");
	quest::say("If you bring me a fragment or shard of some living creature from each of the elemental planes, I will see if we can make this device work. Place them in this box with your talisman and combine them together before returning the box to me. In the meantime, I will continue to translate this document from its original language.");
        quest::summonitem(17279);
 }
  if (plugin::check_handin(\%itemcount, 28297 => 1)) {
    quest::emote("carefully opens the small box and takes several small tools from the pocket in her robe. Her nimble fingers place the glowing elemental pieces into the appropriate sockets and covers them with several small caps that she must have made while you were away.");
	quest::say("This device is called the Binden Concerrentia. Its true power will be revealed to you soon. This document describes it as a device that is meant to convert the energy that can be found in true prime elemental matter, into an entirely new form of energy. The schematic states that this energy will 'bind you in the now'. I am not sure what that means, but I believe that you will soon find out.");
	quest::say("Take care of it and keep it with you at all times. I feel that your journey from this point will only become more dangerous. Perhaps this device will play a role in all of that. Move forward along the path of enlightenment. May the Balance guide your fate.");
   quest::summonitem(28296);
   quest::exp(300000);
 }
}

#EOF Elder_Clinka