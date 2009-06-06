sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("If you wish to stay here by all means go ahead. Most of the animals who roam in this area are afraid of fire. They tend to stay away from it, but the courageous ones do tend to get close. And they're always venturing into the [ponds].");
  }
}
#END of FILE Zone:dawnshroud  ID:Not_Found -- Faulen_Hein