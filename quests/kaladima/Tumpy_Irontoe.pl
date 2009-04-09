sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to Irontoe's! The finest watering hole this side of Oggok! If you're looking for anything special and it ain't behind the bar, just ask. Maybe I can make it.");
  }
  if ($text=~/tumpy tonic/i) {
    quest::say("So you want a Tumpy Tonic? I can make you one. All I need is a flask of water and a kiola nut. The kiola nut can be bought in the Ocean of Tears island chain.");
  }
}

sub EVENT_ITEM {
  if (($itemcount{13340} == 1) && ($itemcount{13006} == 1)) {
    quest::say("Here you go. One Tumpy Tonic. Don't drink that too fast now.");
    quest::summonitem(12114);
    quest::exp(1000);
  }
}

# Quest by mystic414