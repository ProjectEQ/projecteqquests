sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings! It is good to see a new face out here. I am Tindo Frugrin, observer for the Eldritch Collective.");
  }
  if($text=~/lens/i) {
    quest::say("I was hoping you were not the one they sent. I have a slight problem. My brother Bidl Frugrin is holding the lens. He went to Kelethin for a little observation. He has been there for quite some time. I fear he has found the local tavern. He will no doubt spend the day in the forest and every night at the tavern.");
  }
}
#END of FILE Zone:steamfontmts  ID:448154 -- Tindo_Frugrin