# Chaos Runes (Ancient GoD Spells)
# Taelosian Geomancy Stones (GoD spells)
# Created by Gonner
# items: 62881, 62882, 62868, 62885, 59907, 59909, 59919, 59855, 59846, 59911, 59852, 59857, 59913, 59847, 59848, 59849, 59854, 59850, 59851, 59853, 59856, 59906, 59908, 59918, 59835, 59811, 59910, 59831, 59841, 59912, 59814, 59821, 59823, 59837, 59817, 59825, 59828, 59844, 59975, 59836, 59812, 59833, 59842, 59815, 59820, 59824, 59839, 59818, 59827, 59830, 59845, 59974, 59834, 59810, 59832, 59840, 59813, 59819, 59822, 59838, 59826, 59816, 59829, 59843

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("stares silently out over the ocean towards the magical wards protecting the ship from the unyielding onslaught of the pounding waves. He jumps back terrorized when he realizes your presence. His visage calms a bit when he senses you mean him no immediate harm. He ponders you timidly for a moment and then leans down and begins drawing something in the sea grime that covers one of the boxes. You study his sketch for a moment and begin to understand that it is a rune of sorts. Three arching lines join in the center to form a sort of Y-shape.");
    if (plugin::check_hasitem($client, 62863)) {
		$client->Message(1, "The bedraggled Taelosian refugee looks up at you after drawing the symbol and looks you directly in the eyes for the first time. He seems to draw strength from your presence and you sense that he feels the power of nature that you carry. He smiles weakly at you and then bends down and erases the symbol by smearing around the surrounding grime. He then draws a new symbol. This symbol is much more complicated, it is an arch with rods protruding from either side at the base. The rod to the right splits into four branches, the one on the left ends in a swirl. He looks up at you with a pleading look in his eyes as he hands you a small bag that appears to be made from his own clothing");
		if($client->GetGlobal("druid_epic") < 9) {
			quest::setglobal('druid_epic',9, 5, 'F' );
		}
		quest::summonitem(62881); #Ragged Cloth Bag
	}
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62882 => 1)) { # Wrapped Cloth Bag
	quest::setglobal('druid_epic',10, 5, 'F' );
	quest::emote("looks almost delighted, certainly happier than he has been in years. He smiles and raises his arms, both hands tightly clenching the rune fragments you have recovered. A small burst of magical energies pops off his hands. He lowers his arms and holds out to you the rune, reformed. He then speaks a single word to you, 'Yuisaha.'");
    quest::summonitem(62868); #Rune of Yuisaha 
  }
  if (plugin::check_handin(\%itemcount, 62885 => 1)) { # Synched Leather Bag
	quest::setglobal('druid_epic',12, 5, 'F' );
	quest::emote("makes a motion with his hands, slowly clasping them together until they are locked tightly. He points at you, then at the shards, then makes the motion again");
    quest::summonitem(62885); #Synched Leather Bag
  }  
  

  if (plugin::check_handin(\%itemcount, 59907 => 1)) { # Chaos Rune
    quest::emote("eyes grow wide as you hand him the glowing black rune. He holds the chaos rune in his left hand and begins to speak. Your skin begins to crawl as you recognize the words as the language of the legion. The runes melt into a sticky mass of darkness which seeps out over Reyfin's hands. He tips his head toward your hands and you bring them out in front of you. Without any visible motion from Reyfin, the black mass quivers and slides through the air toward you and settles in your out stretched hands. The goo begins to solidify and your eyes quiver with amazement as the letters begin to form into familiar words on the black stone."); 
    if ($class eq "Warrior"){quest::summonitem(59909);} # Chaos Cry
    elsif ($class eq "Berserker"){quest::summonitem(59919);} # Cry of Chaos
    elsif ($class eq "Ranger"){quest::summonitem(59855);} # Ancient: Burning Chaos
    elsif ($class eq "Bard"){quest::summonitem(59846);} # Ancient: Chaos Chant 
    elsif ($class eq "Rogue"){quest::summonitem(59911);} # Chaos Strike
    elsif ($class eq "Paladin"){quest::summonitem(59852);} # Ancient: Force of Chaos
    elsif ($class eq "Shadowknight"){quest::summonitem(59857);} # Ancient: Bite of Chaos
    elsif ($class eq "Monk"){quest::summonitem(59913);} # Phantom Chaos
    elsif ($class eq "Beastlord"){quest::summonitem(59847);} # Ancient: Frozen Chaos
    elsif ($class eq "Cleric"){quest::summonitem(59848);} # Ancient: Chaos Censure
    elsif ($class eq "Druid"){quest::summonitem(59849);} # Ancient: Chaos Frost
    elsif ($class eq "Shaman"){quest::summonitem(59854);} # Ancient: Chaotic Pain
    elsif ($class eq "Enchanter"){quest::summonitem(59850);} # Ancient: Chaos Madness
    elsif ($class eq "Magician"){quest::summonitem(59851);} # Ancient: Chaos Vortex
    elsif ($class eq "Necromancer"){quest::summonitem(59853);} # Ancient: Seduction of Chaos
    elsif ($class eq "Wizard"){quest::summonitem(59856);} # Ancient: Strike of Chaos
    quest::exp(10000);
  }
  elsif (plugin::check_handin(\%itemcount, 59906 => 1)) { # Taelosian Geomancy Stone Jelki
    quest::emote("shuffles back from you until familiarity dawns on him. You reach forward and hold the stone out in front of you. He tilts his head slightly and studies the stone for a moment before taking it from your hands."); 
    quest::emote("holds the symbol up over his head and speaks out over the dark waters. He begins to recite some sort of ritual as the runes begin to drip a sticky-looking fluid down on to his hands and arms. The rune begins to glow, softly at first, but it becomes brighter as Reyfin's voice rises. Suddenly, the symbol sublimates into a hovering mass of glowing vapor. Reyfin turns to you and beckons. You hold out your hand and receive the glowing vapor. Almost immediately the vapor solidifies into a familiar shape. Reyfin bends down and begins drawing in the grime once again. You see a pair of jagged lines crossing in the center. "); 
    if ($class eq "Warrior"){quest::summonitem(59908);} # Bellow of the Mastruq
    elsif ($class eq "Berserker"){quest::summonitem(59918);} # Battle Cry of the Mastruq
    elsif ($class eq "Ranger"){quest::summonitem(59835);} # Sylvan Burn
    elsif ($class eq "Bard"){quest::summonitem(59811);} # Echo of the Trusik
    elsif ($class eq "Rogue"){quest::summonitem(59910);} # Kyv Strike
    elsif ($class eq "Paladin"){quest::summonitem(59831);} # Wave of Trushar
    elsif ($class eq "Shadowknight"){quest::summonitem(59841);} # Black Shroud
    elsif ($class eq "Monk"){quest::summonitem(59912);} # Phantom Shadow
    elsif ($class eq "Beastlord"){quest::summonitem(59814);} # Trushar's Mending
    elsif ($class eq "Cleric"){quest::summonitem(59821);} # Holy Elixir
    elsif ($class eq "Druid"){quest::summonitem(59823);} # Sylvan Fire
    elsif ($class eq "Shaman"){quest::summonitem(59837);} # Breath of Trushar
    elsif ($class eq "Enchanter"){quest::summonitem(59817);} # Bliss of the Nihil
    elsif ($class eq "Magician"){quest::summonitem(59825);} # Elemental Siphon
    elsif ($class eq "Necromancer"){quest::summonitem(59828);} # Night Stalker
    elsif ($class eq "Wizard"){quest::summonitem(59844);} # White Fire
    quest::exp(10000);
  }
  elsif (plugin::check_handin(\%itemcount, 59975 => 1)) { # Taelosian Geomancy Stone Eril
    if ($class eq "Ranger"){quest::summonitem(59836);} # Sylvan Call
    elsif ($class eq "Bard"){quest::summonitem(59812);} # Dark Echo
    elsif ($class eq "Paladin"){quest::summonitem(59833);} # Holy Order
    elsif ($class eq "Shadowknight"){quest::summonitem(59842);} # Miasmic Spear
    elsif ($class eq "Beastlord"){quest::summonitem(59815);} # Trushar's Frost
    elsif ($class eq "Cleric"){quest::summonitem(59820);} # Order
    elsif ($class eq "Druid"){quest::summonitem(59824);} # Sylvan Embers
    elsif ($class eq "Shaman"){quest::summonitem(59839);} # Daluda's Mending
    elsif ($class eq "Enchanter"){quest::summonitem(59818);} # Madness of Ikkibi
    elsif ($class eq "Magician"){quest::summonitem(59827);} # Monster Summoning IV
    elsif ($class eq "Necromancer"){quest::summonitem(59830);} # Night's Beckon
    elsif ($class eq "Wizard"){quest::summonitem(59845);} # Telaka
    quest::exp(10000);
  }
  elsif (plugin::check_handin(\%itemcount, 59974 => 1)) { # Taelosian Geomancy Stone Yiktu
    if ($class eq "Ranger"){quest::summonitem(59834);} # Sylvan Light
    elsif ($class eq "Bard"){quest::summonitem(59810);} # War March of the Mastruq
    elsif ($class eq "Paladin"){quest::summonitem(59832);} # Light of Order
    elsif ($class eq "Shadowknight"){quest::summonitem(59840);} # Mental Horror
    elsif ($class eq "Beastlord"){quest::summonitem(59813);} # Turepta Blood
    elsif ($class eq "Cleric"){quest::summonitem(59819);} # Holy Light
    elsif ($class eq "Druid"){quest::summonitem(59822);} # Sylvan Infusion
    elsif ($class eq "Shaman"){quest::summonitem(59838);} # Balance of the Nihil
    elsif ($class eq "Magician"){quest::summonitem(59826);} # Rock of Taelosia
    elsif ($class eq "Enchanter"){quest::summonitem(59816);} # Dreary Deeds
    elsif ($class eq "Necromancer"){quest::summonitem(59829);} # Night Fire
    elsif ($class eq "Wizard"){quest::summonitem(59843);} # Black Ice
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279029 -- Reyfin_Malakwa.pl