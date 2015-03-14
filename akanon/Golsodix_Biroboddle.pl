sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello there $name. I must admit that I am not in the highest of spirits on this day. So unless you know something about [Xoomix], please leave me alone.");
  }
  elsif($text=~/help find/i) {
    quest::say("You are quite the likeable fellow $name. I do appreciate you willing to help me locate where my friend has gone, even if he has passed I would like some proof so that I may sleep easy at night knowing he is at peace. I can begin your search by telling you where our [journey] had taken us.");
  }
  elsif($text=~/Xoomix/i) {
    quest::say("Xoomix is a very dear friend of mine that was .. gulp. lost at sea. We were separated when the dastardly Broken Skull Clan overtook our boat. I was the only one that was able to escape but I fear the worst for my friend. Would you be willing to [help find Xoomix]?");
  }
  elsif($text=~/journey/i) {
    quest::say("Well you see we were setting sail for the city of Freeport. Xoomix received a few telegrams about some tinkering supplies that were available to him should we be able to travel to Freeport and pick them up. Xoomix was a fantastic Tinkerer, he could just about build anything out of nothing. If he should be alive I am sure that he has used his skills to survive. The first place I could ask you to look is around the area of Butcherblock dock. That is where our ship was [overtaken].");
  }
  elsif($text=~/overtaken/i) {
    quest::say("I do not remember that much from the incident, it happened ever so fast. I do remember how there were many trolls that chanted Glory to the Rok! repeatedly. Perhaps this will aid you in your search. Please return to me with some good news. And please give this clockwork eye to Xoomix should you find him alive, I imagine it will lift his spirits. We used to collect them as children.");
   quest::summonitem(21979);
  }
  else {
    quest::emote("stares at you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 219847 => 1)) {
    quest::say("A contraption from Xoomix! I knew he was still alive. This also says that he needs his gearbox to make his compass so he can return home. I must have it here somewhere let me take a look. Ah, here it is. Please take this to Xoomix so he can return home and thank you for all your kind deeds to help a lost gnome. Brell certainly smiles down upon you!");
    quest::summonitem(21985);
  }
  plugin::return_items(\%itemcount);
}