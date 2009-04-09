sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("You may speak if you are a member of this house of warriors. Let it be of something important. Do not waste my time. Or wait. Perhaps you are a young warrior. If you are I have a [little test] for you."); }
}
sub EVENT_ITEM { 
 if ($item1=="18751"){
	quest::say("Welcome to the Indigo Brotherhood. Hmmm. you're a bit scrawny. but we'll work with it. Here's your guild tunic. Defend Neriak and all her allies. For the time being this list includes our [new friends].Go see Yegek. one of our trainers. Hopefully he can mould you into something resembling a warrior.");
	quest::summonitem("13580");
	quest::exp("100");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:neriakb  ID:41066 -- Seloxia_Punox 

