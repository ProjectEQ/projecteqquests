# Bertoxxulous cleric quest armor
#
# correct reward dialogue missing for pestilence priest mace hand in

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("The dead are watching you young one, yet you are safe under their otherworldly gaze. Is there something I can do for you?");
  }
  if ($text=~/gauntlet/i) {
    quest::say("To assemble pestilence priest gauntlets you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Large King Snake Skin and two Gnoll Finger Bones in the Mail Assembly Kit.");
    quest::summonitem(19633);
  }
  if ($text=~/boot/i) {
    quest::say("To assemble pestilence priest boots you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Large King Snake Skins, and two Gnoll Foot Bones in the Mail Assembly Kit.");
    quest::summonitem(19634);
  }
  if ($text=~/bracer/i) {
    quest::say("To assemble a pestilence priest bracer you will need to obtain a brick of crude iron and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Large King Snake Skin and a Gnoll Ulna Bone in the Mail Assembly Kit.");
    quest::summonitem(19632);
  }
  if ($text=~/helm/i) {
    quest::say("To assemble a pestilence priest helm you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Large King Snake Skin and a Gnoll Skull in the Mail Assembly Kit.");
    quest::summonitem(19631);
  }
  if ($text=~/greaves/i) {
    quest::say("To assemble pestilence priest greaves you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Giant King Snake Skins and two Gnoll Tibia in the Mail Assembly Kit.");
    quest::summonitem(19636);
  }
  if ($text=~/vambrace/i) {
    quest::say("To assemble pestilence priest vambraces you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Giant King Snake Skin and two Gnoll Humerus Bones in the Mail Assembly Kit.");
    quest::summonitem(19635);
  }
  if ($text=~/breastplate/i) {
    quest::say("To assemble a pestilence priest breastplate you will need to obtain four bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Giant King Snake Skin, a Gnoll Sternum, and a Gnoll Ribcage in the Mail Assembly Kit.");
    quest::summonitem(19637);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20207 => 1)) {
    quest::say("Well met young disciple of Bertoxxulous. Perhaps one day you shall serve the Plague Lord in his realm, but for now you will serve the Bloodsabers, his mortal agents on Norrath. The armor you seek must be assembled using this Mail Assembly Kit. The materials necessary to construct the armor vary depending on the piece being crafted. Do you wish to craft [Gauntlets] of the Pestilence Priests, [Boots] of the Pestilence Priests, a [Bracer] of the Pestilence Priests, a [Helm] of the Pestilence Priests, [Greaves] of the Pestilence Priests, [Vambraces] of the Pestilence Priests, or a [Breastplate] of the Pestilence Priests?");
    quest::summonitem(17124);
  }
  elsif (plugin::check_handin(\%itemcount, 20199 => 1, 19946 => 1)) {
    quest::say("Well done, $name. Now go, spread the gifts of the Plague Lord upon the world.");
    quest::exp(15000);
    quest::summonitem(20261);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: qcat ID: 45074 NAME: Torin_Krentar

