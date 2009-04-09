# Chef Chowderly's Award-Winning Recipes
# created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){
quest::say("All these dirty dishes stinking up the place."); 
}

}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 55523 => 1)) { # Note to Rellix

quest::say("A note from Chef Chowderly, eh? I haven't heard from him in some time. Hope he is doing well.' Rellix reads the note. 'I do happen to have some spare dishes. Here, take them."); 
quest::summonitem(55524); # Case of Dishes
quest::exp(5000);
}

}


#END of FILE zone:rivervale ID:19117 -- Rellix.pl

