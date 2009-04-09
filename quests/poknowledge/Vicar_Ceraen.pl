#Vicar Ceraen.pl
#Cleric PoP Spells


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Greetings, $name. I am Ceraen, priest of Tunare and resident of New Tanaan for over three centuries of my existence. Do not fear those whom may have been your enemy upon the prime. The scholars are equal and without bias toward one another, thus there is no safer place in the cosmos than New Tanaan. Each resident strives to bring knowledge closer to the curious and willing, and I am not exempt from this." );
quest::say("If you are a priest in your world and seek to gain a higher understanding of the divine power that your faith has allowed you to wield, then perhaps what spells I have penned from memory of your world would be of use. I have also mastered levels in the workings of planar magic and its chaotic ways of forming upon the manifested planes. If by chance you come across a fledgling arcane item -- you will know it for its incorporeal state -- then do not hesitate to bring it to me. I may be able to infuse it with the powers of the divine and forge from it a spell of priestly might.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29112 => 1)) {#Ethereal Parchment
    quest::emote("Vicar Ceraen takes the arcane item with great care and respect from you. For several moments the priest seems to enter a state of contemplative meditiation upon the arcane planar item. Suddenly, he begins a slow, soft chant -- a prayer whose dialect is unknown to your ears. Eventually, the arcane item in his hand begins to waver into this existence, its corporeal state rendered beneath the priest's chanting.");
quest::emote("As he grows quiet and calm once more, the priest hands the corporeal item to you -- the runes of divine power etched upon the tangible scroll, 'This should be of great use to you, $name. Use its power wisely.'");
    quest::summonitem(quest::ChooseRandom(28646, 28557, 28561, 28572, 21690, 26945, 28558, 28563, 28566, 28567, 28564, 26947)); #Level 61 or 62 Cleric spell, PoP (Faith, Symbol of Kazad, Ward of Gallantry, Tarnation, Sermon of Penitence, Greater Immobilize, Virtue, Blessing of Reverence, Supernal Elixir, Condemnation, Catastrophe, Pacification)
  }
  
  elsif(plugin::check_handin(\%itemcount, 29131 => 1)) {#Spectral Parchment
    quest::emote("Vicar Ceraen takes the arcane item with great care and respect from you. For several moments the priest seems to enter a state of contemplative meditiation upon the arcane planar item. Suddenly, he begins a slow, soft chant -- a prayer whose dialect is unknown to your ears. Eventually, the arcane item in his hand begins to waver into this existence, its corporeal state rendered beneath the priest's chanting.");
quest::emote("As he grows quiet and calm once more, the priest hands the corporeal item to you -- the runes of divine power etched upon the tangible scroll, 'This should be of great use to you, $name. Use its power wisely.'");
    quest::summonitem(quest::ChooseRandom(21647, 28569, 28571, 28573, 26946, 28559, 28560, 28562)); #Level 63 or 64 Cleric spell, PoP (Kazad's Mark, Hammer of Damnation, Supernal Light, Sound of Might, Petrifying Earth, Destroy Undead, Mark of Kings, Word of Replenishment)
  }
  
  elsif(plugin::check_handin(\%itemcount, 29132 => 1)) {#Glyphed Rune Word
    quest::emote("Vicar Ceraen takes the arcane item with great care and respect from you. For several moments the priest seems to enter a state of contemplative meditiation upon the arcane planar item. Suddenly, he begins a slow, soft chant -- a prayer whose dialect is unknown to your ears. Eventually, the arcane item in his hand begins to waver into this existence, its corporeal state rendered beneath the priest's chanting.");
quest::emote("As he grows quiet and calm once more, the priest hands the corporeal item to you -- the runes of divine power etched upon the tangible scroll, 'This should be of great use to you, $name. Use its power wisely.'");
    quest::summonitem(quest::ChooseRandom(21689, 28555, 28565, 28568, 28570)); #Level 65 Cleric spell, PoP (Yaulp VI, The Silent Command, Armor of the Zealot, Mark of the Righteous, Hand of Virtue)
  }
  
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
  }
    
}
#END of FILE Zone:poknowledge  ID:202218 -- Vicar_Ceraen 

