# items: 30221, 24866
sub EVENT_SAY {
  # Require better than indifferent faction
  if ($faction < 5) {
    if ($text=~/hail/i) {
      quest::emote("curtsies politely.");
      quest::say("Welcome to our home! I am the Countess Silveana of the Tunarean Court.");
    }
    if ($text=~/court/i) {
      quest::say("The Tunarean Court consists of several of Tunare's most blessed creatures. We Sifaye help defend the wakening land from the invading giants to the east and watch for threats from the dragons to the west.");
    }
    if ($text=~/giants/i) {
      quest::say("There is a giant with a strange metal stick that has been the largest threat as of late. He wanders further into our lands than the other with the stick to his eye and squashes my Sifaye when he finds them. If you eliminate him for us I would like to see that stick he carries.");
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
    if (plugin::check_handin(\%itemcount, 30221 => 1)) {
      quest::emote("claps boisterously.");
      quest::say("My people are in your debt for putting an end to that monster's murderous squashings! Here is the crest of the Sifaye.");
      quest::summonitem(24866); # Item: Crest of the Sifaye
      quest::faction(449, 30); # +Tunarean Court
      quest::exp(100);
    }
    else {
      plugin::return_items(\%itemcount);
    }
  }
  else {
    # Made text up
    quest::say("I will not aid someone who is not a friend of the Tunarean Court.");
  }
}

# Quest by mystic414
