sub EVENT_SAY {
  if ($text=~/I need a set of Etching Tools/i) {
    quest::say("Oh, really? There are not many that work in faceting gems. I am surprised to see your interest. You can have this old set of mine. There is no need to return the tools, Talem recently made me a new sturdy set. Brell bless him.");
  quest::summonitem(8893);
  }
}
