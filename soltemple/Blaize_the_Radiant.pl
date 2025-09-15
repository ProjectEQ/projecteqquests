# Cleric quests
# items: 4921, 4924, 4922, 4923

sub EVENT_SAY { 
  if ($text=~/hail/i) {
    quest::say("Hail, faithful one. I am Blaize the Radiant. Brother Gavel and I are well known among clerics for our forging skills, but special payment is required for our services. Special [Ingots and Icons] given to our members have been lost, and we will reward whoever retrieves them for us.");
  }
  elsif ($text=~/ingots and icons/i) {
    quest::say("The Ingots and Icons are all named after the virtues of the cleric who held them. The virtues I require are those of the [Reliant], the [Ardent], the [Fervent] and the [Penitent].");
  }
  elsif ($text=~/reliant/i) {
    quest::say("Turgan the Reliant lived in a cabin in the Kithicor woods until there was a great fire. Searching the burned cabins there may turn something up. He always loved Lake Rathetear as well. Bring me the Ingot of the Reliant, the Icon of the Reliant, and one Enchanted Platinum Bar and I will forge them into a reward for you.");
  }
  elsif ($text=~/ardent/i) {
    quest::say("Theo the Ardent was in constant war with a gnome necromancer in Befallen named Babbinsbort, but he never could defeat him. Poor Theo drown on an expedition to Everfrost when the ice of the frozen river gave way underneath him. Bring me the Ingot of the Ardent, the Icon of the Ardent, and 1 Galvanized Platinum Bar and I will forge them into a reward for you.");
  }
  elsif ($text=~/fervent/i) {
    quest::say("Jovan the Fervent was always prone to vice. He lost his ingot in a game of Kings Court with an aviak named Gull in the Ocean of Tears. After that he became a drunkard and it has been said he lurks around the bars in Highpass Hold. Bring me the Ingot of the Fervent, the Icon of the Fervent, and 1 Vulcanized Platinum Bar and I will forge them into a reward for you.");
  }
  elsif ($text=~/penitent/i) {
    quest::say("Astrid the Penitent often visited the frogloks of Upper Guk. She once told me her ingot was hidden underwater there. I found that strange because she couldn't swim. She was also a good friend to the Kerrans of Kerra Ridge, where she lost her life fighting against the Erudite hereitic Maugarim. Bring me the Ingot of the Penitent, the Icon of the Penitent, and one Magnetized Platinum Bar and I will forge them into a reward for you.");
  }
}

sub EVENT_ITEM {
  if (quest::handin({19001 => 1, 19002 => 1, 16507 => 1})) { # Items: Ingot of the Reliant, Icon of the Reliant, Enchanted Platinum Bar
    quest::say("Well done! Please take these boots as your reward.");  # text made up
    quest::summonitem(4921); # Item: Boots of the Reliant
    quest::faction(415,15); # Faction: Temple of Solusek Ro
    quest::faction(416,-15); # Faction: Shadowed Men
    quest::exp(1000);
  }
  elsif (quest::handin({19007 => 1, 19008 => 1, 19049 => 1})) { # Items: Ingot of the Penitent, Icon of the Penitent, Magnetized Platinum Bar
    quest::say("Well done! Please take these greaves as your reward.");  # text made up
    quest::summonitem(4924); # Item: Greaves of the Penitent
    quest::faction(415,15); # Faction: Temple of Solusek Ro
    quest::faction(416,-15); # Faction: Shadowed Men
    quest::exp(1000);
  }
  elsif (quest::handin({19003 => 1, 19004 => 1, 19047 => 1})) { # Items: Ingot of the Ardent, Icon of the Ardent, Galvanized Platinum Bar
    quest::say("Well done! Please take these gauntlets as your reward.");  # text made up
    quest::summonitem(4922); # Item: Gauntlets of the Ardent
    quest::faction(415,15); # Faction: Temple of Solusek Ro
    quest::faction(416,-15); # Faction: Shadowed Men
    quest::exp(1000);
  }
  elsif (quest::handin({19005 => 1, 19006 => 1, 19048 => 1})) { # Items: Ingot of the Fervent, Icon of the Fervent, Vulcanized Platinum Bar
    quest::say("Well done! Please take these vambraces as your reward.");  # text made up
    quest::summonitem(4923); # Item: Vambraces of the Fervent
    quest::faction(415,15); # Faction: Temple of Solusek Ro
    quest::faction(416,-15); # Faction: Shadowed Men
    quest::exp(1000);
  }
}