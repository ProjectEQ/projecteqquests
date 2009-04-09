sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, friend, and welcome to the Mermaid's Lure.  Here, we sell fishing supplies and some imported goods from far-off lands.  And, if you've got a few minutes. I could even tell you a [story] or two.");
}
if($text=~/what story/i){
quest::say("Stories?  Stories?  I saw more adventure before I was ten years tall than you'll see in your whole miserable existence.  I've been everywhere, [Odus], [Faydwer], [Kunark]. . .  You name it, and I can tell ya a little something 'bout it. . .  If you buy me a sip of brandy, of course!");
}
if($text=~/what odus/i){
quest::say("You haven't lived until you've seen Odus. Erud was the first human to cross the sea, and he founded the great city of Erudin.  The trade routes from here to Odus are busy and prosperous, but can also be very dangerous.");
}
if($text=~/what faydwer/i){
quest::say("I call Faydwer the home of the little people.  They say the continent was named by the high elves when they landed on its shores long ago.  I've even heard tales of an ancient elven vampire who lives there. . .  Just another Felwithe legend, I'll bet!");
}
if($text=~/what kunark/i){
quest::say("Even I can't tell you much about that continent.  Kunark is a tough place, populated by even tougher creatures.  I hear the high elves of Faydwer have been trying for years to establish a small port on Kunark's hostile shores."); }
}
#END of FILE Zone:qeynos  ID:1109 -- Captain_Rohand 

