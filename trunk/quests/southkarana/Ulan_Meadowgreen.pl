# warrior crafted armor
# generic reward text - could only find the correct text for the bracer
# updated the original file with correct text and used the handin plugin

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings. I am Ulan Meadowgreen of the family Meadowgreen. My brother and I are the best Armorers in all of Norrath. We craft [armor] for the bravest warriors in the land. If you are a Warrior of renown, and are interested in our armor, I have some mighty [labors] which you might attempt for me.");
  }
  if ($text=~/armor/i) {
    quest::say("I smith [Bracers], [Greaves], [Pauldrons] and [Breastplates]. My brother Shakrn smiths Helms, Gauntlets, Boots and Vambraces.");
  }
  if ($text=~/labors/i) {
    quest::say("Only those who can prove themselves mighty warriors deserve to wear our crafted armor.  While my brother prefers trophies, I seek instead tasks which will help my craft and my people.");
  }
  if ($text=~/bracers/i) {
    quest::say("The fine sheen that you see on our Crafted Armor is produced by a mixture of river berries and juice squeezed from the Optic Nerves of an Evil Eye. We are always in need of more Optic nerves for our armor. Bring me a handful of Optic Nerves and a [Sapphire], and I will give you a Crafted Bracer for your trouble.");
  }
  if ($text=~/greaves/i) {
    quest::say("Years ago, a Necromancer most foul terrorized the people of the Karanas. This wretch stole a [circlet] that father was smithing for my sister. It was very easy to recognize - shining silver like the light of dawn breaking. I have heard rumors that this Necromancer has settled in the depths of Najena. Return this circlet to me and gift me with two [Star Rubies], and I will reward you with Crafted Greaves.");
  }
  if ($text=~/circlet/i) {
    quest::say("The circlet my father forged was of the finest silver, ready to be enchanted by our more magical cousins.  It is a shame we never had the chance to finish the work.");
  }
  if ($text=~/pauldron/i) {
    quest::say("In the Caverns of Clan Runny Eye live several Evil Eyes of prestigious magical power. Split amongst them are the three lost pieces of the legendary [Rune of Dwarves]. When assembled, this Rune is said to impart a mystic skill to the smith who holds it. Bring me these three pieces and a [Fire Emerald], and I will smith for you a Pauldren worthy of the mightiest of warriors.");
  }
  if ($text=~/rune of dwarves/i) {
    quest::say("The Rune of Dwarves once rested in the heart of the city of Kaladim. Years ago, the goblins of Clan Runnyeye stole it from the dwarves. No one I have ever spoken to knows how it was broken. It is not hard to guess, however, why the evil eyes now hold them.");
  }
  if ($text=~/breastplate/i) {
    quest::say("Deep within the depths of Castle Mistmoore live a particularly deadly clan of Werewolves. These are the servants of [Mayong], and he has enchanted the most ferocious of them that their talons might cut through steel. I wish to study these talons, and see if I can transfer the enchantments from them to the Crafted Armor that I make. If you bring me Werewolf talons and [Rubies], then I will give to you a Breastplate the likes of which you have never before seen.");
  }
  if ($text=~/mayong/i) {
    quest::say("Mayong Mistmoore is the ruler of Castle Mistmoore. He has ruled there for centuries, and will most likely rule for centuries more to come. It is said that he does not age.");
  }
  if ($text=~/star rubies/i) {
    quest::say("I need a star ruby for a piece of jewelry my brother and I are creating.");
  }
  if ($text=~/sapphire/i) {
    quest::say("I need a sapphire for a piece of jewelry my brother and I are crafting.");
  }
  if ($text=~/^rubies$/i) {
    quest::say("I need rubies for a piece of jewelry my brother and I are crafting.");
    }
  if ($text=~/fire emerald/i) {
    quest::say("I need a fire emerald for a piece of jewelry my brother and I are crafting.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14019 => 1, 10034 => 1)) { #bracer
    quest::say("Very good. I am always in need of more optic nerves. Take this crafted bracer with my thanks.");
    quest::exp(25000);
    quest::summonitem(4177);
  }
  elsif (plugin::check_handin(\%itemcount, 13742 => 1, 10032 => 2)) { #greaves
    quest::say("Excellent! Here is your reward, you have earned it!");
    quest::exp(25000);
    quest::summonitem(4179);
  }
  elsif (plugin::check_handin(\%itemcount, 13698 => 1, 13699 => 1, 13738 => 1, 10033 => 1)) { #pauldron
    quest::say("Excellent! Here is your reward, you have earned it!");
    quest::exp(25000);
    quest::summonitem(4175);
  }
  elsif (plugin::check_handin(\%itemcount, 13746 => 1, 10035 => 3)) { #bp
    quest::say("Excellent! Here is your reward, you have earned it!");
    quest::exp(25000);
    quest::summonitem(4174);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: southkarana ID: 14073 NPC: Ulan_Meadowgreen

