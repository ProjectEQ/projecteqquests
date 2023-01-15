# items: 84091, 84092, 84093, 84088
sub EVENT_SPAWN {
  quest::settimer("c_Ragus", 600);
}

sub EVENT_SAY {
  if ($text=~/trick or treat/i) {
    quest::say("Hah! Here's the tastiest treat of them all! Enjoy!");
    quest::summonitem(quest::ChooseRandom(84091, 84092, 84093, 84088, 84088, 84088, 84088, 84088, 84088, 84088)); # Item(s): Sand (84091)
    quest::updatetaskactivity(500220, 2);
  }
}

sub EVENT_TIMER {
  if ($timer eq "c_Ragus") {
    quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
  }
}
