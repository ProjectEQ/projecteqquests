# ranger/druid epic npc - platinum speckled powder
#

sub EVENT_SPAWN {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER {
  quest::settimer("hum",30);
}

sub EVENT_TIMER {
  quest::emote("hums softly, a little tune that tickles the back of your mind but you can't quite recall.");
  quest::stoptimer("hum");
}

sub EVENT_SAY {
  if ($text=~/tune/i) {
    quest::say("Ohh. Just a little song my mother taught me when I was young. It speaks of the earth, the sky, and the sparkling stars above, always there.");
  }
  if ($text=~/always there/i) {
    quest::say("Aye, always there. Like this small bag I wear around my neck. The last gift of my dying mother. It holds a fine dust, a dust she collected during her short life, that she believed brought her luck. It's speckled, flecked as the night sky is with stars.");
  }
  if ($text=~/speckled flecked dust/i) {
    quest::say("I've had this little bit of dust, all I have of my mother, for many years now. It's the only reminder I have of her. She said it was special, magical, a warmth to help me through the nights. Even if my life were in the balance, I would have a hard time giving it up.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20476 => 1)) {
    quest::say("This, this is my mother's amulet. I cannot believe it. Please, take this powder you say you need. Perhaps it does have powers, I don't know, I don't care. Thank you, my eternal thanks for this.");
    quest::summonitem(20456);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: qrg ID: 3018 NPC: Niera_Farbreeze

