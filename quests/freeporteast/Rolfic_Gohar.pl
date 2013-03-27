sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("I am but a poor peddler of trinkets living amongst the rats and beggars of these slums. Perhaps you will purchase some of my wares and help a struggling merchant?");
	}
	if($text=~/forge/i) {
		quest::say("You can find forges all over freeport.");
	}
	if($text=~/dismal warrior breastplate/i) {
		quest::say("'To assemble a Dismal Warrior Breastplate you will need to obtain four bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Coyote Pelt, a Dune Tarantula Thorax, and a Dune Tarantula Abdomen in the Mail Assembly Kit.");
		quest::summonitem(19637);
	}
	if($text=~/dismal warrior helm/i) {
		quest::say("To assemble a Dismal Warrior Helm you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Coyote Pelt and two Desert Tarantula Eyes in the Mail Assembly Kit.");
		quest::summonitem(19631);
	}
	if($text=~/dismal warrior bracer/i) {
		quest::say("To assemble a Dismal Warrior Mail Bracer you will need to obtain a brick of crude iron and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Coyote Pelt and a Dune Spiderling Tibia in the Mail Assembly Kit.");
		quest::summonitem(19632);
	}
	if($text=~/dismal warrior gauntlets/i) {
		quest::say("To assemble Dismal Warrior Gauntlets you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Coyote Pelt and two Dune Spiderling Tarsi in the Mail Assembly Kit.");
		quest::summonitem(19633);
	}
	if($text=~/dismal warrior boots/i) {
		quest::say("To assemble Dismal Warrior Mail Boots you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Coyote Pelts, and two Dune Spiderling Hairs in the Mail Assembly Kit.");
		quest::summonitem(19632);
	}
	if($text=~/dismal warrior vambraces/i) {
		quest::say("To assemble Dismal Warrior Vambraces you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Coyote Pelt and two Desert Tarantula Patella in the Mail Assembly Kit.");
		quest::summonitem(19635);
	}
	if($text=~/dismal warrior greaves/i) {
		quest::say("To assemble Dismal Warrior Greaves you will need to obtain two bricks of crude iron and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Coyote Pelts and two Desert Tarantula Femurs in the Mail Assembly Kit.");
		quest::summonitem(19636);
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 19843 => 1)) { # Note to Rolfic Gohar
		quest::ding();
		quest::say("I see now we have similar interests. I will help you get outfitted in an affordable suit of armor to help you in your endeavors. You will need this Mail Assembly Kit to aid you in the construction of the armor. The materials required depend on the armor section you desire to craft. Do you plan to construct a [dismal warrior helm], a [dismal warrior bracer], [dismal warrior gauntlets], [dismal warrior boots], [dismal warrior vambraces], [dismal warrior greaves], or a [dismal warrior breastplate].");
		quest::summonitem("17124"); # Mail Assembly Kit
	}
	plugin::return_items(\%itemcount);
}

