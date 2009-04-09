sub EVENT_SAY { 
if($text=~/Hail/i){quest::say("You [Greenblood]?"); }
}
sub EVENT_ITEM { 
 if ($item1=="18789"){quest::say("Soonog own you now.. fight for Soonog.. Soonog make you power.. Soonog army rule all!");
	quest::summonitem("13527");
	quest::exp("100");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:oggok  ID:49035 -- Soonog 

