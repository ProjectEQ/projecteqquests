# Dragon Heads quests

sub EVENT_SAY {
  # Require Warmly or better faction
  if ($faction <= 3) {
    if ($text=~/hail/i) {
      quest::say("Welcome to the castle of King Tormax. It is quite an accomplishment for one of your kind to have lived this long in the service of our great King Tormax. You must be powerful indeed. My power is like a storm - I may rage and destroy my foes with great fury.");
    }
    if ($text=~/foes/i) {
      quest::say("The dragons are the greatest threat to Kael Drakkel. For some reason they believe that this land we inhabit is holy and should not be tread upon. I cannot count the number of wurms I have beaten back from the gates of Kael Drakkel in the past. We giants will live on, though, for each year their numbers thin and ours only grow. With the help of mercenaries such as yourself we may be able to eradicate them from the face of Velious.");
   }
    if ($text=~/eradicate/i) {
      quest::say("I dream of the day when the only dragons in Velious are the ones whose skins line my boots. Some day my dream will come true. Until the day I can gather a force powerful enough to assault their homes, I will slay whatever foul beasts tread near Kael Drakkel.");
    }
    if ($text=~/assault/i) {
      quest::say("That is an aspiration of King Tormax. One day, it may be possible for us to do so. Encountering so many dragons at once may very well be suicide though. Enough of my banter about dragons. What is it that brings you to Dragon Death Keep? Do you seek more challenging tasks?");
    }
    if ($text=~/challenging tasks/i) {
      quest::say("If you are as mighty as I believe you to be, travel out from this city and fight off the draconian menace. For the head of an elder dragon you will be handsomely rewarded.");
    }
    if ($text=~/reward/i) {
      quest::emote("pats the huge axe at his side and drapes his shimmering cloak over his shoulders.");
    }
    if ($text=~/axe/i) {
      quest::say("My axe is named Frostbringer. It was given to me by the great King Tormax for my service to him. Serving the king can be quite advantageous.");
    }
    if ($text=~/cloak/i) {
      quest::say("The cloak of the Maelstrom allows me to rage like a great storm. It is but a simple possession - the head of an elder dragon would be worth far more to my kind.");
    }
  }
  else {
    quest::say("Your loyalty to our ideals has yet to be proven.");
  }
}

sub EVENT_ITEM {
  # Require Warmly and better faction
  if ($faction <= 3) {
    # Great Dragon's Head
    if (plugin::check_handin(\%itemcount, 25119 => 1)) {
      quest::say("The bards will sing of your greatness, $name. Rage on like the Maelstrom when you wear this cloak. You have done a great service for the city of Kael Drakkel, and we Kromzek do not soon forget great deeds.");
      quest::summonitem(25023);
    }

    # Greater Dragon's Head
    elsif (plugin::check_handin(\%itemcount, 25118 => 1)) {
      quest::say("We shall hang this head from the halls of Dragondeath Keep and sing your praises, $name. Take my axe as a reward for your great deeds. You are a true hero for Kael Drakkel!");
      quest::summonitem(25022);
    }

    else {
      quest::say("I have no use for this, $name.");
      plugin::return_items(\%itemcount);
      return 1;
    }
  
    quest::faction(179, 20);  # +King Tormax
    quest::faction(189, 20);  # +Kromzek
    quest::faction(362, -60); # -Yelinak
    quest::faction(67, -60);  # -Dain Frostreaver IV
  
    quest::exp(100);
  }
  else {
    quest::say("I will do nothing to aid the likes of you.");
  }
}

# Quests by mystic414