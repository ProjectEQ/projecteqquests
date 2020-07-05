# items: 12408, 4260, 18208, 4261, 14793, 14811, 10032, 14831
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("What is it you seek within the tower ? Could it be that you are a new apprentice ? If so, you are required to don the [apprentice skullcap]");  
  }
  if ($text=~/apprentice/i){
    quest::say("All new members of the Brood of Kotiz are required to don the [apprentice skullcap]. To earn one, a new apprentice is required to fetch four brains for further experiments. Not just any four brains, mind you, but the brains of [sarnak] hatchlings.");
  } 
  if ($text=~/sarnak/i) {
    quest::say("Sarnak ? Do not speak loudly, that name. If you seek information on the sarnak, read the tome of this tower. The tower librarian should be found within.");  
  }
  if ($text=~/second rank skullcap/i) {
    quest::say("Looking for the second rank skullcap ? Look no further, but be prepared to earn it. I seek a [faded tapestry]. Now, too, so do you.");
  }
  if ($text=~/faded tapestry/i) {
    quest::say("I have heard reports of such a thing found upon Sarnak hatchlings. They must have scampered from the safety of their dwelling with their master's property. I would like to see this tapestry, but only when it has been mended. I need find a necromancer who is [adept at tailoring]."); 
  }
  if ($text=~/adept at tailoring/i) {
    quest::say("If you are a member of the Brood and wish to assist you may seek out this tapestry. Find the Torn and Ripped pieces and take them both to a sewing kit. Return with the mended tapestry and your first rank skullcap and I shall see that you are rewarded with coin and a second rank skullcap");
  }
}

# 4 sarnak hatchling brains, returns necro skull cap 1, raises brood of kotiz and legions of cabilis
# mended tapestry + necro skull cap1, raises brood of kotiz and legions of cabilis
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12408 => 4)) { 
    quest::say("Good work, my young apprentice. You will make a fine addition to our ranks. Here is your first apprentice skullcap. Wear it as a sign of our circle. Do not lose it. Someday you shall wear a necromancer skullcap, but next shall come the [second rank skullcap]."); 
    quest::exp(100); 
    quest::faction(441,20); # Faction: Legion of Cabilis
    quest::faction(443,20); # Faction: Brood of Kotiz
    quest::summonitem(4260); # Item: Apprentice Skullcap - 1st Rank
  }
  elsif (plugin::check_handin(\%itemcount, 4260 => 1, 18208 => 1)) {
    quest::say("A job well done, apprentice. Your fine service shall earn you the second circle apprentice skullcap. I would advise you to forget this tapestry, it is nothing more than an ancient rug of no importance.");
    quest::exp(120); 
    quest::faction(441,20); # Faction: Legion of Cabilis
    quest::faction(443,20); # Faction: Brood of Kotiz
    quest::summonitem(4261); # Item: Apprentice Skullcap - 2nd Rank
  }
  elsif (plugin::check_handin(\%itemcount, 14793 => 1)) {
    quest::emote("snatches the paper from your hand and hisses in anger. Without even looking at the paper he growls");
    quest::say("WHAT?! What is this tra... He stares down at the paper, mouth hanging open wide in disbelief. He finally continues, saying, Very well, then. If you wish to know confidence I have a task for you. Our hated enemies, the sarnak, have a tome we have sought to return to our libraries for centuries. At this point, we believe it to be found in a small fortress they maintain near the Great Lake. One of their scholars will most likely have it on their person. Bring it to me along with two star rubies.");
  }
  elsif (plugin::check_handin(\%itemcount, 14811 => 1, 10032 => 2)) {
     quest::say("Well done");
     quest::summonitem(14831); # Item: Glosk's Reference: Greaves
     quest::ding();
     quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:cabwest  ID:3435 -- Master_Xydoz
