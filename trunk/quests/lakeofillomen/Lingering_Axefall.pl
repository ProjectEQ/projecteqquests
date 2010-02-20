# First Zerker. Event
# Lake of Ill Omen
#
# 9/13/07
# Written: Wizardanim

my $axe = 0;
my $beast = 0;

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60189 => 1)) { #axe of the spirit
    $axe = 1;
    $beast = 1;
    quest::say("Ah, yes. The signature axe of my good friend, McArik. Here to test your control, hm? I hope you have better luck than I did. As you can see, I didn't fare so well against the enemy I was sent to [defeat]. Here, take these. I fashioned them for you from McArik's throwing axe. You will need them.");
    quest::summonitem(60191);
    quest::summonitem(60191);
    quest::summonitem(60191);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_SAY {
  if ($text=~/defeat/i && $class eq "Berserker" && $beast == 1) {
    quest::say("Argh, it has sensed my presence. It is near! You must protect me and save me from this beast. If you do, you will pass this test. You must yourself take a tooth from its mouth as evidence to show to McArik that you've passed this trial. Tell me if you [need more axes].");
    quest::spawn2(85225,0,0,2158,70,102,60); #An_Impervious_Bloodbeast
    $beast = 0;
  }
  if ($text=~/need more axes/i && $axe == 1) {
    quest::say("More Axes?");
    quest::summonitem(60191);
    quest::summonitem(60191);
    quest::summonitem(60191);
  }
}

sub EVENT_SIGNAL {
  $axe = 0;
}
#EndFile lakeofillomen\Lingering_Axefall.pl ()