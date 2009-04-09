# Kutin's Key
# created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Now what did I do with my key."); 
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 55612 => 1)) { # Kutin's Key

quest::say("You found my key! Where was it? Now how did it get there? No matter, you have returned it."); 
quest::summonitem(59794); # Potion of Transformation (Troll)
}

else{     
quest::say("I have no use for this.");    
plugin::return_items(\%itemcount);
}


}

#END of FILE zone:abysmal ID:279234 -- Kutin_Pyskar.pl

