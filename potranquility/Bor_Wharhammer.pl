#Bor_Wharhammer.pl
#PoP quest armors
# items: 32409, 15791, 16577, 16267, 17184, 16271, 16269, 16272, 16270, 16276, 17185, 16275, 16268, 16273, 16274, 16278, 16279, 16280, 16281, 16277, 32000

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetin's t'ye $name! Isn't the area 'round 'ere so nice an' quiet? ... I 'ave even devised a type o'[" . quest::saylink("emblem") . "] that will impart the magic o'tranquility into the user t'create planar armors from pieces o'energy found in the planes.");
  }
  if ($text=~/emblem/i) {
    if ($ulevel <= 54) {
      quest::say("Ye look mighty inexperienced t'be in this area. $name. Come an' seek me out when ye 'ave more knowledge o'the planes!");
    }
    else {
      quest::say("Well, the emblems dinnae be easy t'craft but I will gladly give ye one fer the price of 500 platinum pieces. They allow a planes traveler with no craftin' skills t'create many fine pieces o'planar armor in a special, magical kit I also 'ave an' will throw in with the price...");
    }
  }
  if ($text=~/chain/i) {
    quest::say("Ahhhhh $name! Chain armors ...");
  }
  if ($text=~/silk/i) {
    quest::say("Har! It be quite funny that we be referin' t'silk as armor ...");
  }
  if ($text=~/leather/i) {
    quest::say("Leather armor provides little protection ...");
  }
  if ($text=~/plate/i) {
    quest::say("Ahhhhh $name! The fine rigid armor that can stop a shaft ...");
  }
  if ($text=~/swatch/i) {
    quest::say("T'make a swatch, ye need t'combine two strands o'ether ...");
  }
}

sub EVENT_ITEM {
  my $cash = $platinum * 1000 + $gold * 100 + $silver * 10 + $copper;

  # Mage Epic side quest hand-in
  if ($client->GetGlobal("mage_epic_fire1") == 1) {
    if (plugin::check_handin(\%itemcount, 32409 => 1, 15791 => 1)) {
      quest::say("Eh? I see ol' Gnaap 'as gotten' 'imself in'o a pickle again. ...");
      quest::summonitem(16577); #reinforced flask
      return;
    }
  }

  # Emblem purchase logic
  if ($ulevel > 54) { # Must be 55+
    if ($cash >= 500000) { # 500 platinum
      if ($class eq "Warrior") {
        quest::summonitem(16267); quest::summonitem(17184);
      }
      elsif ($class eq "Cleric") {
        quest::summonitem(16271); quest::summonitem(17184);
      }
      elsif ($class eq "Paladin") {
        quest::summonitem(16269); quest::summonitem(17184);
      }
      elsif ($class eq "Ranger") {
        quest::summonitem(16272); quest::summonitem(17184);
      }
      elsif ($class eq "Shadowknight") {
        quest::summonitem(16270); quest::summonitem(17184);
      }
      elsif ($class eq "Druid") {
        quest::summonitem(16276); quest::summonitem(17185);
      }
      elsif ($class eq "Monk") {
        quest::summonitem(16275); quest::summonitem(17185);
      }
      elsif ($class eq "Bard") {
        quest::summonitem(16268); quest::summonitem(17184);
      }
      elsif ($class eq "Rogue") {
        quest::summonitem(16273); quest::summonitem(17184);
      }
      elsif ($class eq "Shaman") {
        quest::summonitem(16274); quest::summonitem(17184);
      }
      elsif ($class eq "Necromancer") {
        quest::summonitem(16278); quest::summonitem(17185);
      }
      elsif ($class eq "Wizard") {
        quest::summonitem(16279); quest::summonitem(17185);
      }
      elsif ($class eq "Magician") {
        quest::summonitem(16280); quest::summonitem(17185);
      }
      elsif ($class eq "Enchanter") {
        quest::summonitem(16281); quest::summonitem(17185);
      }
      elsif ($class eq "Beastlord") {
        quest::summonitem(16277); quest::summonitem(17185);
      }
      elsif ($class eq "Berserker") {
        quest::summonitem(32000); quest::summonitem(17184);
      }
      else {
        quest::say("What ar ye?");
        plugin::return_items(\%itemcount); # only return junk
        return;
      }

      quest::say("Wonderful! This coin will go towards me fines with the Myrist library... 'ere be yer emblem an' a kit...");
      return; # <-- do not return items here (money is kept!)
    }
    else {
      plugin::return_items(\%itemcount); # Not enough money
      return;
    }
  }
  else {
    quest::say("Ye look mighty inexperienced t'be in this area, $name. Come an' seek me out when ye 'ave more knowledge o'the planes!");
    plugin::return_items(\%itemcount);
    return;
  }
}
#END of FILE Zone:potranquility  ID:203064 -- Bor_Wharhammer
