# items: 14794, 14791, 14792, 14793, 14813, 3064, 4983, 14808, 3061, 4980, 14831, 3063, 4982, 14809, 3062, 4981
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Begone unless you seek the armor of the [trooper]");
    }
  if ($text=~/trooper/i) {
    quest::say("I can provide [boots], [bracer], [gauntlets], or [greaves]");
  }
  if ($text=~/boots/i) {
    quest::say("You wish the boots worn by the ancients? Then you must first master the virtue of confidence. For our brothers of the dead, confidence is the virtue that allows them to control the forces that would tear them apart if they knew it not. When a warrior steps, he must be confident, for a weak step cannot crush your enemies. Take this note to the current Harbinger in Cabilis and learn from him.");
    quest::summonitem(14794); # Item: Illegible Note: Boots
  }
  if ($text=~/bracer/i) {
    quest::say("The bracers of our ancestors embody righteousness. When we strike, and our forearms are soaked in the blood of our enemies, our purpose must be pure. Else that blood will burn our souls and anger that which we live for. Go and find the Archduke in Cabilis and give him my note. He will teach you of righteousness. For if our chosen did not know righteousness, our people would not be. Go!");
    quest::summonitem(14791); # Item: Illegible Note: Bracer
  }
  if ($text=~/gauntlets/i) {
    quest::say("Our hands are our most useful and deadly instruments, after our minds. When we use them other than in service of our lord and ancestors, our actions are false. Without knowing righteousness we can never be sure if our actions are in the name of fear. The Chosen, the Crusaders of Greenmist, know fear intimately. Their actions are never without the blessing of our lord. Take this note to the Archduke. He will recognize my writing and instruct you.");
    quest::summonitem(14792); # Item: Illegible Note: Gauntlets
  }
  if ($text=~/greaves/i) {
    quest::say("Our legs move us forward. If we move with hesitance we will surely fall and leave our charge exposed. Before you can wear the greaves, you must learn from the Brood of Kotiz. For if they did not wield their powers over the dead with confidence, their life forces would be sucked from them instantly, leaving them empty husks. Take this note to the Harbinger and listen to his instructions.");
    quest::summonitem(14793); # Item: Illegible Note: Greaves
  }
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14813 =>1,3064 =>1 )) {
    quest::summonitem(4983); # Item: Trooper Scale Boots
    quest::ding();
    quest::exp(10000);
  }  
  if (plugin::check_handin(\%itemcount, 14808 =>1, 3061 =>1  )) {
    quest::summonitem(4980); # Item: Trooper Scale Bracers
    quest::ding();
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 14831 =>1, 3063 =>1 )) {
    quest::summonitem(4982); # Item: Trooper Scale Greaves
    quest::ding();
    quest::exp(10000);
   }
   if (plugin::check_handin(\%itemcount, 14809 =>1,3062 =>1)) {
     quest::summonitem(4981); # Item: Trooper Scale Gauntlets
     quest::ding();
     quest::exp(10000);
   }
  
  plugin::return_items(\%itemcount);
  }
