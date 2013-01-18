sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hey there scrawny! I lead the finest team of laborers in all of Kael Drakkel! We've got little use for a weak creature like yourself, but if you want to help us out I've got a task for you.");
  }
  if ($text=~/task/i) {
    quest::say("Those pansy dragon would bees in the Tunarean Court have become quite the nuisance lately. The deaths of Lord Gossimerwind and Lord Prismwing would certainly put an end to the nuisance for a time. Bring me their wings as proof of their deaths.");
  }
}

sub EVENT_ITEM {
#  if (plugin::check_handin(\%itemcount, XXXX => 1, XXXX => 1)) { #Lord Gossimerwind Loot, Lord Prismwing Loot
#    quest::say("REWARD TEXT HERE");
#    quest::exp(25000);
#    quest::summonitem(24887); #Holgresh Mojo Stick (Holgresh Air Wand)
#    quest::faction(189,10); #Kromzek
#    quest::faction(188,10); #Kromrif
#    quest::faction(179,10); #King Tormax
#    quest::faction(42,-10); #Claws of Veeshan
#  }
#  else {
#    quest::say("I do not need this.");
#  }
  plugin::return_items(\%itemcount);
}