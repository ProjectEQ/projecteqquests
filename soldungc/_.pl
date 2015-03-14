#Elemental Ring Event Counter. NPC has no name so emotes show up properly.

my $elemwave = 0;
my $elemwavea = 0;
my $elemwaveb = 0;

sub EVENT_SPAWN {
$elemwave = 0;
$elemwavea = 0;
$elemwaveb = 0;
}

sub EVENT_SIGNAL {
  if ($signal == 90) {
    $elemwave += 1;
  }
  if ($signal == 91) {
    $elemwavea += 1;
  }
  if ($signal == 92) {
    $elemwaveb += 1;
  }
  if ($signal == 93) {
   quest::spawn2(278124,0,0,0,0,0,0);
   quest::depop_withtimer();
  }
  if ($elemwave == 8) { 
   quest::emote("The room grows warmer as the lava pool begins to steam heavily.");
   quest::spawn2(278123,0,0,-203,-61,-17.5,195);
   quest::spawn2(278123,0,0,-207,-124,-17.5,195);
   quest::spawn2(278123,0,0,-262,-130,-17.5,195);
   quest::spawn2(278123,0,0,-256,-54,-17.5,195);
   $elemwave = 0;
   }
  if ($elemwavea == 4) { 
   quest::emote("The lava starts to bubble and churn. Dark shapes move beneath the molten rock.");
   quest::spawn2(278122,0,0,-163,-95,-13.9,0);
   quest::spawn2(278122,0,0,-301,-94,-14,0);
   $elemwavea = 0;
   }
  if ($elemwaveb == 2) { 
   quest::emote("The pool of lava begins to boil furiously. Something large is growing within.");
   quest::spawn2(278109,0,0,-230,-94,-16.8,0); #Will need to add support for Pure_Flame_Elemental(278108) when Wizard 1.5 is written.
   $elemwaveb = 0;
   }
   
  } 