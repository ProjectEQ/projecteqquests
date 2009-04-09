sub EVENT_SAY {
  if ($text=~/plague raiser helm/i) {
    quest::say("To assemble a Plague Raiser Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Coyote Pelt and two Yellow Recluse Eyes in the Mail Assembly Kit.");
    quest::summonitem(19631);
  }
  if ($text=~/plague raiser gauntlets/i) {
    quest::say("To assemble Plague Raiser Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Coyote Pelt and two Clockwork Spider Mesh in the Mail Assembly Kit.");
    quest::summonitem(19633);
  }
  if ($text=~/plague raiser bracer/i) {
    quest::say("To assemble a Plague Raiser Mail Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Coyote Pelt and a Clockwork Spider Mesh in the Mail Assembly Kit.");
    quest::summonitem(19632);
  }
  if ($text=~/plague raiser boots/i) {
    quest::say("To assemble Plague Raiser Mail Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Coyote Pelts, and two Clockwork Spider Mesh in the Mail Assembly Kit.");
    quest::summonitem(19634);
  }
  if ($text=~/plague raiser vambraces/i) {
    quest::say("To assemble Plague Raiser Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Low Quality Coyote Pelt and three Clockwork Spider Mesh in the Mail Assembly Kit.");
    quest::summonitem(19635);
  }
  if ($text=~/plague raiser greaves/i) {
    quest::say("To assemble Plague Raiser Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Low Quality Coyote Pelts and three Clockwork Spider Mesh in the Mail Assembly Kit.");
    quest::summonitem(19636);
  }
  if ($text=~/plague raiser breastplate/i) {
    quest::say("To assemble a Plague Raiser Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Coyote Pelt, a Clockwork Spider Thorax Plate, and two Ebon Drake Wings in the Mail Assembly Kit.");
    quest::summonitem(19637);
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10989 => 1)) {
    quest::say("Hail Clinical! You must be one of Derthix new disciples. Derthix has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Raiser Armor you are planning on assembling. Do you wish to craft a [plague raiser helm], a [plague raiser bracer], [plague raiser gauntlets], [plague raiser boots], [plague raiser vambraces], [plague raiser greaves], or a [plague raiser breastplate].");
    quest::summonitem(51380);
  }
}
