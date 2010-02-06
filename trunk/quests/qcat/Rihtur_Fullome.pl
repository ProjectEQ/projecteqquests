sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, $name! I hope the trek into our shrine has not scarred you in any way. Our defenses have been increased lately. Many of the citizens have heard rumors about our shrine. I say it is all due to that [soldier].");
  }
  if($text=~/soldier/i) {
    quest::say("The soldier I refer to is Commander Kane Bayle. The supreme officer himself. Don't get me wrong. I trust Kane. He has quite a black heart. I just don't trust that girl, [Nerissa].");
  }
  if($text=~/nerissa/i) {
    quest::say("Nerissa Clothspinner. Her sister was a good friend of Kane's. When she left Qeynos to venture into the world, she asked Kane to watch over the girl. Now Kane tries to hide from this child the fact that he is allied with our church. I do not think he has hidden it well. I have told the others. but they do not believe me. I do not care. I have my own [plans].");
  }
  if($text=~/plans/i) {
    quest::say("Nerissa is well protected by Kane. She will no doubt attempt to inform someone of her suspicions, most likely her sister, Milea. You must find Milea Clothspinner and kill her. No word of our operations must leak out. Return with proof of Milea's death and we shall see to a reward.");
  }
}
#END of FILE Zone:qcat  ID:45088 -- Rihtur_Fullome