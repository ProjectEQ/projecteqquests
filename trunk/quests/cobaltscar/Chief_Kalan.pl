sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("nods respectfully.");
    quest::say("Welcome to Siren Bay strange one. These beaches belong to my people, the Othmir. You are welcome in our villages as long as you do not cause trouble and are willing to either assist the shellfish collectors provide nourishment or aid the warriors defending the beaches.");
  }
  if ($text=~/aid the warriors/i) {
    quest::say("There are many creatures that would prey on my people if it were not for the dedication of our warriors. The Bulthar and Ulthork often invade our territory and prey on our shellfish collectors. They are wasteful creatures and take more than they could possibly eat from the sacred seas.");
  }
  if ($text=~/bulthar/i) {
    quest::say("The Bulthar are sea elephant people. They are strong brutes with the intelligence of a clam. There is no reasoning with the savages since they seem to only understand their territorial instincts. There is a small herd of them that has taken up residence on the rocky beach beneath the lonely tower and have already injured many of our shellfish collectors. I will reward you for the trunks of every two brutes that you slay.");
  }
  if ($text=~/ulthork/i) {
    quest::say("The Ulthork are walrus people. They are just as territorial and brutish as the Bulthar but are slightly more intelligent. They seem to be jealous of my people's prosperity and occasionally lead raiding parties onto our beaches. Our craftsman use the tusks of the slain Ulthork to carve ivory totems of praise to the ocean lord. I will gladly barter for no less than four pairs of Ulthork tusks.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 24874 => 4)) { # Ulthork Tusks
    quest::say("Many thanks to you, strange one. Our craftsman will be pleased. They have been in need of a new bundle of ivory.");
    quest::faction(241, 30);
    quest::faction(345, -60);
    my $itemid = quest::ChooseRandom(10036, 22503, 16976, 10037, 10033, 10049, 10031, 10053, 10035, 10051, 10034, 10050, 10032, 10048);
    quest::summonitem($itemid);
  }
  elsif (plugin::check_handin(\%itemcount, 30068 => 1)) { # Bulthar Herdmaster Tusk
    quest::say("Such wasteful creatures the Bulthar are. It is a shame they are not intelligent enough to realize the harm they do to the very oceans that sustain them.");
    quest::faction(241, 30);
    quest::faction(345, -60);
    quest::summonitem(22817);
  }
  elsif (plugin::check_handin(\%itemcount, 30067 => 2)) { # Regular Bulthar Tusks
    quest::say("Such wasteful creatures the Bulthar are. It is a shame they are not intelligent enough to realize the harm they do to the very oceans that sustain them.");
    quest::faction(241, 30);
    quest::faction(345, -60);
    my $itemid = quest::ChooseRandom(10036, 22503, 16976, 10037, 10033, 10049, 10031, 10053, 10035, 10051, 10034, 10050, 10032, 10048);
    quest::summonitem($itemid);
  }
  else {
    quest::say("I have no need of these, strange one."); # made up text
    plugin::return_items(\%itemcount);
  }
}

# Quest by mystic414