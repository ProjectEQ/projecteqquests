# corrected script for sleeper's tomb key quest
# 
# fixed an incorrect talisman being accepted for a hand, corrected a typo that 
# was causing one talisman not to be accepted, corrected the
# plugin::return_items command
# items: 9296, 27255, 27256, 27258, 27259, 27266, 27265

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Mortal! You MUST aid me! I will have my revenge, and my rest!");
  }
  elsif ($text=~/aid you/i) {
    quest::say("You must wake The Sleeper. He is our salvation, he will restore a new golden age to Norrath. It was a terrible mistake to subdue him, jealousy and envy led us to do it. I see all of this clearly now.");
    }
  elsif ($text=~/the sleeper/i) {
    quest::say("Kerafyrm, the best of us, what we should be. We imprsoned him in a timeless slumber aeons ago. I know how to release him, but I am no longer of the flesh, so I cannot do it myself. But you can accomplish this task!");
  }
  elsif ($text=~/task/i) {
    quest::say("When the tomb was closed and the entry sealed, many dragons participated in the ceremony. They invested portions of their essence into the seal. The seal is part of them now. With the right talismans, I can show you how to make a key that will allow one to pass, as if they were of the First Brood. If you do not wish to do this for the good of all, perhaps you will be willing to do it for material riches. Priceless treasures are stored in the tomb, yours for the taking, once you are inside and have released The Sleeper.");
  }
}

sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 9296 => 1)) || (plugin::check_handin(\%itemcount, 27255 => 1)) || (plugin::check_handin(\%itemcount, 27256 => 1)) || (plugin::check_handin(\%itemcount, 27258 => 1)) || (plugin::check_handin(\%itemcount, 27259 => 1)) || (plugin::check_handin(\%itemcount, 27266 => 1))) {
    quest::say("Very well done, $name. Here is how you unlock the entry. Seek out a great dragon statue in the Eastern Wastes and use this key there. Not very different from how you entered my old domain, Veeshan's Peak, now, is it? Haha, yes, I know many things, even dead.");
    quest::summonitem(27265); # Item: Sleeper's Key
    quest::exp(500000);
    quest::set_zone_flag(128);
  }
  plugin::return_items(\%itemcount);
}

