sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
   if (plugin::check_hasitem($client, 18784)) {
      $client->Message(15,"Before you can fully get your bearings, a sly looking Wood Elf named Tylfon whispers in your direction. 'Welcome. I knew you would come. If you are still interested in joining the rogues, read the note in your inventory and hand it to me when you wish to begin your training.'");
   }
}

sub EVENT_SAY {
   if ($text=~/hail/i) {
      if ($faction <= 7) {
         quest::say("So, you think you have what it takes to be a Scout of Tunare? Come back with two gold and two rusty daggers and I'll make it worth your while.");
      }
      else {
         quest::say("You dare to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away, while you still can.");
      }
   }
   elsif ($text=~/trades/i) {
      if ($faction <= 7) {
         quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
         quest::summonitem(51121);
      }
      else {
         quest::say("You dare to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away, while you still can.");
      }
   }
   elsif ($text=~/second book/i) {
      if ($faction <= 7) {
         quest::say("Here is the second volume of the book you requested, may it serve you well!");
         quest::summonitem(51122);
      }
      else {
         quest::say("You dare to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away, while you still can.");
      }
   }
   elsif ($text=~/gem of tunare/i) {
      if ($faction <= 7) {
         quest::say("The bright green Gem of Tunare was discovered by the Scouts of Tunare in the trunk of a great tree. The lightning streaked down to split the tree in twain and there, inside, was the gem, Tunare's gift to the people of Kelethin. It has no magical properties, but it represents the glory of Tunare. It appears as a small emerald shard. Alas, now it has been stolen by Faldor Hendrys and only his brother [Elmion Hendrys] could know of his whereabouts.");
      }
      else {
         quest::say("You dare to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away, while you still can.");
      }
   }
   elsif ($text=~/elmion hendrys/i) {
      if ($faction <= 7) {
         quest::say("Seek out the Fier'Dal, Elmion. He was last heard telling the local bar patrons that he was off to do some adventuring at the lake near the estate. What that is, I do not know.");
      }
      else {
         quest::say("You dare to speak with a loyal member of the Scouts of Tunare?!! You are truly foolish!! Run away, while you still can.");
      }
   }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 18784 => 1)) { #Tattered Note
      quest::say("Hmm.. I hope you can prove yourself a lot more valuable than you look. Here, throw this on.. it'll help protect you a little. Once you have become a bit more experienced, return to me, I have many things to teach you about advanced combat and some of the various [trades] you will have available to you.");
      quest::summonitem(13535); #Old Worn Gray Tunic*
      quest::ding();
      quest::faction(283,100); #Tunare's Scouts
      quest::exp(100);
   }
   elsif (plugin::check_handin(\%itemcount, 54019 => 1)) {
      quest::emote("scans the note and sizes you up with a look.");
      quest::say("Very well then, I thank you for assisting us. You have shown great bravery in aiding in this mission. Keep this as a symbol of our friendship.");
      quest::summonitem(54022);
      quest::exp(100); 
   }
   elsif (($gold >= 2) && (plugin::check_handin(\%itemcount, 7007 => 1))) {
      quest::say("Well, well. I didn't think you could do it. Here's your cut and don't be surprised that it's not much because it's your first lesson. Remember. the smaller the operation. the bigger the share, and the richest rogues have the tightest lips.");
      quest::summonitem("7021");
      quest::givecash("0","5","0","0");
      quest::faction(283,5);
      quest::exp(100);
   }
   elsif (plugin::check_handin(\%itemcount,  13322=> 1)) {
      quest::say("Excellent job, $name, we will turn you into a rogue of Tunare yet.  Here this is for your trouble.");
      quest::summonitem(3315);
   }
   
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
   plugin::return_items(\%itemcount);
}

#END of FILE Zone:gfaydark  ID:54087 -- Tylfon