# Siren Hunting
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Ahh! It is wonderful to see so many eager to explore this new land and help the Brotherhood! Please, make yourself at home. Feel free to let me know if you are interested in doing some [siren hunting]!"); 
}

if($text=~/what siren hunting/i){

quest::say("Well, there seems to be a strange form of siren that resides off the coast of this place. They seem similar to the potameids that can be found in the waters of Jaggedpine. These seem to be exceptionally fierce, however. Quite nasty! We discovered them performing the most heinous deeds to those caught unaware. They really are a [menace]."); 
}

if($text=~/what menace/i){

quest::say("Oh, you really don't want to trouble yourself with their perversions. You would do us a great favor by hunting them if you are so inclined. In fact, I am almost certain that we would [reward] such efforts.");
}

if($text=~/what reward/i){

quest::say("I have a lovely shield laying around! If you are the sort that can use one at all, you may like it. Now if you really want to set out to exterminate some, I would advise being careful. They undoubtedly can see much more efficiently in the water than you, not to mention that they are in their natural habitat. Bring me back a siren tongue, fin, and heart and perhaps we can reward you.");
}


}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 54090 => 1, 54089 =>1, 54088 => 1)) { # Siren Fin, Siren Heart, Siren Tongue

quest::say("Thank you very much! Here is that shield I promised you."); 
quest::exp(10000);
quest::summonitem(54091) # Shield of Coastal Purity

}

}
#END of FILE zone:natimbi ID:280046 -- Lorri_Stonesong.pl
