# Karg Icebear
# Location:everfrost - Everfrost Peaks
# NPCID: 30130
# SpawngroupID: 30011 - 33% Chance of spawning
# Quests:
#   Polar Bear Cloak - by Darkonig
#   Werewolf Skin Cloak - by Darkonig
#   Lupine Claw Gauntlets - by Darkonig

sub EVENT_SAY {

  if ($text=~/hail/i) {
    quest::say("Hail, traveller! I am Karg of Clan Icebear, lone hunter of the Everfrost Peaks. Have you seen any polar bears about?");
  }

  elsif ($text=~/yes/i) {
    quest::say("I hunt polar bears and furnish cloaks from their [pelts]. They keep you warm in this cold weather.");
  }

  elsif ($text=~/pelt/i) {
    quest::say("Have you some polar bear pelts? You know I can furnish warm cloaks from them, and for you I will do it for the measly sum of 5 platinum pieces.");
  }

  elsif ($text=~/werewolf/i) {
    quest::say("Werewolf?! I have not seen a werewolf in years. Have you slain one and collected its [skin] or [claws]?");
  }

  elsif ($text=~/skin/i) {
    quest::say("You have managed to procure a werewolf skin?? Amazing! Well then, I will let you know that for a fee of 100 platinum, I can craft a hearty cloak for you if you leave the skin and the coin with me.");
  }

  elsif ($text=~/claw/i) {
    quest::say("Oh, a werewolf claw? If you were to give me the claw and 75 platinum, I could craft excellent gauntlets.");
  }

}

sub EVENT_ITEM {

  my $cash = $platinum * 1000 + $gold * 100 + $silver * 10 + $copper;

# Quest Polar Bear Cloak
# Items Needed:
#   5 plat
#   13761 Polar Bear Skin
# Items Returned
#   2912 Polar Bear Cloak

  if ($cash == 5000 && $itemcount{13761} == 1) {
    quest::summonitem(2912);
  }

# Quest Werewolf Skin Cloak
# Items Needed:
#   100 plat
#   13714 Werewolf Pelt
# Items Returned:
#   2401 Werewolf Skin Cloak

  if ($cash == 100000 && $itemcount{13714} == 1) {
    quest::summonitem(2401);
  }

# Quest Lupine Claw Gauntlets
# Items Needed:
#   75 plat
#   13715 Werewolf Claws
# Items Returned:
#   2402 Lupine Claw Gauntlets

  if ($cash == 75000 && $itemcount{13715} == 1) {
    quest::summonitem(2402);
  }

}

# End of Karg_Icebear
