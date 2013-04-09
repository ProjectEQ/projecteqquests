sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Pleasure to meet you.  Keep your eye out for the ship.  You don't want to miss it."); 
  }
  if ($text=~/mudtoes/i) {
    quest::say("Mudtoes!! I have heard tales of that foul clan of ogres. A few passengers aboard the ships have claimed to have seen one of them, off and on, amongst the pirates in the Ocean of Tears!!");
  }
}

#END of FILE Zone:butcher  ID:68064 -- Glorin_Binfurr 

