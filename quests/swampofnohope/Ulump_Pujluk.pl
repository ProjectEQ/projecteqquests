sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Something come to talk to Ulump. Too much pain. Just go. It goes back to scratching and wiping at its muck and filth covered body."); 
}
if($text=~/What pain/i){
quest::say("Much pain. Much pain since tiny priest came to swamp. Found Ulump, once mighty warrior, and caught his soul in bottle. Twisted it and tied it to the earth. All day Ulump feels the corruption and pain of the earth beneath his feet."); 
}
if($text=~/What corruption/i){
quest::say("Corruption spread by priests of disease. It slides and moves just beneath the surface of the land. Ulump not able to hold on any more. If you stormwalker and trying to cleanse the land then you must kill Ulump. Kill him and take his essence and the three foci from the corrupted beasts to the filthy gnome who hurts the land. Ulump can feel him, far off near the large water."); 
}
}