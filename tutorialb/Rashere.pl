#zone: tutorialb

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name.  I'm afraid I'm too old to join in this revolt.  I can only wait here and try to walk out once the dust has settled.  Good luck to you though.  Many have tried to escape already and few have survived...'  Rashere studies you for a moment, scratching his bristly chin.  'Eh?  Don't look so worried, $name.  Death is but a thin boundary in this world.  In fact, I and a few others have learned to reach across this boundary and pluck souls from their resting places.  If you would like me to return your soul here when you die, just say [" . quest::saylink("bind my soul") . "].");
    quest::popup("Soulbinding", "Rashere is a soulbinder, which means he has the power to call your soul back to Norrath if you die.<br><br> Whenever you die, you will automatically return to the last place that your soul was bound to.<br><br>Soulbinders can be found in most starting cities, as well as the Plane of Knowledge.<br><br><c \"#F07F00\">Ask Rashere to 'bind my soul' to continue.</c>");
  }
  if ($text=~/bind my soul/i) {
    quest::selfcast(35);
    if (quest::istaskactivityactive(1448, 13)) {
      quest::updatetaskactivity(1448, 13); #Task: Basic Training
    }
  }
  if ($text=~/siblings/i) {
    quest::say("Slavemaster Ruga has the rest of the dragon eggs on his person. He's in the Gloomingdeep jail trying to prevent the rest of the slaves from escaping. Be careful with Ruga though. That kobold's never without his bodyguards nearby!");
    quest::assigntask(5703); #Task: Flutterwing's Dilemma
  }
}

sub EVENT_SIGNAL {
  quest::emote("glances over as you begin talking to the baby dragon.");
  quest::say("Hey there, $name. That's Flutterwing you're talking to. Cute, isn't he? We just rescued the little guy from the kobolds. Turns out they captured a whole clutch of dragon eggs in hopes of raising the creatures as war animals. If you can recover Flutterwing's unhatched [" . quest::saylink("siblings") . "] he'd be much obliged. Also, the little guy loves muffins so if you've got any go ahead and feed him. Just watch your fingers.");
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}