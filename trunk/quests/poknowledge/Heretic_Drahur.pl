#Heretic Drahur.pl
#Necromancer PoP Spells


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Salutations. The keepers of necromancy in New Tanaan are neither your enemy or foe, as they may have been upon the material world of Norrath. Though our natures are in tact, we have elevated ourselves beyond the petty, debased bickering that Norrath has come to embody over the passing eras. All adventurers and intelligent beings are welcome in our midst, for we share only the common goal of knowledge and personal betterment in our power. I have gathered tomes and spells that I no longer have use for, as I have ascended beyond Norrath's limitations of the dark arts. However, you remain a mortal still and your abilities may never reach the esteemed levels of ours, bur do not let this discourage you. Search my tomes and perhaps I hold something of importance or relevance to your current quest for power. There is another realm of magic that I am quite familiar with, as well -- the aspects of planar magic.");
    }
  }
 
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29112 => 1)) {#Ethereal Parchment
    quest::emote("Carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The Necromancer then closes his eyes and chants lowly in an unfamiliar language. You feel the coalescing of spirits around you in the area as the Necromancer calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the Necromancer. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf, 'Do not use this power without caution, $name. It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.");
    quest::summonitem(quest::ChooseRandom(21638, 21640, 28413, 28417, 26946, 28418, 28419)); #Level 61 or 62 Necromancer spell, PoP (Touch of Mujaki, Neurotoxin, Shield of the Arcane, Legacy of Zek, Petrifying Earth, Rune of Death, Saryrn's Kiss)
  }
 
  elsif (plugin::check_handin(\%itemcount, 29131 => 1)) {#Spectral Parchment
    quest::emote("Carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The Necromancer then closes his eyes and chants lowly in an unfamiliar language. You feel the coalescing of spirits around you in the area as the Necromancer calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the Necromancer. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf, 'Do not use this power without caution, $name. It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.");
    quest::summonitem(quest::ChooseRandom(26945, 28414, 28420, 28421, 28422, 28415, 28423, 28424, 28559)); #Level 63 or 64 Necromancer spell, PoP (Greater Immobilize, Force Shield, Death's Silence, Embracing Darkness, Saryrn's Companion, Shield of Maelin, Seduction of Saryrn, Touch of Death, Destroy Undead)
  }
 
  elsif (plugin::check_handin(\%itemcount, 29132 => 1)) {#Glyphed Rune Word
    quest::emote("Carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The Necromancer then closes his eyes and chants lowly in an unfamiliar language. You feel the coalescing of spirits around you in the area as the Necromancer calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the Necromancer. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf, 'Do not use this power without caution, $name. It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.");
    quest::summonitem(quest::ChooseRandom(28416, 28425, 28427)); #Level 65 Necromancer spell, PoP (Blood of Thule, Child of Bertoxxulous, Word of Terris)
  }
 
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);   
  }
}
#Done, quest by Kilelen 