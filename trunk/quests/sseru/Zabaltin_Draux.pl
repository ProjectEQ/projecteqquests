# Poisoning Brendar
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Enough with the chit chat. Are you or are you not a rogue?");
  }
  if ($text=~/am a rogue/i) {
    quest::say("Good, I need you to serve Seru. There is a member of the Shoulder that is cutting the delivery of supplies to us and he must be stopped. He is a traitor to this city. He must be a sympathizer with the loyalists of Katta. What I need from you is poison. Go make me four vials of Aching Blood. We will see how he likes his wine with some of that in it!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14058 => 4)) {
    quest::emote("takes the poison from you and pours it into a bottle of ale. 'Here, deliver this to Brendar Mynden! Tell him first that I wish to find compromise between our differences to throw him off guard. Then give him the ale to drink. So that I know you were successful bring me that gaudy ring he always wears. I sure do hate that ugly ring.'");
    quest::summonitem(67010);
  }
  elsif (plugin::check_handin(\%itemcount, 29863 => 1)) {
    quest::say("Ha! His gaudy ring! You have done well young rogue. Perhaps you would be an asset to the Eye after all. You can have his nasty ring back, I am sure that it is worthless. Darn thing weighs as much as a Netherbian and is twice as ugly!");
    quest::summonitem(29864);
    quest::faction(96,10); #eye of seru
    quest::faction(139,10); #hand of seru
    quest::faction(142,10); #heart of seru
    quest::faction(284,10); #seru
    quest::faction(141,-30); #haven smugglers
    quest::faction(350,-30); #validus custodus
    quest::faction(206,-30); #magus conlegium
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: sseru ID: 159146 NPC: Zabaltin_Draux

