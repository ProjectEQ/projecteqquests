#Ithvol K-Jasn.pl
#Innoruuk Disciple/Innoruuk Regent
# items: 12497, 1369, 1370, 12499, 12498, 19029, 1371

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Hail, $name! I sense the gift of hatred in your aura. What status do you hold within these Spires?");
  }
  if(plugin::check_hasitem($client, 1369)) { #Initiate Symbol of Innoruuk
    if($text=~/initiate/i) {
      quest::say("Well met, Initiate $name. If you desire to raise your station in this temple, I have a task for you. Are you willing to accept the task I am about to set before you?");
    }
    if($text=~/willing/i) {
      quest::say("As an initiate of the Spires, you have proven your hatred of the halflings who are desecrating our forest with their feeble shrines and camps. They persist in their hopeless task and seem to anticipate many of our tactics against them. Go out into the Nektulos and slay the one called Master Whoopal. Take his head to Draxiz N'Ryt so that he may probe the brain.");
    }
  }
  if(plugin::check_hasitem($client, 1370)) { #Disciple Symbol of Innoruuk
    if($text=~/disciple/i) {
      quest::say("I have an important task for a disciple of Hate such as yourself. It is no secret that King Naythox Thex wishes to expand the Teir'Dal Empire to the continent of Faydwer. We have a camp established in the Lesser Faydark near the stronghold of the vampire lord, Mayong Mistmoore. The camp is constantly under siege by the Fier'Dal and Koada'Dal and must rely on the support of Neriak for supplies necessary to survival. Are you willing to serve your King and Empire by delivering the provisions?");
    }
    if($text=~/deliver the provisions/i) {
      quest::say("The provisions are crated and prepared for shipment by Dran Slug Rembor. Go to his establishment in the Foreign Quarter and tell him Ithvol sent you. Make haste, young disciple of Hate! The fate of the Empire hangs upon our support of the Faydark Camp!");
    }
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12497 => 1, 1369 => 1)) { #Head of a Halfling Spy, Initiate Symbol of Innoruuk
    quest::emote("You have focused the hate within you and discovered that hate and rage are not the same. Hate can be calculating and deceptive. For your service in defending the Kingdom of King Naythox Thex from the halfling invaders, I award you the disciple symbol of Innoruuk. Wear it with pride, $name.");
    quest::summonitem(1370); #Disciple Symbol of Innoruuk
    quest::exp(4000);
    quest::faction(278, 10);  #King Naythox Thex
    quest::faction(340, 10);  #Priests of Innoruuk
    quest::faction(226, -30);  #Clerics of Tunare
    quest::faction(341, -30); #Priests of Life
    quest::faction(362, -30); #Priests of Marr
    quest::faction(1522, -30); #Primordial Malice
  }
  if(plugin::check_handin(\%itemcount, 12499 => 1, 12498 => 1, 19029 => 1, 1370 => 1)) { #Voucher of Service to Naythox, Swiftmoon's Head, Receipt for Provisions Crate, Disciple Symbol of Innoruuk
    quest::say("Your devotion to the ideals of hatred and your service to our King Naythox Thex has proven your usefulness within these spires and within our great city. I award you the Regent Symbol of Innoruuk. Congratulations, Regent $name!");
    quest::summonitem(1371);#Regent Symbol of Innoruuk
    quest::exp(8000);
    quest::faction(278, 10);  #King Naythox Thex
    quest::faction(340, 10);  #Priests of Innoruuk
    quest::faction(226, -30);  #Clerics of Tunare
    quest::faction(341, -30); #Priests of Life
    quest::faction(362, -30); #Priests of Marr
    quest::faction(1522, -30); #Primordial Malice
  }
  plugin::return_items(\%itemcount);
}
#Done
