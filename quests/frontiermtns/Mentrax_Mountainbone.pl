sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("What be it you want! Go away before I eat you for dinner!");
  }
  if ($text=~/wenden sent me/i) {
    quest::say("Did he? Perhaps you would like to trade for some Rejesiam ore? Bring me the monocle from the patriarch that wanders around the Dreadlands. I've always wanted one of those."); # made up dialogue - will replace with correct dialogue once found from live servers
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20678 => 1)) {
    quest::say("Eh, you actually found one! Thank you, $name. Here is a block of ore for you. Just don't let the other giants know.");
    quest::summonitem(20666);
    quest::exp(25000);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: frontiermtns ID: 92148 NPC: Mentrax_Mountainbone

