sub EVENT_SAY { 
	if($class=~/paladin/i && ($race=~/froglok/i || $race=~/high elf/i || $race=~/half elf/i)){
		if($text=~/Hail/i){
			quest::say("Hail friend. I am Seria Woodwind of the Royal Order of the Koada'Vie, the defenders of Felwithe. I assist young Koada'Dal that are called into Tunare's service as a paladin in learning the ways of the Koada'Vie so that one day they too may bear that noble title. Do you [wish to become a member] of the Koada'Vie?");
		}
		if($text=~/wish to become a member/i){
			quest::say("As a defender of Felwithe you will be required to face much of the evil that inhabits the lands of Norrath. We do not sit idle and wait for the enemy to arrive at our gates before taking action towards the safety of our citizens. Every Koada'Vie initiate should acquire a [suit of armor] to aid in protecting themselves from the weapons of our [enemies].");
		}
		if($text=~/enemies/i){
			quest::say("There are sinister creatures in Norrath that threaten the safety and prosperity of the Koada'Dal. The Crushbone Clan of Orcs often emerge from their citadel to the North to murder and pillage the Fier'Dal and Koada'Dal. hoping to expand their territory into the Faydarks. The Arboreans. a species of destructive sentient weeds has returned from ages of slumbering beneath the soil of the Faydarks. Despite these evil forces that are close to our home the greatest threat to both the Koada'Dal and the Fier'Dal are the twisted and wicked Teir'Dal. the dark elf children of Innoruuk.");
		}
		if($text=~/suit of armor/i){
			quest::say("You require this special Mail Assembly Kit in order to fashion your Felwithe Defender's Armor. The materials necessary for the armor's construction vary according to the piece you are attempting to craft. Once you have been properly outfitted return to me and I will provide you with [further instruction]. Do you plan on crafting [Felwithe Defender Gauntlets], [Felwithe Defender Boots], an [Felwithe Defender Bracer]. an [Felwithe Defender Helm], [Felwithe Defender Greaves], [Felwithe Defender Vambraces], or an [Felwithe Defender Breastplate]?"); 
			quest::summonitem("17124");
		}
		if($text=~/felwithe defender gauntlets/i){
			quest::say("To assemble felwithe defender gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold.  Once that is done combine the Crude Bronze Gauntlets with a Large Sylvan Bat Fur and two Giant Wasp Worker Tarsi in the Mail Assembly Kit.");
			quest::summonitem("19633");
		}
		if($text=~/felwithe defender boots/i){
			quest::say("To assemble felwithe defender boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Large Sylvan Bat Fur and two Giant Wasp Worker Tarsi in the Mail Assembly Kit.");
			quest::summonitem("19634"); 
		}
		if($text=~/felwithe defender bracer/i){
			quest::say("To assemble a felwithe defender bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Large Sylvan Bat Fur and a Giant Wasp Drone Sternite in the Mail Assembly Kit.");
			quest::summonitem("19632");
		}
		if($text=~/felwithe defender helm/i){
			quest::say("To assemble a felwithe defender helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Large Sylvan Bat Fur and a Giant Wasp Worker Tergite in the Mail Assembly Kit.");
			quest::summonitem("19631");
		}
		if($text=~/felwithe defender greaves/i){
			quest::say("To assemble felwithe defender greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Giant Sylvan Bat Furs and two Giant Wasp Warrior Sternites in the Mail Assembly Kit.");
			quest::summonitem("19636");
		}
		if($text=~/felwithe defender vambraces/i){
			quest::say("To assemble felwithe defender vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace mold. Once that is done combine the Crude Bronze Vambraces with a Giant Sylvan Bat Fur and two Giant Wasp Warrior Tergites in the Mail Assembly Kit.");
			quest::summonitem("19635"); }
		if($text=~/felwithe defender breastplate/i){
			quest::say("To assemble a felwithe defender breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Giant Sylvan Bat Fur, and a Giant Wasp Warrior Thorax in the Mail Assembly Kit.");
			quest::summonitem("19637");
		}
		if($text=~/further instruction/i){
			quest::say("Our diviner in the Keepers of the Art have discovered that a Teir`Dal agent of the Ebon Mask, the spies and assassins of the Teir`Dal has been lurking around the Faydarks and communicating intelligence to the orcs of Clan Crushbone. We believe the spy can be lured out of hiding if his primary orc contact, a crushbone centurion by the name of Relgle. is eliminated on route to their rendezvous location. Find this Centurion Relgle, slay him for his crimes against the Koada`Dal, then do the same to his Teir`Dal ally. Bring me both their heads when the deed is done.");
		}
	}
	else {
		if($text=~/Hail/i){
			quest::say("Hail friend. I am Seria Woodwind of the Royal Order of the Koada'Vie, the defenders of Felwithe. I assist young Koada'Dal that are called into Tunare's service as a paladin in learning the ways of the Koada'Vie so that one day they too may bear that noble title.");
		}
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 20288 => 1, 20289 => 1)){
		quest::say("Good work $name.  King Tearis Thex and the Royal Order of the Koada'Vie shall be pleased.  Take the Dull Felwithe Defenders Sword to a forge and sharpen it with a sharpening stone.  It may take you several attempts if you are unfamiliar with the process.  Once that is accomplished bring me the Sharp Felwithe Defenders Sword, a Pristine Forest Drakeling Scale, and an Arborean Amber and I will put the finishing touches on the weapon.");
		quest::summonitem("20295");
	}
	elsif(plugin::check_handin(\%itemcount, 20299 => 1, 20271 => 1, 20274 => 1)){
		quest::emote("fashions a grip from the pristine forest drakeling scales, fastens the arborean amber to the pommel of the hilt and polishes the blade of the sword with a luminescent substance.");
		quest::say("Here is your new weapon young defender. May it serve you well in your service to the Koada'Vie.");
		quest::summonitem("20329");
		quest::faction(43,10); #Clerics of Tunare
		quest::faction(178,9); #King Tearis Thex
		quest::faction(8,8); #Anti-Mage
		quest::exp(75000); #Give ~2 bubbles of exp at level 10
	}
	plugin::return_items(\%itemcount);
}
