sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Greetings. May I help you?"); }

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 5571 => 1)) {
quest::say("Where did you get this?! I have been looking for just this kind of map for a very long time! Hmmm, I know, how about I show you how to improve those claws of yours!");
quest::say("In order to improve them, I need you to take this Stitching Pack, unless you already have one, and this stone and make two leather straps. Once you have them, give me them along with your claws and I will work my magic!");
quest::say("Use only the very best rockhopper hide you can find along with that stone, and you will have those strips in no time!");
quest::summonitem("17237");
quest::summonitem("5572");
}
if(plugin::check_handin(\%itemcount,5581 => 2, 3673 => 1, 3674 => 1)) {
quest::emote("takes the leather straps from you and begins to make quick, deft adjustments to the claws. Soon, she hands them back to you, firmly reinforced by the leather straps.");
quest::say("There you go! I see you had little trouble gathering the straps. Perhaps you could help a friend of mine in Hollowshade Moors. Here, take this note and deliver it to Rittuh Purric. She should be at one of the outposts, though I couldn't tell you which one. Good luck, $name!");
quest::emote("hands you a folded note.");
quest::summonitem("5574");
quest::summonitem("5575");
quest::summonitem("5573");
plugin::return_items(\%itemcount);
quest::exp(2500);
}
}
#End of FILE Zone:sharvahl  ID:155061 -- Kery_Miann

