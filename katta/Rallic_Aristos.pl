# The Acrylia Plans
# items: 31730, 31729

sub EVENT_SAY {

if($text=~/Hail/i){

quest::say("Well met $name! I am Rallic Aristos. Governor of trade and economy here in Katta Castellum. I know it sounds like a lot of parchment pushing and coin counting but maintaining good trade relations with the various Houses of Shadow Haven and the haggling Vah Shir of Shar Vahl is not as easy at it may sound. Then there is the issue of the [acrylia mines] in the Tenebrous Mountains.");

}

if($text=~/acrylia mines/i){

quest::say("The Tenebrous Mountains are rich with veins of the valuable acrylia ore. Unfortunately the mines were dug and controlled by a tribe of savage grimlings from the forests to the south. Negotiations have been attempted with the grimlings but to no avail. Several of the other governors and I have been developing a [plan] to take the mines or establish mines of our own. In either case the mines will have to be defended from attacks by the grimlings unless when placed in that predicament they finally resort to trade negotiations.");

}

if($text=~/plan/i){

quest::say("The full plans are not at my disposal but one of my concerns that may be instrumental in our success is the acquisition of grimling documents carried by a grimling courier who is seen frequently running from the forest to the mines. If one of the Validus Custodus attempts to obtain the runners pouch the grimlings will surely retaliate. if adventurers like yourselves obtained it however and quietly delivered it to me we may be able to move forward with our plans.");

}

if($text=~/required materials/i){
quest::say("The rest of the materials are a pelt from an owlbear of the highest quality, a silk cord made from shades, and a silk thread also made from shades.");

}



}
sub EVENT_ITEM {

if(plugin::check_handin(\%itemcount, 31730 => 1)){

quest::say("Excellent. The contents of the pouch shall be examined immediately. Take this pattern for a crafting a pack that will be sure to lighten the burden of its contents. I'm afraid I do not have the rest of the [required materials] at hand.");

quest::summonitem(31729); # Item: Rallic Pack Pattern
quest::faction(1561,5); # Faction: Concilium Universus
quest::faction(1483,-10); # Faction: Seru
quest::faction(1486,-10); # Faction: Heart of Seru
quest::exp(250);
quest::ding();
 }

}

#END of FILE Zone:katta  ID:160146 -- Rallic_Aristos.pl


