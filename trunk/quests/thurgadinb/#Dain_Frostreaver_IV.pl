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

sub EVENT_ITEM {
#Handin for the 9th ring. Needs correct dialogue
  if(plugin::check_handin(\%itemcount, 1500 => 1) && $faction == 1) {
    quest::say("%t, you have done a great service to my people. I had not imagined the treachery had run so deeply within our ranks. Here. Take this ring as your reward. From this day forth, you shall be known as the Hero of the Coldain. Take my Dirk as well, and if you wish to further aid us in our cause, then return it to me.");
    quest::summonitem(30369); #9th ring
    quest::summonitem(1465); #dirk of the Dain
    quest::faction(49,50); #coldain
    quest::faction(67,50); #Dain
    quest::faction(188,-50); #Kromrif
    quest::faction(189,-50); #Kromzek
    quest::exp(4000000);
  }
  #Tormax's head
  elsif(plugin::check_handin(\%itemcount, 30516 => 1) && $faction == 1) {
    quest::say("You have done what no Coldain could do, %t! This is indeed a glorious say in our people's history. In return for your invaluable service I present you with the Tri-plated Golden Hackle Hammer. Its magic is powerful and I am sure it will serve you well.");
    quest::ze("Let it be know from this day forth that %t and their companions are Heros of the Coldain Kingdom. King Tormax has been slain, it is a time for celebration. Let no tankard go unfilled!");
    quest::summonitem(30502);
    quest::faction(49,100);
    quest::faction(67,100);
    quest::faction(179,-100);
  }
#Dirk handin for the 10th ring
  elsif(plugin::check_handin(\%itemcount, 1465 => 1) && $faction == 1) {
    quest::say("My good %t, you have served me well. You have flushed out all who sought to oppose me and my people. I am afraid I need to call upon you and your friends one final time. The dissention and treason ran deeper than I had anticipated. Our population has been cleansed, but we lost a full third of our army to the poisonous words of those rebels. In retaliation for your deeds, the Kromrif have made plans to attack us in this, our weakest hour. Can I count on your help outlander?");
    quest::summonitem(1465);
  }
  else{
    plugin::return_items(\%itemcount);
  }
}