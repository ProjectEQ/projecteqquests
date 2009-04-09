#BeginFile: warslikswood\79127.pl (Raving Goblinmaster - Quest)
#Quest for Warsliks Wood - Raving Goblinmaster: Berserker Epic 1.0 (Trial of Mastery)

my $goblin = 0;
my $stage = 0;

sub EVENT_SPAWN {
  quest::settimer(1,1); #Pulse timer every second
  quest::settimer(2,600); #Timer to depop after 10 minutes
}

sub EVENT_SAY {
  if(($text=~/ready/i) && (plugin::check_hasitem($client, 60210)) && ($stage == 0)) {
    quest::stoptimer(1);
    quest::shout("Why you come here is a mystery to me. If you are brave, chase me as I flee. Watch to the front and behind. To your right and left do not be blind!");
    quest::spawn2(79127,78,0,$x,$y,$z,0); #Raving Goblinmaster - Quest
    quest::signalwith(79127,3,0); #Tell Raving Goblinmaster to begin stage 1
    quest::depop();
  }
}

sub EVENT_TIMER {
  if($timer == 2) {
    quest::stoptimer(1);
    quest::stoptimer(2);
    quest::signal(79129); #a frantic goblin
    quest::signal(79128); #Ferocious Goblin
    quest::shout("Aha! My minions have defeated you!");
    quest::depop();
  }
  if(($timer == 1) && ($x == 0) && ($y == 1510) && ($stage == 1)) {
    quest::stoptimer(1);
    quest::stoptimer(2);
    quest::spawn2(79127,79,0,$x,$y,$z,0);
    quest::spawn2(79129,0,0,($x + 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x + 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,$x,($y + 5),$z,0);       #a frantic goblin
    quest::signalwith(79127,4,0); #Tell Raving Goblinmaster to begin stage 2
    quest::depop();
  }
  if(($timer == 1) && ($x == 55) && ($y == 1762) && ($stage == 2)) {
    quest::stoptimer(1);
    quest::stoptimer(2);
    quest::spawn2(79127,80,0,$x,$y,$z,0);
    quest::spawn2(79129,0,0,($x + 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x + 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,$x,($y + 5),$z,0);       #a frantic goblin
    quest::signalwith(79127,5,0); #Tell Raving Goblinmaster to begin stage 3
    quest::depop();
  }
  if(($timer == 1) && ($x == 262) && ($y == 2105) && ($stage == 3)) {
    quest::stoptimer(1);
    quest::stoptimer(2);
    quest::spawn2(79127,81,0,$x,$y,$z,0);
    quest::spawn2(79129,0,0,($x + 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x + 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y + 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,($x - 5),($y - 5),$z,0); #a frantic goblin
    quest::spawn2(79129,0,0,$x,($y + 5),$z,0);       #a frantic goblin
    quest::signalwith(79127,6,0); #Tell Raving Goblinmaster to begin stage 4
    quest::depop();
  }
  if(($timer == 1) && ($x == 377) && ($y == 2391) && ($stage == 4)) {
    quest::stoptimer(1);
    quest::stoptimer(2);
    quest::spawn2(79127,82,0,$x,$y,$z,0);
    quest::spawn2(79128,0,0,($x + 5),($y + 5),$z,0); #Ferocious Goblin
    quest::spawn2(79128,0,0,($x + 5),($y - 5),$z,0); #Ferocious Goblin
    quest::spawn2(79128,0,0,($x - 5),($y + 5),$z,0); #Ferocious Goblin
    quest::signalwith(79127,7,0); #Tell Raving Goblinmaster to begin stage 5
    quest::depop();
  }
  if(($timer == 1) && ($x == 760) && ($y == 3549) && ($stage == 5)) {
    quest::stoptimer(1);
    quest::stoptimer(2);
    quest::spawn2(79126,0,0,$x,$y,$z,0); #Raving Goblinmaster - KOS
    quest::depop();
  }
}

sub EVENT_SIGNAL {
  if($signal == 1) { #Signal from Lurking Hopeful
    quest::shout("Yes, I see you, you wander in the trees. If you cross me, I will bring you to your knees.");
  }
  if($signal == 2) { #Signal from a killed goblin
    $goblin = $goblin + 1;
    if(($goblin == 5) && (($stage > 0) && ($stage < 4))) {
      quest::signalwith(79127,$stage+3,0);
    }
    if(($goblin == 3) && ($stage == 4)) {
      quest::signalwith(79127,7,0);
    }
  }
  if($signal==3) { #Signal from Raving Goblinmaster - Stage 1
    $stage = 1;
  }
  if($signal==4) { #Signal from Raving Goblinmaster - Stage 2
    $stage = 2;
  }
  if($signal==5) { #Signal from Raving Goblinmaster - Stage 3
    $stage = 3;
  }
  if($signal==6) { #Signal from Raving Goblinmaster - Stage 4
    $stage = 4;
  }
  if($signal==7) { #Signal from Raving Goblinmaster - Stage 5
    $stage = 5;
  }
  if($signal==8) { #Signal from an alive goblin
    quest::stoptimer(1);
    quest::stoptimer(2);
    quest::signal(79129); #a frantic goblin
    quest::signal(79128); #Ferocious Goblin
    quest::shout("Aha! My minions have defeated you!");
    quest::depop();    
  }
}
#EndFile: warslikswood\79127.pl (Raving Goblinmaster - Quest)