#BeginFile: nadox\a_Luggald_High_Priest.pl
#Script for Crypt of Nadox - a Luggald High Priest

#Spawns Innoruk if all apprentices are killed before the end of the ceremony

my $counter; #Counter for dead apprentices
my $begin; #Shows that event has started

sub EVENT_SPAWN {
  $counter = 0;
  $begin = 0;
}

sub EVENT_SIGNAL {
  if (($signal == 1) && ($begin == 0)) {
    quest::shout("Innoruuk protect us from the invaders in our land.");
    quest::settimer("ceremony",600); #10 minute ceremony
    quest::signal(227082,0); #Signal apprentices to chant
    $begin = 1;
  }
  if ($signal == 2) {
    $counter += 1; #apprentice death
    if ($counter == 1) {
      quest::shout("As long as we have our numbers, Innoruuk will provide us with strength.");
    }
    if ($counter == 2) {
      quest::shout("Innoruuk protect us from the invaders in our land.");
    }
    if ($counter == 3) {
      quest::shout("As long as we have our numbers, Innoruuk will provide us with strength.");
    }
    if ($counter == 4) {
      quest::shout("Innoruuk protect us from the invaders in our land.");
    }
    if ($counter == 5) {
      quest::shout("'Master Innoruuk, the invaders have intruded into your sacred place of worship! We are in need of your wisdom and power!");
      quest::stoptimer("ceremony");
      quest::spawn2(227331,0,0,1714,669,-87,180); #Innoruk (Nadox)
    }
  }
}

sub EVENT_TIMER {
  if ($timer eq "ceremony") { #Ceremony failed, reset
    quest::stoptimer("ceremony");
    quest::shout("The ceremony is complete!!");
    $counter = 0;
    $begin = 0;
  }
}

sub EVENT_DEATH {
  quest::stoptimer("ceremony");
}
#EndFile nadox\a_Luggald_High_Priest.pl (227073)