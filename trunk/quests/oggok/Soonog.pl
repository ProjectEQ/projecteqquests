sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You [Greenblood]?");
  }
  if ($text=~/greenblood/i) {
    quest::say("Good, you mine.  We tuffest, bestest, scariest warriors in da Norrath.  Not like dem wimpy Craknek hoomie wannabees.  You Greenblood, you my toy.  You lives or dies at my will.  Go, brings me many lizard meats cause I Greenblood leader and I berry hungry lots.  So hungry dat I eats four lizards.  Go bring meat or I eats you.");
  }  
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18789 => 1)) {
    quest::say("Soonog own you now.. fight for Soonog.. Soonog make you strong.. When you ready for task you tell Soonog.  Soonog army rule all!");
    quest::summonitem(13527);
	quest::faction(128,5);  # Green Blood Knight
	quest::faction(46,5);   # Clurg
	quest::faction(314,-10); # Storm Guard
	quest::faction(292,-10); # Shadowknight of Night Keep
	quest::ding();
    quest::exp(100);
  }
  elsif (plugin::check_handin(\%itemcount, 13410 => 4)) {
    quest::say("Small meats but is good nuff.  You take dis and go kill eberyting.  Make all scared of da Greenblood knights.  You get ready for next inb.. ins.. invat.. you get ready for next war.  You learning stuff, you come bak here and me teach you more Greenblood stuf so we be more tuffest.");
    quest::summonitem(5023);
	quest::faction(128,5);  # Green Blood Knight
	quest::faction(46,5);   # Clurg
	quest::faction(314,-10); # Storm Guard
	quest::faction(292,-10); # Shadowknight of Night Keep
	quest::ding();
    quest::exp(50);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:oggok  ID:49035 -- Soonog