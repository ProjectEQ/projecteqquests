sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, good citizen! You are safe when you are near a sentinel of the High Guard. Feel free to rest and recuperate.");
  }
}
#END of FILE Zone:toxxulia  ID:414045 -- Sentinel_Flavius