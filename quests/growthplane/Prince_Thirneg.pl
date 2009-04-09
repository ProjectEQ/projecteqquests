sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Salutations! I am the Prince of the Tunarean Court! What brings you to this most sacred of all Tunares blessed creations?");
  }
  if ($text=~/Lady Gelistial/i) {
    quest::say("Gelistial is a very wise Lady. She does well in her duties to the court as well as the duties to her people. Unfortunately the weight of her responsibility prevents us from meeting as often as I would like.");
  }
  if ($text=~/Lithiniath/i) {
    quest::say("Ahh..Lithiniath, the first of the black unicorns, cursed by Fizzlethorpe Bristlebane to spread madness and delusions. Lithiniath is not evil, but his lawful magical nature has been replaced with a chaotic reflection of it that has twisted his mind. Lithiniaths physical form can not survive the removal of the chaotic magical nature. The only cure for Lithiniath is death and rebirth into a lawful vessel.");
  }
}