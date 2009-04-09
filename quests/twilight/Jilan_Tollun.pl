sub EVENT_SAY {

if($text=~/Hail/i){

quest::say("Hello there. please leave me alone I would like some peace and quiet.'");
}

if($text=~/armor/i){
quest::say("amben must have told you about the old beastlord we came upon. So tell me are you a worthy beastlord?");
}

if($text=~/worthy beastlord/i){
quest::say("Then you must want the armor I have. I have the veil, cape, gloves, talisman, belt, and claws.");
}

if($text=~/belt/i){
quest::say("For the belt you must bring me a sky jewel, a mark of the wolf, an embedded steel figurine, and ancient wrappings.");
}

if($text=~/cape/i){
quest::say("For the cape you must bring me a moon jewel, a mark of the panther, an iridescent crystal, and an embedded bronze figurine.");
}

if($text=~/claw/i){
quest::say("For the claws you must bring me a meteor jewel, a mark of the bestial, an embedded adamantium figurine, and a roaring idol.");
}

if($text=~/glove/i){
quest::say("For the gloves you must bring me a star jewel, a mark of the alligator, and embedded electrum figurine.");
}

if($text=~/talisman/i){
quest::say("For the talisman you must bring me a cloud jewel, a mark of the shark, and an embedded silver figurine. ");
}

if($text=~/veil/i){
quest::say("For the veil you must bring me a sun jewel, a mark of the tiger, and an embedded wooden figurine.");
}


}

sub EVENT_ITEM
{

if (plugin::check_handin(\%itemcount, 4492 => 1, 5949 => 1, 5948 => 1,  5950 => 1)){
quest::summonitem(3996); #turnin message?
}

elsif (plugin::check_handin(\%itemcount, 4489 => 1,  5941 => 1, 5942 => 1,  5943 => 1)){
quest::summonitem(3993);
}

elsif (plugin::check_handin(\%itemcount, 4493 => 1, 5951 => 1,  5952 => 1, 5953 => 1)){
quest::summonitem(3997);
}

elsif (plugin::check_handin(\%itemcount, 4490 => 1, 5944 => 1,  5945 => 1)){
quest::summonitem(3994);
}

elsif (plugin::check_handin(\%itemcount, 4491 => 1, 5946 => 1,  5947 => 1)){
quest::summonitem(3995);
}

elsif (plugin::check_handin(\%itemcount, 4488 => 1, 5939 => 1,  5940 => 1)){
quest::summonitem(3992);
}

}



