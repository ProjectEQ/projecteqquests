#Wanderer_Astobin.pl
#Druid PoP Spells


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Greetings traveler. I am Wanderer Astobin, warden of nature and guardian of Tunare's most blessed and sacred of treasures -- life and balance. I have pledged my existence to upholding this vow and even here, that vow remains. Though I no longer carry my scimitar or scout the wilds of the world as one of its many guardians, my pledge shall remain whole through my guidance of others whose pledge is akin to mine. If you are a druid -- your deity matters not -- then allow me to guide you if I may. What spells I have scribed are for you to search through and purchase should you find them worthy of your abilities. If through your travels in the outer planes you discover incorporeal items seemingly of an arcane nature, do not disregard them. I am well-trained in the ways and manner of planar magic and will be more than willing to turn these fledgling arcane items into tangible spells suited for those of druidic vows.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29112 => 1)) {#Ethereal Parchment
    quest::emote("Wanderer Astobin respectfully accepts the item, holding it in his hands like one would a delicate and priceless relic. His eyes scan its every surface in a detailed study before he closes his eyes and begins to weave a chant of unknown dialect and origin. As the druid's voice filters softly through the area, the object in his hand begins to fade into this existence, its intangible state destroyed beneath the druid's magic. Runes begin to appear upon the fully manifested scroll -- runes of a druidic decent. The druid ceases his chanting and then slowly hands the item to you, 'This is a spell of great power. Use it wisely and with caution, for to abuse the gifts of nature is to corrupt our sole purpose.'");
    quest::summonitem(quest::ChooseRandom(26943, 28524, 28525, 28526, 28564, 21656, 28527, 28528, 28529, 28530)); #Level 61 or 62 Druid spell, PoP (Earthen Roots, Storm's Fury, Hand of Ro, Winter's Storm, Catastrophe, Flight of Eagles, Immolation of Ro, Karana's Rage, Nature's Might, Ro's Illumination)
  }
  
  elsif(plugin::check_handin(\%itemcount, 29131 => 1)) {#Spectral Parchment
    quest::emote("Wanderer Astobin respectfully accepts the item, holding it in his hands like one would a delicate and priceless relic. His eyes scan its every surface in a detailed study before he closes his eyes and begins to weave a chant of unknown dialect and origin. As the druid's voice filters softly through the area, the object in his hand begins to fade into this existence, its intangible state destroyed beneath the druid's magic. Runes begin to appear upon the fully manifested scroll -- runes of a druidic decent. The druid ceases his chanting and then slowly hands the item to you, 'This is a spell of great power. Use it wisely and with caution, for to abuse the gifts of nature is to corrupt our sole purpose.'");
    quest::summonitem(quest::ChooseRandom(21658, 21659, 28531, 28532, 28533, 28535, 28536, 28538, 21657, 28534, 28537, 28539, 28540)); #Level 63 or 64 Druid spell, PoP (Protection of the Nine, Destroy Summoned, Blessing of Replenishment, E'ci's Frosty Breath, Nature's Infusion, Command of Tunare, Swarming Death, Shield of Bracken, Karana's Renewal, Protection of Seasons, Savage Roots, Summer's Flame, Brackencoat)
  }
  
  elsif(plugin::check_handin(\%itemcount, 29132 => 1)) {#Glyphed Rune Word
    quest::emote("Wanderer Astobin respectfully accepts the item, holding it in his hands like one would a delicate and priceless relic. His eyes scan its every surface in a detailed study before he closes his eyes and begins to weave a chant of unknown dialect and origin. As the druid's voice filters softly through the area, the object in his hand begins to fade into this existence, its intangible state destroyed beneath the druid's magic. Runes begin to appear upon the fully manifested scroll -- runes of a druidic decent. The druid ceases his chanting and then slowly hands the item to you, 'This is a spell of great power. Use it wisely and with caution, for to abuse the gifts of nature is to corrupt our sole purpose.'");
    quest::summonitem(quest::ChooseRandom(28645, 28541, 28542, 28543)); #Level 65 Druid spell, PoP (Legacy of Bracken, Blessing of the Nine, Winter's Frost, Mask of the Forest)
  }
  else {
  
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
  }
    
}#Done