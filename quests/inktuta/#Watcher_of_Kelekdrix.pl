my $x_max = 420;
my $x_min = 225;
my $y_max = -385;
my $y_min = -605;
my $z_const = -2;

my $x_spawn = 0;
my $y_spawn = 0;

sub EVENT_SPAWN {
  $x_spawn = $x;
  $y_spawn = $y;
  $npc->SetDisableMelee(1);
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::settimer("shadowstep", 40);
    quest::stoptimer("reset");
  }
  else {
    quest::stoptimer("shadowstep");
    quest::settimer("reset", 30);
  }
}

sub EVENT_TIMER {
  if ($timer eq "shadowstep") {
    my $new_x = int(rand(1) * ($x_max - $x_min + 1)) + $x_min;
    my $new_y = int(rand(1) * ($y_max - $y_min + 1)) + $y_min;
    my $new_z = $z_const;

    quest::emote("Watcher of Kelekdrix blinks out of existence and appears elsewhere.");
    $npc->GMMove($new_x, $new_y, $new_z);
  }
  else {
    quest::stoptimer("reset");
    $npc->GMMove($x, $y, $z_const);
  }
}

