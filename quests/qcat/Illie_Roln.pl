sub EVENT_SAY {
  if ($text=~/gauntlets/i) {
    quest::say("To assemble scourge warrior gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Wolf Pelt and two Gnoll Finger Bones in the Mail Assembly Kit.");
    quest::summonitem(19633);
  }
  
  if ($text=~/boots/i) {
    quest::say("To assemble scourge warrior boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Wolf Pelts, and two Gnoll Foot Bones in the Mail Assembly Kit.");
    quest::summonitem(19634);
  }
  
  if ($text=~/bracers/i) {
    quest::say("To assemble a scourge warrior bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Wolf Pelt and a Gnoll Ulna Bone in the Mail Assembly Kit.");
    quest::summonitem(19632);
  }
  
  if ($text=~/helm/i) {
    quest::say("To assemble a Scourge Warrior Helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Wolf Pelt and a Gnoll Skull in the Mail Assembly Kit.");
    quest::summonitem(19631);
  }
  
  if ($text=~/greaves/i) {
    quest::say("To assemble scourge warrior greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Wolf Pelts and two Gnoll Tibia in the Mail Assembly Kit.");
    quest::summonitem(19636);
  }
  
  if ($text=~/vambraces/i) {
    quest::say("To assemble scourge warrior vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Wolf Pelt and two Gnoll Humerus Bones in the Mail Assembly Kit.");
    quest::summonitem(19635);
  }
  
  if ($text=~/breastplate/i) {
    quest::say("To assemble a scourge warrior breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Medium Quality Wolf Pelt, a Gnoll Sternum, and a Gnoll Ribcage in the Mail Assembly Kit.");
    quest::summonitem(19637);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20205 =>1 )) {
    quest::say("Ah, so you are in need of a suit of armor fitting a young scourge warrior of the Bloodsabers. I will assist you. You will use this Mail Assembly Kit to construct the pieces of armor. Each piece will require different materials for its proper construction. Do you seek to assemble [Gauntlets of the Scourge Warrior], [Boots of the Scourge Warrior], a [Bracer of the Scourge Warrior], a [Helm of the Scourge Warrior], [Greaves of the Scourge Warrior], [Vambraces of the Scourge Warrior], or a [Breastplate of the Scourge Warrior]?");
    quest::summonitem(17124);
  }
  
  if (plugin::check_handin(\%itemcount, 20177 =>1, 19946 =>1 )) {
    quest::say("Excellent work.  Use this sword to further our mission");
    quest::summonitem(20262);
    quest::exp(100);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}