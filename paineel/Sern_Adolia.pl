# items: 51121, 51122, 18019, 13573, 13270, 1437, 13074, 16990, 14102, 14103, 14100
sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18019)) { 
    $client->Message(15, "Sern Adolia glances at you with obvious scorn. 'Are you here to learn the ways of Cazic-Thule? If that is the case, then read the note in your inventory and then hand it to me. If you are not here for such a purpose, I suggest you leave at once lest you anger me further.'");
  }
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I hope you have a good reason for disturbing my contemplations. Perhaps you [seek the knowledge] of those who meditate within this Temple of Fear?");
  }
  if($text=~/I seek knowledge/i) {
    quest::say("It is the secrets of Fear you seek, but first you must prove your devotion to our temple. There are pack rats within the city that have a habit of getting into things. Some of these rats have ingested a concoction developed by the necromancers of this great city. The rats have since died and, due to the concoction, their undead corpses now roam the fields. Bring me four livers from these undead rats so that we may examine them.");
  }
  if($text=~/duties/i) {
    quest::say("The primary duty of this temple is to spread terror, fright, and dread as a symbol of your devotion to our lord Cazic Thule. We are currently researching a means of summoning avatars of Fright, Terror and Dread, the primary minions of the Faceless in his home plane. Will you [assist me in summoning] the avatar of Fright?");
  }
  if($text=~/assist/i) {
    quest::say("In order to summon the avatar of Fright. I require some special components for the ritual. Fetch me the flesh of a zombie. the dust used in the process of mummification. [charred bone chips]. and a [vial of Tunare's Breath].");
  }
  if($text=~/chips/i) {
  quest::say("Some time ago a necromancer by the name of Obretl was sent to slay Rathmana Allin and his abomination of an adopted son. Ortallius. Obretl failed in his task and now haunts a small ruin in the desert of Ro cursed by Solusek to wallow in his failure in the form of a burning skeleton. Slay Obretl to free him from his pathetic existence and gather his charred remains.");
  }
  if($text=~/vial/i) {
    quest::say("Tunare's Breath is a life-giving potion created by the Fier'Dal Soldiers of Tunare. Seek out the druid Kalayia who is known to wander the Faydarks in search of reagents for potions. Procure from her a vial of Tunare's Breath. Shed her blood if need be.");
  }
  if($text=~/trades/i) {
    quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
    quest::summonitem(51121); # Item: Tradeskill Basics : Volume I
  }
  if($text=~/second book/i)  {
    quest::say("Here is the second volume of the book you requested, may it serve you well!");
    quest::summonitem(51122); # Item: Tradeskill Basics : Volume II
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18019 => 1)) { # Harbingers of Fear Guild Note
    quest::say("You are welcomed into the fold. Now go out. and prove yourself. young one. You have much to learn about the Dark Truth. Once you are ready to begin your training please make sure that you see Sadorno Chomosh, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
    quest::summonitem(13573); # Blood Splattered Tunic
    quest::ding();
    quest::faction(265,100); # Heretics
    quest::faction(242,-100); # Deepwater Knights
    quest::faction(254,-100); # Gate Callers
    quest::faction(231,-100); # Craftkeepers
    quest::faction(233,-100); # Crimson Hands
    quest::exp(100);
  }
  elsif (plugin::check_handin(\%itemcount, 13270 => 4)) {
    quest::say("Well done, go now and continue your contemplations of fear. Keep up with your [duties] and you will soon be reaping the rewards granted by our Lord Cazic-Thule!!");
    quest::summonitem(1437); #Initiate Symbol of Cazic Thule
    quest::exp(200);
    quest::faction(265, 10); # Faction: Heretics
    quest::faction(231, -30); # Faction: Craftkeepers
    quest::faction(233, -30); # Faction: Crimson Hands
    quest::faction(242, -30); # Faction: Deepwater Knights
    quest::faction(254, -30); # Faction: Gate Callers
  } 
  elsif (plugin::check_handin(\%itemcount, 13074 => 1, 16990 => 1, 14102 => 1, 14103 => 1)) {
    quest::say("Excellent job, $name. These components will help with our research immeasurably. You will soon be reaping the rewards granted by our Lord Cazic-Thule!! If you want to further assist our research effots, talk to Atdehim Sqonci.");
    quest::summonitem(14100); #Fright Forged Helm
    quest::exp(1000);
    quest::faction(265, 150); # Faction: Heretics
    quest::faction(231, -30); # Faction: Craftkeepers
    quest::faction(233, -30); # Faction: Crimson Hands
    quest::faction(242, -30); # Faction: Deepwater Knights
    quest::faction(254, -30); # Faction: Gate Callers
  } 
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:paineel  ID:75072 -- Sern_Adolia
