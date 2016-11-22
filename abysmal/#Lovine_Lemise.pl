sub EVENT_SIGNAL {
	quest::emote("looks indecisive for a moment, then says, 'I'll try the malt beer, thanks.'");
}

sub EVENT_SAY {
  if($client->GetGlobal("paladin_epic") ==5 && $text=~/hail/i) {
    quest::say("$name, I am glad you are here. My name is Lovine and the poor soul lying on the bed over here is my good friend Reiya. My friend could use some [" . quest::saylink("assistance") . "].");
  }
  if($client->GetGlobal("paladin_epic") ==5 && $text=~/assistance/i) {
    quest::say("I should probably begin by telling you what happened. Reiya was found a couple of days ago on the shore in Natimbi, face down in the water. The Wayfarers that found him were not sure if he was dead or not, until they brought him here to Abysmal. It appears he was unconcious at the time, since he later awoke on this bed. Something is terribly [" . quest::saylink("wrong") . "] with him though.");
  }
  if($client->GetGlobal("paladin_epic") ==5 && $text=~/wrong/i) {
    quest::say("I'm not sure what is wrong with him, though he constantly fades in and out of consciousness. His speech is erratic when he is awake, and his thoughts do not appear to be in this world. I have a feeling that he is being tormented in some way, but I do not know how or why. I would like you to gather a few things for me, to make a concoction that may awaken Reiya. I will tell you what the [" . quest::saylink("ingredients") . "] are.");
  }
  if($client->GetGlobal("paladin_epic") ==5 && $text=~/ingredients/i) {
    quest::say("I am looking for the following things: a Potameid seaweed strand, blood from a Mastruq Havocblade, the tail of a Noc Fleshfeaster, and the jawbone of Ra'Tuk Screambringer. Place the items in this enchanted potion bag, and return it to me so that we can attempt to awaken Reiya. Please be dilligent in your search, $name.");
    quest::summonitem(69922);	
  }  
}

sub EVENT_ITEM {
  if ($client->GetGlobal("paladin_epic") ==5 && plugin::check_handin(\%itemcount, 69923 => 1)) {
    quest::emote("Thank you for gathering these items $name. This potion will help him very much, however, Reiya will need one more potion to help him gain conciousness. I will need you to bring him a potion of Mist of the Breathless. Go now and bring this quickly, friend.");
	quest::setglobal("paladin_epic_reiya",1,5,"F");	
  }
  plugin::return_items(\%itemcount);
}