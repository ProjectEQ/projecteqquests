sub EVENT_SAY {
     if($text=~/Hail/i){
       quest::say("Peace to you, $name.  I see that you have come far along the path of tranquility and enlightenment.  Do you wish to test yourself further, and perhaps complete the path you started on so long ago?");
       }
      if(($text=~/tranquility and enlightenment/i) && ($class eq "Monk")){
        quest::say("Choose you path. Wu or Ton Po");
        }
      if(($text=~/wu/i) && ($class eq "Monk")){
        quest::say("I shall summon them for you");
        quest::spawn2(71097,0,0,660.0,1332.3,-766.9,189.9);
        quest::depop();
        }
      if(($text=~/ton po/i) && ($class eq "Monk")){
        quest::say("I shall summon them for you");
        quest::spawn2(71096,0,0,660.0,1315.0,-766.9,189.9);
        quest::depop();
        }
}

#END of FILE Zone:airplane  ID:2582 -- Holwin 




