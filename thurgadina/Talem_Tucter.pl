# part of 7th coldain prayer shawl
#

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("A ring or necklace for yer sweetheart, traveler? It'll be sure ta brighten their day and ye'll not find finer craftmanship this side o' the Gretespeign.");
  }
  if ($text=~/casing/i) {
    quest::say("Combine two platinum bars, a small piece of velium and the casing pattern in a Jeweler's kit. Take the completed casing and the rune and combine them in the same kit. When this is done all that's left is to tailor the rune to the shawl with the pattern. Take the finished product to Borannin, I'm sure he's eager to speak with you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1859 => 1)) {
    quest::say("I've heard of your mission, $name. I must admit that I had my doubts you'd make it this far. The rune's creation is nearly impossible for even the most skilled of Coldain craftsmen. You should be exceedingly proud. Many have attempted this feat and nearly all have lacked the skill, faith, patience and persistence that is prerequisite for what destiny holds in store for you. You are now ready to use this pattern to construct the sacred rune's casing and complete the runed shawl.");
    quest::summonitem(2040);
    quest::summonitem(1859);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone thurgadina ID: 115162 NPC: Talem_Tucter

