sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Pffft. What do you want? Unless you have some grand advice that will help me get on the [" . quest::saylink("council") . "], go away. I'm not here for your entertainment.");
  }
  if ($text=~/council/i) {
    quest::say("Yes, fool. The council of the city known as the Scions of the Six. I'm far more qualified and knowledgeable of my father's arts than Ithakis, my older brother. Just because Ithakis is old, doesn't make him better.  Why my father Atathus, the dragon lord of fire and war, chose him is beyond me. Something must be done to right this injustice. For the good of the drakkin!  I do have a [" . quest::saylink("plan") . "], but I'd need some assistance.");
  }
  if ($text=~/plan/i) {
    quest::say("I have this elixir, you see. It was designed by my brother and everyone knows of it and only the drakkin of Atathus' lineage can stomach it.  All know this.  [" . quest::saylink("Deliver") . "] it to one of our proud council members, named Reakash -- the blue drakkin daughter of Osh`vir.  She will drink it and find that her throat will burn for several days. The council will point their fingers at Ithakis and he will be thrown from the council!");
  }
  if ($text=~/deliver/i) {
    #You have been assigned the task 'Oh Brother!'
    quest::say("May Atathus' flames enlighten you! You have done me a great favor!");
    quest::summonitem(85092); #Atathus` Elixir of Life
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}