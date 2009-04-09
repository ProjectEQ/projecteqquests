# Wage War Upon The Coldain
#

sub EVENT_SAY {
  if (($faction != 6) && ($faction != 7)) {
    if ($text=~/hail/i) {
      quest::say("Greetings, little thing. You have entered into the great city of Kael Drakkel, home of the Kromzek as well as a few of my kind, the Kromrif. If you are to walk among my people as a peer you must prove yourself as a friend, not a foe.");
    }
    if ($text=~/prove myself/i) {
      quest::say("Leave this place then and return when you have waged war upon the Coldain. Remove their heads from their bodies and return them to me. I will spread the word of your deeds amongst my people if you do so, $name.");
    }
    if ($text=~/coldain/i) {
      quest::say("The Coldain are the ice dwarves who dwell in the city of Thurgadin. They are a blight upon the land known as Velious, speaking the word of their god, Brell.");
    }
  }
  else {
    quest::say("I will do nothing to help beings like you!");
  }
}

sub EVENT_ITEM {
  if (($faction != 6) && ($faction != 7)) {
    if (plugin::check_handin(\%itemcount, 30081 => 1)) {
      quest::say("Very good, $name. Slay more of the beasts and your name will be known by all of the Kromrif!");
      quest::exp(5000);
      quest::faction(188,10); #kromrif
      quest::faction(189,10); #kromzek
      quest::faction(42,-30); #CoV
      quest::faction(49,-30); #coldain
    }
    else {
      plugin::return_items(\%itemcount);
    }
  }
}

# EOF zone: kael ID: 113059 NPC: a_kromrif_recruiter

