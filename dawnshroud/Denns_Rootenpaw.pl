# items: 69946, 69947, 69948, 69949
sub EVENT_SAY { 
 if($text=~/Hail/i){
  quest::say("Can I help you? Can't you see that I'm busy right now."); 
 }
}

sub EVENT_ITEM {
  if ($client->GetGlobal("paladin_epic") ==5 && plugin::check_handin(\%itemcount, 69946 => 1)) {
    quest::say("What is this? Drema's fingerbone? While I don't usually help paladins, in this situation I will help you and Mikhal investigate this tragedy. Here is what will need to be done: Take this bag and collect three dark skeleton remains, found somewhere here in Luclin. Bring them back to me so that I can cast a dark spell on it. The spell will turn bones into powder, a powder that should revive Drema long enough to have her explain what occurred. Go now and find these bones.");
	quest::summonitem(69947); # Item: Bone Collector's Bag
  }
  if ($client->GetGlobal("paladin_epic") ==5 && plugin::check_handin(\%itemcount, 69948 => 1)) {
	quest::say("Very well, I have turned this collection of bones into powder. Take this powder to Drema and see if it awakens her. Good luck, knight.");
	quest::summonitem(69949); # Item: Enchanted Bone Powder
  }  
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:dawnshroud  ID:174098 -- Denns_Rootenpaw 

