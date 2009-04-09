sub EVENT_SAY { 
if($text=~/bravefoot helm/i){
quest::say("To assemble a Bravefoot Helm you will need to obtain two bricks of crude iron ore and smelt them in a [forge] with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Wolf Pelt and a Large Yellowjacket Tergite in the Mail Assembly Kit.");
quest::summonitem("19631");
}
if($text=~/what forge/i){
quest::say("There is a forge at the Tagglefoots Farm near the vegetable stand and the main house of the farm.");
}
if($text=~/bravefoot mail bracer/i){
quest::say("To assemble a Bravefoot Mail Bracer you will need to obtain a brick of crude iron ore and smelt it in a [forge] with a Water Flask and this Crude Bracer Mold. Once that is done. combine the Crude Iron Bracer with a Ruined Wolf Pelt and a Large Yellowjacket Sternite in the Mail Assembly Kit.");
quest::summonitem("19632");
}
if($text=~/bravefoot gauntlets/i){
quest::say("To assemble Bravefoot Gauntlets you will need to obtain two bricks of crude iron ore and smelt them in a [forge] with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Wolf Pelt and two Large Yellowjacket Tarsi in the Mail Assembly Kit.");
quest::summonitem("19633");
}
if($text=~/bravefoot vambraces/i){
quest::say("To assemble Bravefoot Vambraces you will need to obtain two bricks of crude iron ore and smelt them in a [forge] with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Wolf Pelt and two Giant Yellowjacket Tergites in the Mail Assembly Kit.");
quest::summonitem("19635");
}
if($text=~/bravefoot greaves/i){
quest::say("To assemble Bravefoot Greaves you will need to obtain two bricks of crude iron ore and smelt them in a [forge] with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Wolf Pelts and two Giant Yellowjacket Sternites in the Mail Assembly Kit.");
quest::summonitem("19636");
}
if($text=~/bravefoot breastplate/i){
quest::say("To assemble a Bravefoot Breastplate you will need to obtain four bricks of crude iron ore and smelt them in a [forge] with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Medium Quality Wolf Pelt and a Giant Yellowjacket Thorax in the Mail Assembly Kit.");
quest::summonitem("19637");
}
if($text=~/bravefoot mail boots/i){
quest::say("To assemble Bravefoot Mail Boots you will need to obtain two bricks of crude iron ore and smelt them in a [forge] with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Wolf Pelts. and two Giant Yellowjacket Tarsi in the Mail Assembly Kit.");
quest::summonitem("19634"); }
}
sub EVENT_ITEM { 
if(plugin::check_handin(\%itemcount, 19628 => 1)){
quest::say("Pleased to meet you $name! You must be one of Kayas new trainees. Kaya has asked me to help get you outfitted in a suit of armor to protect you from the vile weapons of Rivervales foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Bravefoot Mail armor you are planning on assembling. Do you wish to craft a [bravefoot helm]. a [bravefoot mail bracer]. [bravefoot gauntlets]. [bravefoot mail boots]. [bravefoot vambraces]. [bravefoot greaves]. or a [bravefoot breastplate].");
quest::summonitem(17124); 
 }
 plugin::return_items(\%itemcount); # return unused items
}
#END of FILE Zone:rivervale  ID:19047 -- Jimji_Bottletoe 