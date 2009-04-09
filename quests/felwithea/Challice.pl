sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You!  Remove yourself from my presence!  Do you not know to whom you speak?  My husband is a very powerful noble and if you do not do as I say. he will have your head!"); }
}
sub EVENT_ITEM {
	#Note handin:
	if($itemcount{14334} == 1){
		quest::say("Oh yes? Arantir? What a fool he was! the man gave me everything, but for all his intelligence, he could never understand why I was truly with him. It was for his power; he could do anything. But when he mysteriously lost it, he became just another toy. I never loved him. Return this ring to him. He will understand that I have no desire to see him again.");
		quest::faction(342, 30); #Truespirit
		quest::exp(100000);
		quest::summonitem(14335);
	}
}
#END of FILE Zone:felwithea  ID:61006 -- Challice 

