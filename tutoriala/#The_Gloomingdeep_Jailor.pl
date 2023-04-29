sub EVENT_COMBAT {
  quest::say("Grrrrr. Bark. Bark. Grrrrr.");
  quest::signalwith(188000, 5); ##Arias
}

sub EVENT_DEATH_COMPLETE {
  quest::emote("'s corpse twitches, then lies still.");
  quest::signalwith(188000, 6); ##Arias
}
