sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name.  I`ve found a secret cubbyhole where we can hide our loot.  If you have any coins you want to stash here, give them to me.");
    quest::popup("Banking", "<br>Lyndroh is a banker, which means that you can give him money and equipment to store for later.<br><br>You can use any banker by <c \"#00F0F0\">right clicking</c> on them.  You can withdraw and deposit items at any bank as though the <c \"#00A000\">Bank Window</c> were part of your inventory.<br><br> <c  \"#F07F00\">Drop off or pick up any items you'd like from your bank and click 'OK' to continue.</c>", 18);
  }
}