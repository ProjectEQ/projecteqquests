sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Good day to you! Be careful in the city of Qeynos. [Rumors] of corruption may be true. Believe me. I wish my [sister] were here to help.");
}
if($text=~/sister/i){
quest::say("My sister is in the Karanas. She is a warrior. Her name is Milea. I really need her. Would you please deliver a note to her? You look able-bodied enough for the job.");
}
if($text=~/deliver a note/i){	
	if ($ulevel > 65){quest::say("I cannot discuss such things with a person as young to the world as you are."); }
	if ($ulevel > 65){quest::say("I cannot trouble a person of your stature with such trivial talk."); }
	if ($ulevel >= 4 && $ulevel <= 65){quest::say("Here you go then, brave adventurer. Godspeed to you. ");
	quest::summonitem("18801"); }	
}
if($text=~/rumors/i){
quest::say("I have heard that a few of the Qeynos merchants and guards are not very happy with the current state of the city. Taxes are too high and many of the guards have been sent to the outlands. leaving Qeynos vulnerable to attack. I do not feel the same way. but I fear these few may become many. I [fear for my life].");
}
if($text=~/fear for your life/i){
quest::say("During a late night stroll by the pond in north Qeynos I spied a guard carrying a very large carpet on his shoulders. He approached the pond's edge and unrolled the carpet, the body of another guard rolled out and began to moan. The other guard grabbed for a long spear like weapon from his back. He drove the weapon into the man and pushed him into the pond, I screamed. He turned to me and I ran. I do not think he gave chase, too bad, he would not like to run into my [guardian] at home. I tolr my guardian and we both went to the pond and saw no body. He believes I was drinking too much wine. I do not drink. Now I fear for my life when I am in the streets of Qeynos.");
}
if($text=~/guardian/i){
quest::say("When my big sister left Qeynos for adventure, she left me in the hands of her old time friend Kane Bayle. Yes, the commander of the Qeynos Guards is my guardian. You would think I would be safe. Every time I tell him the rumors I hear he just ignores me. He is too busy I guess."); }
}
sub EVENT_ITEM { 
if ($itemcount{13302} == 1 ){	
quest::summonitem("18797"); #Noneexistent='Tattered Note','Astaed Werner,    Please reward this good person. They have eased my pain by contacting my sister, Milea, for me.        Nerissa Clothspinner'
quest::givecash("0","20","0","0");
quest::faction("Not_Found","1");
quest::faction("10108","-1");
quest::faction("Not_Found","1");
quest::faction("10113","1");
quest::faction("10101","1");
quest::exp("300"); }
}
#END of FILE Zone:qeynos2  ID:2052 -- Nerissa_Clothspinner 

