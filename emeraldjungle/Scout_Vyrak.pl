sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is a pleasure to meet you. but I do not have time to speak.  I am waiting on official word from Shar Vahl.  If you have been sent to assist me. please show me the Official Seal of the Khati Sha at this time.  If you are not such a person. please carry on with your business and leave me to tend to mine."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9031 =>1 )) {
    quest::say("Well met, $name, well met indeed I find comfort in the fact that the jungle permitted your passage to me! Maybe there is still hope we can stop this disturbance before any more damage can be done to the balance of the spirit realm I have spent several weeks tracking the corrupted spirit. It seems to have made a home of the ruins just south of here. The spirit no longer resembles he entity that it once was. It is quickly becoming something foul and savage. Let us hope that you are not too late.'
Scout Vyrak says 'Destroy the spirit's current form and you will be able to retrieve the implement which has befouled it. Once you gather that totem please return it to me and I will wrap it so that you may carry it in the case that you were given in Shar Vahl.");
quest::emote("You here a massive creature roar as if awakened from a deep sleep.");
   quest::spawn(94126,0,0,4162,1443,-45);
   
  }
  if (plugin::check_handin(\%itemcount, 9038 =>1 )) {
    quest::say("Excellent work, $name! Judging by the speed with which it altered that spirit, this totem must be extremely powerful. I've wrapped it, so you should be safe from its magic. Just be sure to keep it in the case. Once you have all of the totems, seal the case and make your way back to Shar Vahl. They will be waiting for you there. I'll continue to look for the person that perpetrated this vile act.");
    quest::summonitem(9031);
    quest::summonitem(9039);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:emeraldjungle  ID:6289 -- Scout_Vyrak 

