sub EVENT_SAY {
  if($text=~/hail/i) {
    if ($faction <= 3) { # Require Kindly and greater faction
      if (defined $qglobals{bic} && $qglobals{bic} == 6) {
        quest::say("What can I do for you? I'm waiting to hear word from the Wayfarer scouts. My niece has been captured by the Muramites and I only wish to discover if she is still alive. I can't take this, not knowing. I would much rather endure a thousand of those beast's whips than be kept in the dark. Please find her for me.");
      }
    }
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) { # Require Kindly and greater faction
    if (plugin::check_handin(\%itemcount, 52179 => 1)) {
      quest::emote("sobs uncontrollably, tears welling up in her eyes");
      quest::say("So my little one is still out there. This is wonderful news. I can now die in peace. The Wayfarers have transcribed my final wishes onto this parchment. Please deliver this to Namosa.");
      quest::summonitem(52178);
      quest::exp(10000);
      quest::faction(363,10);
      quest::faction(416,-10);
    }
    elsif (plugin::check_handin(\%itemcount, 52177 => 1)) {
      quest::emote("looks quizzically at the symbol and rubs it in her hands. She smiles as if realizing something");
      quest::say("Ah, Tentric, you are always right. I can't give up on this world or my family. I'm not sure why I was behaving so selfishly. Take this flower to my niece, she will know what it means.");
      quest::summonitem(52175);
      quest::exp(10000);
      quest::faction(363,10);
      quest::faction(416,-10);
    }
    else {
      plugin::return_items(\%itemcount);
    }
  }
  else {
    plugin::return_items(\%itemcount);
  }
}