sub EVENT_SAY {
  if ($client->GetGlobal("beast_epic") ==6) {
    if ($text=~/mastodon/i) {
      quest::say("Geez. No rest for me. He he. Must go. You go to. Dangerous for you here. You not so tough!");
      quest::summonitem(57008);
    }
  }
}

sub EVENT_ITEM {
  if ($client->GetGlobal("beast_epic") ==5) {
    if (plugin::check_handin(\%itemcount, 57008 => 1)) {
      quest::say("Tanks. You can have back. Me spit 'n' smear dat so Muada know me see it. Me smudged it me thinks. Me trust no one! Me on big job now and no time. Me studying da [" . quest::saylink("mastodon") . "].  Dey hurt me lots, but me tuff with my warder. No match for me! Dey do survive da cold good and manage not to die wit all da wurms and da beasts here. Me try to learn to harness da power of dem.");
	  quest::setglobal("beast_epic", "6", 5, "F");
    }
  }
  plugin::return_items(\%itemcount);
}