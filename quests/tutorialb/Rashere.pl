#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Did you know that when you die your soul can be recalled to your last bind spot? Well it can and that is exactly my purpose on this world. I can [bind] your soul so that after death you will be brought to life again in this spot.");
  }
  if ($text=~/bind/i) {
    quest::selfcast(35);
  }
  if ($text=~/siblings/i) {
    quest::say("Slavemaster Ruga has the rest of the dragon eggs on his person. He's in the Gloomingdeep jail trying to prevent the rest of the slaves from escaping. Be careful with Ruga though. That kobold's never without his bodyguards nearby!");
    quest::assigntask(36); #Task: Flutterwing's Dilemma
  }
}

sub EVENT_SIGNAL {
  quest::emote("glances over as you begin talking to the baby dragon.");
  quest::say("Hey there, $name. That's Flutterwing you're talking to. Cute, isn't he? We just rescued the little guy from the kobolds. Turns out they captured a whole clutch of dragon eggs in hopes of raising the creatures as war animals. If you can recover Flutterwing's unhatched [siblings] he'd be much obliged. Also, the little guy loves muffins so if you've got any go ahead and feed him. Just watch your fingers.");
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}