sub EVENT_SAY { 
if($text=~/Hail/i){quest::say("It is good to see new blood in our halls. I am the leader of this house. If you are looking for guidance, seek out the masters within. I rarely appoint tasks to new recruits, unless I need to retrieve the [foreign take]."); }
if($text=~/take/i){quest::say("We have rogues operating in a few great cities. We send young rogues to retrieve the monthly take. We have been awaiting the Freeport delivery. The last youth I sent must have been killed along the way. I will need a new runner to [retrieve the chest]."); }
if($text=~/chest/i){quest::say("You seem able enough. Here. Take this note to Freeport. Go through the Commonlands and be careful not to encounter any Freeport guards. There is a network of aqueducts accessible through hidden passages. Search the outside walls of Freeport. Take the note to Giz. She will meet you at night, on an island in the harbor. Good luck.");
quest::summonitem("18844"); }
}

sub EVENT_ITEM { 
 if ($item1=="18752"){
	quest::say("Thanks.");
	quest::summonitem("13581");
	quest::exp("100");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:neriakc  ID:42074 -- Eolorn_J`Axx 

