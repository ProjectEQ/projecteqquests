# Part of SK Epic 1.0

sub EVENT_SPAWN {
  quest::say("Young one, you cannot fathom how long it has been since I breathed air and felt flesh on my bones. I told you I would show you a weapon that would make you the most powerful of your kind. I said nothing of giving it to you. Feast your eyes on Innoruuk's Curse, mortal! Thank you for your service.");
}

sub EVENT_DEATH {
  quest::spawn2(74089, 0, 0, 28.1, 1.4, 7, 192.5); #Marl Kastane
}

# Quest by mystic414