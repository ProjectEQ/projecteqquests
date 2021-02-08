# items: 62075, 62074, 62193
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Pungub is happy to be free from the mines. Pungub wants some gobbys to die will you kill gobbys for Pungub?");
  }
  if ($text=~/kill gobbys/i) {
    quest::say("Good Pungub is happier! Go kill the gobbys called taskmasters and bring back three Nurgan Taskmaster Whips. Pungub also wants the Dagger of the Sneak that Thabis has. If you bring to Pungub, Pungub will give good reward.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62075 => 1, 62074 => 3)) {
    quest::say("Me thanks you for helping kill da gobbys.  Here yous go.");
    quest::summonitem(62193); # Item: Dingy Pauldron of Brawling
  }
}