# items: 51121, 51122, 14550, 1369, 18756, 13585, 18148, 13113
sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18756)) {
    $client->Message(15, "A sly looking Dark Elf turns to address you. 'Come to me, young Cleric. I am Perrir Zexus. Read the note in your inventory and hand it to me so that you may begin on the path of the Cleric True power can be yours should you have the will to train hard enough!'");
  }
}

sub EVENT_SAY {
  if($faction >5) {
    quest::say("You are worthless and pathetic! You could never be of service to our temple!  Begone before your innards decorate our walls!");
  }
  elsif($faction == 5) {
    quest::say("Although I sense the hate building within you, you have not yet done enough service to this temple to be trusted!");
  }
  elsif($text=~/hail/i) {
    quest::say("Salutations, $name! Your devotion to our Lord Innoruuk is evident in your actions and on your soul. As a member of the Spires of Innoruuk, you are required to obtain and wear the symbol of your station among the clergy. I can award you the [hematite symbol of Innoruuk] worn by the initiates of the Spires.");
  }
  elsif($text=~/hematite symbol of innoruuk/i) {
    quest::say("The forest beyond the gates of our grand city has been shaped by the magic of our Lord Innoruuk to be more hospitable to our kind. There are halfling druids in the service of Karana who have set up shrines there in hopes of restoring the forest to its former state. They could never succeed in their task with their feeble powers granted by their insignificant god, yet still, they are a nuisance. Bring me four of the holy symbols worn by the druids and I shall grant you the initiate symbol of Innoruuk.");
  }
  elsif($text=~/trades/i) {
    quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
    quest::summonitem(51121); # Item: Tradeskill Basics : Volume I
  }
  elsif($text=~/second book/i)  {
    quest::say("Here is the second volume of the book you requested, may it serve you well!");
    quest::summonitem(51122); # Item: Tradeskill Basics : Volume II
  }
}

sub EVENT_ITEM {
  if($faction < 5 && plugin::check_handin(\%itemcount, 14550 => 4)) { #Woven Grass Amulets
    quest::emote("laughs. 'Here, take this then!  You are now and initiate of Innoruuk.  Speak with Ithvol K`Jasn for further advancement.'"); #text made up
    quest::summonitem(1369); #Initiate Symbol of Innoruuk
    quest::exp(2000);
    quest::ding();
    quest::faction(278, 7);  #King Naythox Thex
    quest::faction(340, 50);  #Priests of Innoruuk
    quest::faction(226, -12);  #Clerics of Tunare
    quest::faction(341, -7); #Priests of Life
    quest::faction(362, -17); #Priests oif Marr
    quest::faction(1522, -200); #Primordial Malice
  }
  if(plugin::check_handin(\%itemcount, 18756 => 1)) { #Tattered Note
    quest::say("Welcome, child of Hate. I am Perrir Zexus, High Priest. We all draw power from the very source that created us, the will of Innoruuk. Here, put on this tunic. It is the tunic of our guild. Once you are ready to begin your training please make sure that you see High Priest Alexandrian, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
    quest::ding();
    quest::summonitem(13585); #Crimson Training Tunic*
    quest::exp(100);
    quest::faction(340, 100);  #Priests of Innoruuk
    quest::faction(278, 15);   #King Naythox Thex
    quest::faction(362, -35);  #Priests of Marr
    quest::faction(226, -25);   #Clerics of Tunare
    quest::faction(341, -15);  #Priests of Life
    quest::faction(1522, -400); #Primordial Malice
  }
  if(plugin::check_handin(\%itemcount, 18148 => 1)) { #Letter of recommendation
    quest::say("$name, eh? My sister has a keen perception for seeing into a person's soul. You may store an abundance of hate, but hate can be devoted to different ideals. Prove to me your devotion to our Lord Innoruuk by bringing me the skullcap of a Leatherfoot Raider who has invaded our forest. Go, $name, and do as I have requested!");
    quest::ding();
    quest::faction(340, 100);  #Priests of Innoruuk
    quest::faction(226, -25);   #Clerics of Tunare
    quest::faction(341, -15);  #Priests of Life
    quest::faction(1522, -400); #Primordial Malice
    quest::faction(278, 15);   #King Naythox Thex
    quest::faction(362, -35);  #Priests of Marr
  }
  if(plugin::check_handin(\%itemcount, 13113 => 1)) { #Leatherfoot Skullcap
    quest::say("Fine work $name! You are well on your way to reaping the rewards of the Spires of Innoruuk.");
    quest::ding();
    quest::exp(100);
    quest::faction(340, 10);  #Priests of Innoruuk
    quest::faction(226, -2);   #Clerics of Tunare
    quest::faction(341, -1);  #Priests of Life
    quest::faction(1522, -40); #Primordial Malice
    quest::faction(278, 1);   #King Naythox Thex
    quest::faction(362, -3);  #Priests of Marr
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:neriakc  ID:42084 -- Perrir_Zexus
