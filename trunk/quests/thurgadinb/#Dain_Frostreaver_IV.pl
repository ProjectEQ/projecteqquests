sub EVENT_SAY {
  if ($text=~/hail/i) {
    # Signal Chamberlain
  }
  if ($text=~/Greetings and good fortune to you, honored Dain Frostreaver IV/i) {
    if ($faction >= 5) {
      quest::emote("seems to stare right into your soul with his one good eye. A chill runs down your spine.");
      # Signal Chamberlain
    }
    elsif ($faction <5 && $faction >= 3) {
      quest::emote("smiles at you and nods his head indicating he has been pleased with your progress.");
      # Signal Chamberlain
    }
    else {
      quest::say("Greetin's and good fortune to yerself, $race. Chamberlain Krystorf speaks highly of the deeds you have performed for our people and so I welcome you to my Keep. I ask you now to take up a most dangerous duty for our people. Would you accept such a challenge from the King of a people not your own?");
    }
  }
  if ($text=~/accept/i) {
    if ($faction < 3) {
      quest::emote("smiles at you with pride and says, 'Something told me you would, $name. For years upon years the plagues of King Tormax have been unleashed upon my people. And indeed it was also by Tormax's hand that me own father, Dain Frostreaver the Third was slain. My attempts at assassinating him have only met with failure, and our forces, while strong, are not yet mighty enough to assault Kael Drakkel. Therefore I have ye and yer companions as my last hope, $name. Kill that bastard who calls himself King Tormax... and bring me his head!");
    }
  }
}