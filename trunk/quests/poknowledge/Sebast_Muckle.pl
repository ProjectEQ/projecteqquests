sub EVENT_ITEM {
 # Handin: Globe of Discordant Energy & Fistwraps of Celestial Discipline
 if(plugin::check_handin(\%itemcount, 47100 => 1, 61025 => 1)){
  # Monk Epic 2.0 [End]
  quest::say("I see you have found a way to bring order and balance back to the world. You should have also learned of the need for such evils in the world. There cannot be good without evil just as there cannot be truth without deception. I will take the discordant globe now with your fistwraps and make something wonderful for you from them. They will help guide you through the most difficult of times as a reminder of the knowledge you now possess for without the balance between good and evil we are but lost.");
  # Summon: Transcended Fistwraps of Immortality
  quest::summonitem(67742);
 }
}


# End of File