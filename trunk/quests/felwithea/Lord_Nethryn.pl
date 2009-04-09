sub EVENT_SAY { 
if($text=~/i am well/i){
quest::say("Excellent! It is quite a pleasant day. indeed. However. I am curious. and I do not mean [to pry]. but by what grace of Tunare have I the pleasure of your company? Perhaps you merely [travel]. or is it [me] you truly seek?");
}
if($text=~/i travel/i){
quest::say("A traveler then? Perhaps for adventure and fame. Indeed. I do remember those days. It has been. . . quite some time. so much that I can hardly remember. In any case. my reminiscence must be of no consequence to you. and I do not wish to keep you. Please. do be well and may Tunare's grace kindly guide you through your path.");
}
if($text=~/what realm/i){
quest::say("I am Lord Nethryn the Arbitrator. once a devout priest of Tunare. and now a most loyal servant. I once resided within the Realm of Heroes. but she has called upon me to [serve] again as I once did within my mortal form.");
}
if($text=~/what serve/i){
quest::say("There are five coins. five very specific coins. each of which contains a divine light and essence. Even the hand and eye of the most crafted rogue or artist cannot forge Honor. Insight. Gallantry. Tranquility. or Faith.");
}
if($text=~/what faith/i){
quest::say("There are five coins. five very specific coins. each of which contains a divine light and essence. Even the hand and eye of the most crafted rogue or artist cannot forge Honor. Insight. Gallantry. Tranquility. or Faith."); }
}
#END of FILE Zone:felwithea  ID:61066 -- Lord_Nethryn 

