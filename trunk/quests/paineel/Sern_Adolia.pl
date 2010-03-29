sub EVENT_SAY {
  if($text=~/Hail/i)
  {
    quest::say("I hope you have a good reason for disturbing my contemplations. Perhaps you [seek the knowledge] of those who meditate within this Temple of Fear?");
  }

  if($text=~/I seek knowledge/i)
  {
    quest::say("It is the secrets of Fear you seek, but first you must prove your devotion to our temple. There are pack rats within the city that have a habit of getting into things. Some of these rats have ingested a concoction developed by the necromancers of this great city. The rats have since died and, due to the concoction, their undead corpses now roam the fields. Bring me four livers from these undead rats so that we may examine them.");
  }

  if($text=~/duties/i)
  {
    quest::say("The primary duty of this temple is to spread terror, fright, and dread as a symbol of your devotion to our lord Cazic Thule. We are currently researching a means of summoning avatars of Fright, Terror and Dread, the primary minions of the Faceless in his home plane. Will you [assist me in summoning] the avatar of Fright?");
  }

  if($text=~/assist/i)
  {
    quest::say("In order to summon the avatar of Fright. I require some special components for the ritual. Fetch me the flesh of a zombie. the dust used in the process of mummification. [charred bone chips]. and a [vial of Tunare's Breath].");
  }

  if($text=~/chips/i)
  {
    quest::say("Some time ago a necromancer by the name of Obretl was sent to slay Rathmana Allin and his abomination of an adopted son. Ortallius. Obretl failed in his task and now haunts a small ruin in the desert of Ro cursed by Solusek to wallow in his failure in the form of a burning skeleton. Slay Obretl to free him from his pathetic existence and gather his charred remains.");
  }

  if($text=~/vial/i)
  {
    quest::say("Tunare's Breath is a life-giving potion created by the Fier'Dal Soldiers of Tunare. Seek out the druid Kalayia who is known to wander the Faydarks in search of reagents for potions. Procure from her a vial of Tunare's Breath. Shed her blood if need be.");
  }

}
sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 18019 => 1))
  {
    quest::say("You are welcomed into the fold. Now go out. and prove yourself. young one. You have much to learn about the Dark Truth.");
    quest::summonitem("13573");
    quest::exp("100");
  }
  elsif (plugin::check_handin(\%itemcount, 13270 => 4))
  {
    quest::say("Well done, go now and continue your contemplations of fear. Keep up with your [duties] and you will soon be reaping the rewards granted by our Lord Cazic-Thule!!");
    quest::exp("200");
    quest::faction("143","10");
    quest::faction("56","-30");
    quest::faction("60","-30");
    quest::faction("79","-30");
    quest::faction("112","-30");
  } 
  elsif (plugin::check_handin(\%itemcount, 13074 => 1, 16990 => 1, 14102 => 1, 14103 => 1))
  {
    quest::say("Excellent Job $name. These components will help with our research immeasurably. You will soon be reaping the rewards granted by our Lord Cazic-Thule!! If you want to further assist our research effots, talk to Atdehim Sqonci.");
    quest::summonitem("1437");
    quest::exp("1000");
    quest::faction("143","150");
    quest::faction("56","-30");
    quest::faction("60","-30");
    quest::faction("79","-30");
    quest::faction("112","-30");
   
  } 
  else {
	quest::say("I have no use for this, $name.");
	plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75072 -- Sern_Adolia 

