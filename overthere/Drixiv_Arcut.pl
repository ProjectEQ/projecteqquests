sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Begone unless you seek the armor of the [trooper]");
    }
  if ($text=~/trooper/i) {
    quest::say("I can provide [boots], [bracer], [guantlets], or [greaves]");
  }
  if ($text=~/boots/i) {
    quest::say("You wish the boots worn by the ancients? Then you must first master the virtue of confidence. For our brothers of the dead, confidence is the virtue that allows them to control the forces that would tear them apart if they knew it not. When a warrior steps, he must be confident, for a weak step cannot crush your enemies. Take this note to the current Harbinger in Cabilis and learn from him.");
    quest::summonitem(14794);
  }
  if ($text=~/bracer/i) {
    quest::say("The bracers of our ancestors embody righteousness. When we strike, and our forearms are soaked in the blood of our enemies, our purpose must be pure. Else that blood will burn our souls and anger that which we live for. Go and find the Archduke in Cabilis and give him my note. He will teach you of righteousness. For if our chosen did not know righteousness, our people would not be. Go!");
    quest::summonitem(14791);
  }
  if ($text=~/guantlets/i) {
    quest::say("Our hands are our most useful and deadly instruments, after our minds. When we use them other than in service of our lord and ancestors, our actions are false. Without knowing righteousness we can never be sure if our actions are in the name of fear. The Chosen, the Crusaders of Greenmist, know fear intimately. Their actions are never without the blessing of our lord. Take this note to the Archduke. He will recognize my writing and instruct you.");
    quest::summonitem(14792);
  }
  if ($text=~/greaves/i) {
    quest::say("Our legs move us forward. If we move with hesitance we will surely fall and leave our charge exposed. Before you can wear the greaves, you must learn from the Brood of Kotiz. For if they did not wield their powers over the dead with confidence, their life forces would be sucked from them instantly, leaving them empty husks. Take this note to the Harbinger and listen to his instructions.");
    quest::summonitem(14793);
  }
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14813 =>1,3064 =>1 )) {
    quest::summonitem(4983);
    quest::ding();
    quest::exp(10000);
  }  
  if (plugin::check_handin(\%itemcount, 14808 =>1, 3061 =>1  )) {
    quest::summonitem(4980);
    quest::ding();
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 14831 =>1, 3063 =>1 )) {
    quest::summonitem(4982);
    quest::ding();
    quest::exp(10000);
   }
   if (plugin::check_handin(\%itemcount, 14809 =>1,3062 =>1)) {
     quest::summonitem(4981);
     quest::ding();
     quest::exp(10000);
   }
  
  plugin::return_items(\%itemcount);
  }
