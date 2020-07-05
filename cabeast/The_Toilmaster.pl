#The Toilmaster is part of The Penance quest, which is for any iksar who has lost the item they received from turning in their newbie note. He is also used for the Granite Pebbles quest.
# items: 24767, 17091, 12660, 12689, 18271, 18272

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Do not bother me unless you wish to join the chain gang. Now go away or I shall have my slaves chop you as they chop this granite!");
  }
 elsif($text=~/hammer of exoneration/i){ #The Penance quest
  quest::emote("hands you a massive hammer and says, 'So, you can read. Good for you. Don't think that you're going to make an impression on me with that rubbish. Let's see if you can handle this hammer like you can that book, whelp.'");
  quest::summonitem(24767); # Item: Hammer of Exoneration
  }
 elsif($text=~/bag/i){ #The Penance quest
  quest::emote("turns his head to focus on you and hands you a dusty bag. He then returns to looking into the distance, just over your left shoulder.");
  quest::summonitem(17091); # Item: Penance Bag
  }
 elsif($text=~/granite pebbles/i){ #Granite Pebbles quest
  quest::say("Ah. Looking for granite pebbles, are we? You must be a Swifttail. I am tired of doing your caste's work when you give nothing in return. Tell you what, I have lost many slaves to escape. If you bash their heads in with your many skills and return at least two busted froglok shackles I will give you one pile of granite pebbles.");
  }
}

sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 12660 => 2)){
  quest::say("A deal is a deal. Here is one pile of granite pebbles. I hope you need more because I know there are more escaped froglok slaves.");
  quest::summonitem(12689); # Item: Pile of Granite Pebbles
  quest::faction(441,2); # Faction: Legion of Cabilis
  quest::faction(440,2); # Faction: Cabilis Residents
  quest::faction(445,2); # Faction: Scaled Mystics
  quest::faction(442,2); # Faction: Crusaders of Greenmist
  quest::faction(444,2); # Faction: Swift Tails
  quest::ding();
  quest::exp(350);
  quest::givecash(12,0,0,0);
 }
 elsif(plugin::check_handin(\%itemcount, 18271 => 1)){ #The Penance quest
  quest::emote("looks at the tome and speaks to you, scowling, 'Very well Broodling, I have a task for you. I should make you work at the feet of my Froglok Slaves, crushing granite, but the lore of the Brood has a specific rite for this situation. Take this book and learn the will of Cazic-Thule. Read it and ask me any questions that you may have before you start your penance. It would be a shame for you to fail at this task as well... though I wouldn't mind destroying you.");
  quest::summonitem(18272); # Item: Rites of Exoneration
 }
  plugin::return_items(\%itemcount);
}

#The Penance quest submitted by Jim Mills. Granite Pebbles quest submitted by cavedude.
