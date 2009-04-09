sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Arr!  Well. blow me down and hoist me mizzenmast!  Swab the fo'c'sle and kick the bosun!  Arrgh.  to the four winds with this!  I am cold. wet. hungry. shipwrecked. and bloody tired of playing at being a pirate.  Breezeboot is not really my name. but it will do for now.  I do not know how you got here. but you give me hope of escaping this frozen hell.  We have been shipwrecked here for weeks now. though that is a long story."); 
 }
if ($text=~/long story/i) {
quest::say("We were trying to make a good coastal map of Velious, you understand, and to do that, we needed to circumnavigate the continent. Figured we might find some treasure too. It was not an easy trip, but the boys I brought along are pretty good sailors, and they all know their business, unlike that group of pretend pirates back at the Iceclad landing. We were doing fine until a storm blew up, and ran us right into these rocks. Our port screw, or was that starboard, anyway, the one on the left, broke on the bottom, and we started shipping water, floodiing the boiler. There is no way we can repair the damage. So here we are - stuck!");
 }
if ($text=~/will help you/i) {
quest::say("Well, we will need lumber - a good bit of it. I saw some likely wrecks when we sailed up the Cobalt Scar, you might want to look there. We also need rope, a lot of it, to lash the logs together, at least one hundred feet. Finally, we need something we can use as a sail - I do not like the idea of trying to paddle all the way back. I am not sure what you can find for that, but it needs to be strong, light, and not pass much air. Gather all that up, and come see me. I think I might have a bit of plunder and booty I can part with, in payment.");
 }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 27264 => 1, 27263 => 1, 27262 => 1)) {
     quest::summonitem(27310);
      quest::exp(60000);
 }
 else {
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:westwastes  ID:120051 -- Breezeboot_Swordrattler 
