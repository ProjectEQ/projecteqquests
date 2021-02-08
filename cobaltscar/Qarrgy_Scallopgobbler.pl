# items: 22823, 24874, 21004, 11635, 22814, 28515, 21009, 11589, 30059, 30060
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("sets down several large crustacean shells covered in foreign runes, then extends his large, coarse hands in a gesture of friendship.");
    quest::say("I am pleased to see friendly visitors to our villages. I am the head craftsman of the village. The crustacean shell armor worn by the warriors of our village was crafted by me and by my apprentices. I will craft other materials as well when they are available.");
  }
  if ($text=~/crustacean shell armor/i) {
    quest::say("It takes awhile to make each piece. It has to go through a long burning process to clean away all old meat and dirt. Then it needs shaping and etching with runes.");
  }
  if ($text=~/burning process/i) {
    quest::say("Usually I use a mixture made from the livers of barraccudas. Their liquids are very strong and make good burning liquid. If you want some you need to bring me two barraccuda livers.");
  }
  if ($text=~/other materials/i) {
    quest::say("I am able to craft dragon scale armor but it has been a long time since I have had the opportunity to do so for my people. What kind of scales do you wish for me to craft?");
  }
  if ($text=~/emerald dragon scale/i) {
    quest::say("I will craft an emerald dragonscale tunic for emerald dragon scales, ulthork tusks, and an unstained fine plate breastplate.");
  }
  if ($text=~/sea dragon scale/i) {
    quest::say("Should you slay Kelorek'Dar, the sea dragon, I would craft you a sea dragon bracer from his scales. All I ask for are the scales of the dragon, an ornately runed shell necklace, and an unstained bracer crafted of the metal you strange ones call fine steel.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 22823 => 1, 24874 => 1, 21004 => 1)) {
    quest::emote("skillfully crafts the Emerald Dragon Scales into a tunic, hands it to $name, and claps enthusiastically.");
    quest::summonitem(11635); # Item: Emerald Dragonscale Tunic
    quest::faction(432, 30); # Faction: Othmir
    quest::faction(431, -60); # Faction: Ulthork
    quest::exp(10000);
  }
  elsif (plugin::check_handin(\%itemcount, 22814 => 1, 28515 => 1, 21009 => 1)) {
    quest::emote("skillfully crafts the Sea Dragon Scales into a bracer, hands it to $name, and claps enthusiastically.");
    quest::summonitem(11589); # Item: Sea Dragonscale Bracer
    quest::faction(432, 30); # Faction: Othmir
    quest::faction(431, -60); # Faction: Ulthork
    quest::exp(10000);
  }
  elsif (plugin::check_handin(\%itemcount, 30059 => 2)) {
    quest::emote("claps enthusiastically and hands you your reward"); # Text made up
    quest::summonitem(30060); # Item: Bladder of Acidic Ooze
    quest::faction(432, 30); # Faction: Othmir
    quest::faction(431, -60); # Faction: Ulthork
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}

# Quest by mystic414
