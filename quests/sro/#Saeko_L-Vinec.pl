sub EVENT_SAY {
  if ($text=~/last known area/i) {
    quest::say("From the information I have gathered the last time she came above ground was somewhere in the middle of the. . . Suddenly as if staring in the face of death Saeko's blue skin turns deathly grey. She looks at you for a moment and begins to cast a spell. That's when you hear a loud chittering behind you.");
    quest::emote("begins to cast the gate spell");
    quest::spawn2(35146,0,0,544,233,-21,163);
    quest::depop_withtimer();
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67004 =>1 )) {
    quest::say("So you're the one Sazan sent to help. He must need this venom badly. Tell you what, since I have been here for so long and turned up nothing I will tell you the [last known area] that Gargantula was spotted. She is a crafty beast who uses the sands of this desert to move silently.");
  }
}