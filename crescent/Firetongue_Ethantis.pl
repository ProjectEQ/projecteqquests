sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("There is no such thing as too much study and learning! I feel we've only just begun to command the true power of fire, ice and magic and even teleportation. Any who feel they know all there is to know are fools!");
  }
}

sub EVENT_ITEM {
  if (($class eq "Wizard") && (plugin::check_handin(\%itemcount, 58657 => 1))) { #Crescent Reach Guild Summons
    quest::say("Ah, you are interested in the destructive power of the elements? Or perhaps you wish to master teleportation? You've come to the right place! As guildmaster of The Arcane Alliance, I can help train you in the basics. Take this robe as a gift from our guild. May it guard you well. You might want to speak to Innkeeper Fathus and Initiate Dakkan for some work. Udra, young wizard.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58761); #The Arcane Alliance Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}