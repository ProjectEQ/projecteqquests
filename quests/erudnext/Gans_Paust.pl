sub EVENT_SAY { 
if ($text=~/what of your brother/i){
        quest::say("What? How do you know fo my brother? Ahh I assume Breya told you. He's been gone for quite some time with no word sent on his progress or his wellbeing. I need to find someone to [check on him]."); 
 }
 if ($text=~/check on him/i) {
   quest::say("Thank you, adventurer. He's one of our people's most knowledgeable geologists and has left to survey an island out in Erud's Crossing. He was sending monthly reports until two weeks ago when his report never showed up. I'm worried something may have happened to him. Take this note to Yelesom and bring back something to assure me of his safety. A reward fitting a Deepwater Knight shall be yours upon your success.");
   quest::summonitem(18173);
 }
}
sub EVENT_ITEM { 
	if ($item1=="18724"){quest::say("Yes. welcome friend! Here is your guild tunic. You'll make a fine addition to the Deepwater Knights. Go see Dleria. she will get you started in your studies.");
quest::summonitem("13544");
quest::exp("100"); }
if (plugin::check_handin(\%itemcount, 1771 => 1)) {
  quest::say("Excellent! Thank you for checking on my brother, I am glad to hear that he is well.  Here is something that shall help you on your way");
  quest::summonitem(1763);
}
}
#END of FILE Zone:erudnext  ID:98061 -- Gans_Paust 

