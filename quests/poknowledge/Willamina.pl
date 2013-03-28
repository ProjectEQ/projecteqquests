#Willamina.pl
#Willamina's Needles



sub EVENT_SAY {
	if($text=~/Hail/i) {
    quest::say("Hello and good morning. $name.  It's such a lovely day to sit and enjoy the beautiful surroundings. is it not?  I do hope you find what you are looking for here. Not all of us have been so successful in our individual [quests].");
  }
  if($text=~/quests/i) {
    quest::say("The city is full of curious people all searching for something. Many have struggled for a long time to find their reward. Some are not even aware of what is it they are looking for, but will know it when they see it. Would you care to [help] me out? It will only take a moment.");#Liar liar pants on fire!=o
  }
  if($text=~/help/i) {
    quest::say("How wonderful! To pass the time I enjoy sitting under the trees and sewing together luscious fabrics. But now it seems my old sewing needles have all broke or gone dull, and I require a new supply. Bolcen Tendag has promised to purchase and deliver some for me, but he has not yet arrived and I worry about him. If you could locate him and ask him about the needles I would appreciate it.");#Very last bit of this dialog is made up, "about the needles...".  Alla's was cutoff at that point.
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28092 => 1)) {#New Sewing Needles
    quest::emote("takes the needles and smiles. 'Thank you so much, kind stranger. I can't tell you how much you have really helped by doing this for me. It's funny, you know. The entire city seems to be in a happier mood today. I can't quite put my finger on it, but everyone seems to have uplifted spirits. Oh well, thank you again. I have something you may find to be of use to you, if you would be interested. Remember, knowledge is the key to life.'");
    quest::summonitem(28745);#Planar Traveler's Manual
    quest::exp(250);
  }
  plugin::return_items(\%itemcount);  
}#END of FILE Zone:poknowledge  ID:202054 -- Willamina