#Cavalier_Waut.pl
#Paladin PoP Spells


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Good day t'ye, traveler. The adepts of New Tanaan 'ave worked very laboriously t'properly welcome ye t'the Plane of Knowledge. Many of us 'ave delved into the past lives of our ventures upon Norrath an' 'ave brought forth from the recesses of our memories the spells that we once wielded as might t'our cause. Now, we no longer be needin' them, but we understand that ye may very well find them t'be of use yet. Oh, and if ye find an item of arcane nature though it seems t'be mundane or useless t'ye, dinnae disregard it! The planes 'old many items that are not what they seem, friend. Return such incorporeal runes and scrolls t'me and I shall make them spells worhty of any crusading paladin!");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29112 => 1)) {#Ethereal Parchment
    quest::emote("carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The Paladin then closes his eyes and chants lowly in an unfamiliar language. You feel the coalescing of spirits around you in the area as the Paladin calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the Paladin. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf, 'Do not use this power without caution, $name. It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.'");
    quest::summonitem(quest::ChooseRandom(26945, 21631, 26941, 21652, 26933, 26937)); #Level 61 or 62 Paladin spell, PoP (Greater Immobilize, Touch of Nife, Crusader's Touch, Force of Akilae, Ward of Nife, Deny Undead)
  }
  
  elsif(plugin::check_handin(\%itemcount, 29131 => 1)) {#Spectral Parchment
    quest::emote("carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The Paladin then closes his eyes and chants lowly in an unfamiliar language. You feel the coalescing of spirits around you in the area as the Paladin calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the Paladin. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf, 'Do not use this power without caution, $name. It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.'");
    quest::summonitem(quest::ChooseRandom(26934, 26939, 21654, 26935, 21649)); #Level 63 or 64 Paladin spell, PoP (Pious Might, Light of Nife, Aura of the Crusader, Quellious' Word of Serenity, Supernal Cleansing)
  }
  
  elsif(plugin::check_handin(\%itemcount, 29132 => 1)) {#Glyphed Rune Word
    quest::emote("carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The Paladin then closes his eyes and chants lowly in an unfamiliar language. You feel the coalescing of spirits around you in the area as the Paladin calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the Paladin. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf, 'Do not use this power without caution, $name. It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.'");
    quest::summonitem(quest::ChooseRandom(21653, 26936, 26938)); #Level 65 Paladin spell, PoP (Shackles of Tunare, Wave of Marr, Brell's Stalwart Shield)
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
  }
}#Done