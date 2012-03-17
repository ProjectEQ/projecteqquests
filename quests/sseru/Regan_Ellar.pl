sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, $name, as she fiddles absently with the ring on her finger as though it were a gift from someone who meant a great deal to her...");
  }
  if($text=~/rifkin/i) {
    quest::say("'Umm, who? I do not know anyone by that...' she trails off, unable to find the words. 'He... he failed the question. I didn't have anything to do with it, why would you ask me? On second thought, never mind, I would really rather not talk about it thank you very much. Good day to you $name.");
  } 
}

#END of FILE Zone:sseru ID:159107 -- Regar_Ellar