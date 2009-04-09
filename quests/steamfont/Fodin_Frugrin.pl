sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hello. $name. Have you ever peered beyond our little world? Somewhere out there in the vast darkness is a world filled with great technology and adventure. Our people should concentrate on reaching these distant worlds beyond the sparkling skies.");
  }
  if($text=~/Larkon sent me/i){
    quest::say("There is much more you must do for the Library of Mechanimagica before such things can be revealed to you.  Perhaps fetching minotaur horns and returning them to Professor Theardor will earn you membership to the Library of Mechanimagica.");
    quest::say("But I suppose if Larkon sent you that you truly wish to prove yourself, eh? You'll have to get your hands a bit dirty, though. Take this box and fill it with livers from those infected rats. We need them for research. Well go on. You can take a bath when you're done.");
    quest::summonitem(17923); #air tight box (container)
 }
}
#END of FILE Zone:steamfont  ID:56124 -- Fodin_Frugrin 

