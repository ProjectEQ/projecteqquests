sub EVENT_SAY {

if($text=~/hail/i){

quest::emote("looks over you examining you from head to toe. 'Ye have the look of an adventurer. I have a tale to tell if you would like to hear it.'");

}

if($text=~/tale/i){

quest::say("Years ago I and Jilan were traveling around the far reaches of this land. One day we came upon an old vah shir who was injured in the mountains. He implored us to help him. Do you wish me to continue?");

}

if($text=~/continue/i){

quest::say("As I was saying this old vah shir required assistance.  We bound his wounds and he asked us to take his armor and give it to a Beastlord worthy of wearing it.  Are you a worthy beastlord?");

}

if($text=~/cap/i){

quest::say("For the cap you must prove your worth. Go gather up a sun jewel, a mark of feral spirits, an embedded copper figurine, and a frosted stone.");

}

if($text=~/tunic/i){

quest::say("For the tunic you must prove your worth. Go gather up a moon jewel, a mark of animal spirits, a silver gilded bracelet, and an embedded mithril figurine.");

}

if($text=~/sleeves/i){

quest::say("For the sleeves you must prove your worth. Go gather a star jewel, a mark of wild spirits, an embedded clay figurine, and a furrowed carving.");

}

if($text=~/leggings/i){

quest::say("For the leggings you must prove your worth. Go gather a cloud jewel, a mark of natural spirits, an embedded stone figurine, and a blue moonstone.");

}

if($text=~/mantle/i){

quest::say("For the mantle you must prove your worth. Go gather a sky jewel, a mark of wilderness, and an embedded platinum figurine.");

}

if($text=~/bracer/i){

quest::say("For the bracer you must prove your worth. Go gather a meteor jewel, a mark of animal training, and an embedded brass figurine.");

}

if($text=~/boots/i){

quest::say("For the boots you must prove your worth. Go gather an astral jewel, a mark of beast mastery, and an embedded gold figurine."); }

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 4488 => 1, 5921 => 1, 5927 => 1,  5928 => 1)){
quest::summonitem(3985);  #text needed? dunno...
}

elsif (plugin::check_handin(\%itemcount, 4489 => 1, 5929 => 1, 5922 => 1,  5923 => 1)){
quest::summonitem(3986);
}

elsif (plugin::check_handin(\%itemcount, 4490 => 1, 5925 => 1, 5924 => 1,  5926 => 1)){
quest::summonitem(3987);
}

elsif (plugin::check_handin(\%itemcount, 4491 => 1, 5930 => 1, 5931 => 1, 5932  => 1)){
quest::summonitem(3988);
}

elsif (plugin::check_handin(\%itemcount, 4492 => 1, 5933 => 1, 5934 => 1)){
quest::summonitem(3989);
}

elsif (plugin::check_handin(\%itemcount, 4493 => 1, 5935 => 1, 5936 => 1)){
quest::summonitem(3990);
}

elsif (plugin::check_handin(\%itemcount, 4494 => 1, 5937 => 1, 5938 => 1)){
quest::summonitem(3991);
}

} 

