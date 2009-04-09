sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("flutters his wings rapidly, sending shimmering dust through the air around you. Although he speaks in high pitched chirps you somehow understand his meaning. Hello $name, I am the Count of the Tunarean Drixies. Are you a friend of the Tunarean Court?");
  }
  # Require better than indifferent faction
  if ($faction < 5) {
    if ($text=~/friend/i) {
      quest::say("I am in need of some help. One of my heralds was sent to deliver a message to the Othmir in the Cobalt Scar some time ago and has not returned. I fear for his safety. If your travels should lead you in that direction please attempt to find news of my missing herald.");
    }
  }
  else {
    # Made text up
    quest::say("You are no friend of the Tunarean Court.  Leave me.");
  }
}

sub EVENT_ITEM {
  # Require better than indifferent faction
  if ($faction < 5) {
    if (plugin::check_handin(\%itemcount, 24876 => 1)) {
      # Made text up
      quest::say("Thank you for your assistance, $name, though I am greatly saddened by the death of my herald.  Truly you are a friend of the Tunarean Court.  Take this crest as a token of my gratitude.");
      quest::summonitem(24867);
      quest::faction(344, 30); # +Tunarean Court
      quest::exp(100);
    }
    else {
      # Made text up
      quest::say("I have no use for this, $name.");
      plugin::return_items(\%itemcount);
    }
  }
  else {
    # Made text up
    quest::say("I will not aid someone who is not a friend of the Tunarean Court.");
  }
}

# Quest by mystic414