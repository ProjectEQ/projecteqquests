sub EVENT_SAY {
  if ($text=~/plague knight boots/i) {
    quest::say("To assemble Plague Knight Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Cat Pelts, and two Clockwork Rat Belly Plates in the Mail Assembly Kit.");
    quest::summonitem(19634);
  }
  if ($text=~/plague knight bracer/i) {
    quest::say("To assemble a Plague Knight Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Cat Pelt and a Clockwork Rat Leg Section in the Mail Assembly Kit.");
    quest::summonitem(19632);
  }
  if ($text=~/plague knight breastplate/i) {
    quest::say("To assemble a Plague Knight Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Medium Quality Cat Pelt, a Clockwork Spider Thorax Plate, and a Clockwork Spider Abdomen Plate in the Mail Assembly Kit.");
    quest::summonitem(19637);
  }
  if ($text=~/plague knight gauntlets/i) {
    quest::say("To assemble Plague Knight Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Cat Pelt and two Clockwork Rat Back Plates in the Mail Assembly Kit.");
    quest::summonitem(19633);
  }
  if ($text=~/plague knight greaves/i) {
    quest::say("To assemble Plague Knight Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Low Quality Cat Pelts and four Clockwork Spider Leg Sections in the Mail Assembly Kit.");
    quest::summonitem(19636);
  }
  if ($text=~/plague knight helm/i) {
    quest::say("To assemble a Plague Knight Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Cat Pelt and two Clockwork Spider Eye Lenses in the Mail Assembly Kit.");
    quest::summonitem(19631);
  }
  if ($text=~/plague knight vambraces/i) {
    quest::say("To assemble Plague Knight Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Low Quality Cat Pelt and two Clockwork Spider Leg Sections in the Mail Assembly Kit.");
    quest::summonitem(19635);
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10987 => 1)) {
    quest::say("Hail $name! You must be one of Garret's new knights. Garret has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Knight Armor you are planning on assembling. Do you wish to craft a [plague knight helm], a [plague knight bracer], [plague knight gauntlets], [plague knight boots], [plague knight vambraces], [plague knight greaves], or a [plague knight breastplate].");
    quest::summonitem(17124);
  }
}