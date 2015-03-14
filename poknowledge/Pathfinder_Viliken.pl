#Pathfinder_Viliken.pl
#Ranger PoP Spells


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Greetings, friend, and welcome to New Tanaan. We have worked hard to properly greet you into our midst, and hope that our efforts shall not be in vain. As a ranger of Tunare in my former life upon Norrath, I have joined my fellow Pathfinders in scribing spells from memory of our journeys upon your world. These spells are not unique to the Plane of Knowledge, for they are the same as those Norrath offers to its guardians. However, they may be convenient for you to purchase here while you are browsing our libraries and engaging in the wonders of our beautiful, peaceful city. However, do not forget the scholars whilst you are engaging in the planes. You may stumble across a piece of pure arcane manifestation that may appear mundane at first, but with my help can become a spell of great power to all of nature's wardens.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29112 => 1)) {#Ethereal Parchment
    quest::emote("takes the arcane item from you. Carefully, he inspects it -- nodding to himself in recognition of the item and planning of his next step. The ranger then begins a soft, melodic chant of priestly origin. You recognize the nature of the words to be a hym of the natural world, though you cannot decipher their meaning. The arcane object fades into existence, the runes etching themselves upon the surface become clear in their mat, neutral hues. Eventually, the ranger's chant ends and the object in his hand is complete. He then extends it to you in unconditional offering, 'Use this wisely and with great respect for the power that has originated it. The primordial arcane powers of the divine worlds are not to be disrespected.'");
    quest::summonitem(quest::ChooseRandom(26943, 21628, 21627)); #Level 61 or 62 Ranger spell, PoP (Earthen Roots, Call of the Rathe, Strength of Tunare)
  }
  
  elsif(plugin::check_handin(\%itemcount, 29131 => 1)) {#Spectral Parchment
    quest::emote("takes the arcane item from you. Carefully, he inspects it -- nodding to himself in recognition of the item and planning of his next step. The ranger then begins a soft, melodic chant of priestly origin. You recognize the nature of the words to be a hym of the natural world, though you cannot decipher their meaning. The arcane object fades into existence, the runes etching themselves upon the surface become clear in their mat, neutral hues. Eventually, the ranger's chant ends and the object in his hand is complete. He then extends it to you in unconditional offering, 'Use this wisely and with great respect for the power that has originated it. The primordial arcane powers of the divine worlds are not to be disrespected.'");
    quest::summonitem(quest::ChooseRandom(26931, 26929, 26930, 21626)); #Level 63 or 64 Ranger spell, PoP (Frozen Wind, Nature's Rebuke, Spirit of the Predator, Brushfire)
  }
  
  elsif(plugin::check_handin(\%itemcount, 29132 => 1)) {#Glyphed Rune Word
    quest::emote("takes the arcane item from you. Carefully, he inspects it -- nodding to himself in recognition of the item and planning of his next step. The ranger then begins a soft, melodic chant of priestly origin. You recognize the nature of the words to be a hym of the natural world, though you cannot decipher their meaning. The arcane object fades into existence, the runes etching themselves upon the surface become clear in their mat, neutral hues. Eventually, the ranger's chant ends and the object in his hand is complete. He then extends it to you in unconditional offering, 'Use this wisely and with great respect for the power that has originated it. The primordial arcane powers of the divine worlds are not to be disrespected.'");
    quest::summonitem(quest::ChooseRandom(21655, 26932)); #Level 65 Ranger spell, PoP (Protection of the Wild, Cry of Thunder)
  }
  
  plugin::return_items(\%itemcount);
    
}#Done