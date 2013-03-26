sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings traveler and welcome to the Plane of Knowledge! I am so pleased to see so many eager minds among us -- for it has been so long since I have had the meaningful presence of a pupil. If by chance you practice the art of Enchantments. then I might be of service to you. I have penned many spells from memory as a wandering enchanter and scholar of Norrath's history and though these spells are nothing unique or rare unto your world. they may provide some aid to you while you are here. Also. if you happen upon a seemingly meaningless item of arcane nature -- you will recognize these specific items I speak of by their corporeal state of existence -- then do not hesitate to take them up and return them to me. I know a thing or two regarding planar magic and can turn these seemingly mundane items into enchantments of great power.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29112 => 1)) {#Ethereal Parchment
    quest::emote(" examines the item. 'Excellent! I can continue my research into planar magic. Take this as a reward.'");
    quest::summonitem(quest::ChooseRandom(26944, 28413, 28643, 28644, 28452, 28453, 26947, 21665, 21667, 28455, 28457, 28469, 21639)); #Level 61 or 62 Enchanter spell, PoP (Greater Fetter, Shield of the Arcane, Arcane Rune, Boggle, Howl of Tashan, Rune of Zebuxoruk, Pacification, Speed of Vallon, Guard of Druzzil, Strangle, Beckon, Word of Morell, Aeldorb's Animation)
  }
  elsif (plugin::check_handin(\%itemcount, 29131 => 1)) {#Spectral Parchment
    quest::emote(" examines the item. 'Excellent! I can continue my research into planar magic. Take this as a reward.'");
    quest::summonitem(quest::ChooseRandom(21666, 28458, 28460, 28461, 28464, 28415, 28459, 28465, 28468)); #Level 63 or 64 Enchanter spell, PoP (Night's Dark Terror, Torment of Scio, Tranquility, Uproar, Sleep, Shield of Maelin, Insanity, Command of Druzzil, Bliss)
  }
  elsif (plugin::check_handin(\%itemcount, 29132 => 1)) {#Glyphed Rune Word
    quest::emote(" examines the item. 'Excellent! I can continue my research into planar magic. Take this as a reward.'");
    quest::summonitem(quest::ChooseRandom(21648, 21664, 28470)); #Level 65 Enchanter spell, PoP (Illusion Froglok, Vallon's Quickening, Voice of Quellious)
  }
  plugin::return_items(\%itemcount);
}
#Done, quest by Kilelen