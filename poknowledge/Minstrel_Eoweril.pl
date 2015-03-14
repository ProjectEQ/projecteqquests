#Minstrel Eoweril.pl
#Bard PoP Spells/Songs

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hail and well met, my friend. New Tanaan greets you most warmly and is grateful to have you in our midst. All residents of this great Plane of Knowledge have come together in recent times with the unexpected, though warmly embraced presence of Norrathian visitors. We hope that we might be able to aid you in lending our wisdom and timeless knowledge wherever possible to your cause. I wish I could do more, my friend, but I am but a humble bard and my services may only benefit those of like profession. However, if you believe that my services could be of use, then do not hesitate to peruse my inventory and purchase what you will. If by chance you come across a curious parchment or other arcane item of seemingly unidentifiable purpose, then do not hesitate to bring it to me. Besides having composed many a song in my day, I do know a thing or two regarding mysteries of the planes' magics.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29112 => 1)) {#Ethereal Parchment
    quest::emote("takes the curious parchment and examines it."); #Real text still needed
    quest::say("Very interesting, I will share this with the other academics. Take this as a reward for your discovery."); #Real text still needed
    quest::summonitem(quest::ChooseRandom(28471, 28473, 28476, 21636, 28474, 28475, 28484, 16391)); #Level 61 or 62 Bard spell, PoP (Silent Song of Quellious, Tuyen's Chant of the Plague, Saryrn's Scream of Pain, Dreams of Thule, Druzzil's Disillusionment, Melody of Mischief, Warsong of Zek, Wind of Marr)
  }
  elsif (plugin::check_handin(\%itemcount, 29131 => 1)) {#Spectral Parchment
    quest::emote("takes the curious parchment and examines it."); #Real text still needed
    quest::say("Very interesting, I will share this with the other academics. Take this as a reward for your discovery."); #Real text still needed
    quest::summonitem(quest::ChooseRandom(28478, 28480, 28483, 28472, 28479, 28481, 28482, 21650)); #Level 63 or 64 Bard spell, PoP (Psalm of Veeshan, Tuyen's Chant of Venom, Tuyen's Chant of Ice, Rizlona's Call of Flame, Dreams of Terris, Call of the Banshee, Chorus of Marr, Requiem of Time)
  }
  elsif (plugin::check_handin(\%itemcount, 29132 => 1)) {#Glyphed Rune Word
    quest::emote("takes the curious parchment and examines it."); #Real text still needed
    quest::say("Very interesting, I will share this with the other academics. Take this as a reward for your discovery."); #Real text still needed
    quest::summonitem(quest::ChooseRandom(28477, 28485, 28486)); #Level 65 Bard spell, PoP (Tuyen's Chant of Fire, Harmony of Sound, Lullaby of Morell)
  }
  plugin::return_items(\%itemcount);
}
#Done, quest by Kilelen