# Rogue Epic NPC -- Renux_Herkanor

sub EVENT_SAY {
  if ($text =~ /hail/i) {
    quest::say("BOO! I'm sure you didn't expect to see me here, but you've left quite a trail. Why did you go to all the trouble to get this scrap of parchment? What can be so important about it that Father would risk all for it? No matter, Hanns will figure it out. Now, will you tell me where to find Stanos?");
  }
  if ($text =~ /highpass hold/i) {
    quest::say("Excellent. Stanos shall meet his end, and soon. You, however, will not live another day. Can't have you warning him, now can I?");
    quest::attack($name);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Tell Hanns I tried, and will love him always. Tell Father I will save a seat in hell for him!");
}

#END of FILE  Zone:steamfontmts  ID:448200 -- Renux_Herkanor