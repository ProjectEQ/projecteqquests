sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("What you want?!! Face so ugly you scare fish away!! ..sniff, sniff. Smell so bad, too!! Me sure is hungry. Wish had [grub locker].");
  }
  if ($text=~/grub locker/i) {
    quest::say("You gots grub locker!! Give to me. Me sick of fish and not many dwarves fall off ship. Me pay a plat to get me grub locker from the Gobbler in Neriak. Go to him and say you [deliver grub locker] if you wants one plat.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12203 => 1)) {
    quest::say("Oooh!! Grub locker! There is a loud click. He opens the locker and unwraps dwarf pickles. What this dumb wrapper? R, E, C, I, P, E.. Ahh!! It say pickles!! Me read good. Here your plat. Me give you little more. Me was very hungry for pickles.");
    quest::faction(66,10);
    quest::faction(22,-10);
    quest::exp(150);
    quest::givecash(0,0,0,2);
  }
  else {
    quest::say("I don't want this."); #Text made up
  }
  plugin::return_items(\%itemcount);
}