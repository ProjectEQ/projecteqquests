sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Welcome! I am Vurgo, follower of Solusek Ro and holder of the [harvester] and the [Words of Darkness].");
}
if($text=~/what harvester/i){
quest::say("I can forge you one, but you will need to bring me the correct [scythe components].");
}
if($text=~/what scythe components/i){
quest::say("The first thing I need is a shadowed scythe from our mortal enemies, the shadowed men.");
}
if($text=~/what words of darkness/i){
quest::say("I can scribe for you the Words of Darkness, but you will need to bring me the correct [word components].");
}
if($text=~/what word components/i){
quest::say("The first thing that I need is a shadowed book from our mortal enemies, the shadowed men.");
}
}
sub EVENT_ITEM {
	if($itemcount{10538} == 1 && $itemcount{10031} == 1 && $itemcount{7331} == 1 && $itemcount{5103} == 1) { # A Fungus Eye, Fire Opal, Shadowed Knife, Shadowed Scythe
		quest::summonitem("5316"); # Harvester
	} elsif($itemcount{10536} == 1 && $itemcount{10537} == 1 && $itemcount{10529} == 1) { # Book of Darkness, Book of Frost, Shadowed Book
		quest::summonitem("10527"); # Words of Darkness
	} else {
		quest::say("I don't need this.");
		if($item1 > 0){quest::summonitem("$item1");} 
		if($item2 > 0){quest::summonitem("$item2");} 
		if($item3 > 0){quest::summonitem("$item3");} 
		if($item4 > 0){quest::summonitem("$item4");}
		if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {quest::givecash($copper, $silver, $gold, $platinum);}
	}
}

#END of FILE Zone:soltemple  ID:80016 -- Vurgo 
