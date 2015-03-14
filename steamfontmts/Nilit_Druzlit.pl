sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Eh? Eh?! Talk not now! My [creation] is running wild! Destroy it for me, please! If you do you can keep whatever parts you want from it.");
  }
  if($text=~/creation/i) {
    quest::say("Did you kill it yet? What? Bah! Yes, I made it. Nilit's clockwork it is. I made it to carry my toys to and from Ak'Anon but now it's gone wild and started attacking people. Please, destroy it!");
  }
}
#END of FILE Zone:steamfontmts  ID:448148 -- Nilit_Druzlit