#BeginFile: warslikswood\79127.pl (Raving Goblinmaster - Quest)
#Quest for Warsliks Wood - Raving Goblinmaster: Berserker Epic 1.0 (Trial of Mastery)

my $goblin = 0;
my $stage = 0;

sub EVENT_SPAWN {
  quest::settimer(1,600); #Timer to depop after 10 minutes
  quest::shout("Yes, I see you, you wander in the trees. If you cross me, I will bring you to your knees.");
}

sub EVENT_SAY {
  if(($text=~/ready/i) && plugin::check_hasitem($client, 60210) && ($stage == 0)) {
    quest::shout("Why you come here is a mystery to me. If you are brave, chase me as I flee. Watch to the front and behind. To your right and left do not be blind!");
    quest::start(78);
    $stage = 1;
  }
}

sub EVENT_TIMER {
    quest::stoptimer(1);
    quest::signal(79129); #a frantic goblin
    quest::signal(79128); #Ferocious Goblin
    quest::shout("Aha! My minions have defeated you!");
    quest::depop();
}

sub EVENT_SIGNAL {
  if($signal == 1) { #Signal from an alive goblin
    quest::stoptimer(1);
    quest::signal(79129); #a frantic goblin
    quest::signal(79128); #Ferocious Goblin
    quest::shout("Aha! My minions have defeated you!");
    quest::depop();    
  }
  if($signal == 2) { #Signal from a killed goblin
    $goblin = $goblin + 1;
    if($goblin == 5) {
      $stage = $stage + 1;
      $goblin = 0;
      if($stage == 2) {
        quest::start(79);
      }
      if($stage == 3) {
        quest::start(80);
      }
      if($stage == 4) {
        quest::start(81);
      }
    }
    if(($goblin == 3) && ($stage == 4)) {
      $stage = 5;
      quest::start(82);
    }
  }
}

sub EVENT_WAYPOINT_ARRIVE {
  if (($stage == 1) && ($wp == 4)) {
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
    quest::spawn2(79129,0,0,($x + 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x + 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,$x,($y + 5),$z,0);       #a frantic goblin
  }
  if (($stage == 2) && ($wp == 2)) {
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
    quest::spawn2(79129,0,0,($x + 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x + 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,$x,($y + 5),$z,0);       #a frantic goblin
  }
  if (($stage == 3) && ($wp == 2)) {
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
    quest::spawn2(79129,0,0,($x + 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x + 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,$x,($y + 5),$z,0);       #a frantic goblin
  }
  if (($stage == 4) && ($wp == 2)) {
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
    quest::spawn2(79128,0,0,($x + 5),($y + 5),$z,0); #Ferocious Goblin
    quest::spawn2(79128,0,0,($x + 5),($y - 5),$z,0); #Ferocious Goblin
    quest::spawn2(79128,0,0,($x - 5),($y + 5),$z,0); #Ferocious Goblin
  }
  if (($stage == 5) && ($wp == 4)) {
    quest::stop();
    quest::moveto($x,$y,$z,$h,1);
    quest::stoptimer(1);
    quest::spawn2(79126,0,0,$x,$y,$z,0); #Raving Goblinmaster - KOS
    quest::depop();
  }
}
#EndFile: warslikswood\79127.pl (Raving Goblinmaster - Quest)