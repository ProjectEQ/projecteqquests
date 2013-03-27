# Chaos Runes (Ancient GoD Spells)
# Taelosian Geomancy Stones (GoD spells)
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("stares silently out over the ocean towards the magical wards protecting the ship from the unyielding onslaught of the pounding waves. He jumps back terrorized when he realizes your presence. His visage calms a bit when he senses you mean him no immediate harm. He ponders you timidly for a moment and then leans down and begins drawing something in the sea grime that covers one of the boxes. You study his sketch for a moment and begin to understand that it is a rune of sorts. Three arching lines join in the center to form a sort of Y-shape.");
  }
}

sub EVENT_ITEM {
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