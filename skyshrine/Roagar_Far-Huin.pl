#Zone: Skyshrine
#Short Name: skyshrine
#Zone ID: 114
#
#NPC Name: Roagar Far`Huin
#NPC ID: 114281
#
#All quest text is entirely made up as I could not find actual dialog.

sub EVENT_SAY {
   if ($faction == 1) { #req ally CoV
      if($text=~/hail/i) {
         quest::say("I seek one who fights with rage in their eyes and fury in their arms, are you such a Berserker?");
      }
      if ($text=~/i am a berserker/i) {
         quest::say("I will aid you with armor befitting one of your temperment. I have a helm, leggings, tunic, bracer, boots, sleeves, and gauntlets that can be yours if you complete my tasks");
      }
      if ($text=~/helm/i) {
         quest::say("Your enemies shall shake with fear at the sight of the helm I shall forge.  I only require you to obtain three Crushed Corals and an Unadorned Chain Helm.");
      }
      if ($text=~/tunic/i) {
         quest::say("I shall forge a tunic and infuse it with the rage of Dozekar the Cursed.  You must bring me three Flawless Diamonds and an Unadorned Chain Tunic.");
      }
      if ($text=~/sleeves/i) {
         quest::say("Your fury shall be unmatched when wearing the sleeves I shall create.  Provide me with three Flawed Emeralds and a pair of Unadorned Chain Vambraces.");
      }
      if ($text=~/bracer/i) {
         quest::say("To forge a mighty bracer, I will need three Crushed Flame Emeralds and an Unadorned Chain Bracer.");
      }
      if ($text=~/gauntlets/i) {
         quest::say("You shall crush the life from your enemies while wearing the gauntlets I can create from three Crushed Topazes and a pair of Unadorned Chain Gauntlets.");
      }
      if ($text=~/leggings/i) {
         quest::say("Fury and swiftness shall be your ally while wearing leggings of my forging.  Bring me three Flawed Sea Sapphires and a pair of Unadorned Chain Leggings and they shall be yours");
      }
      if ($text=~/boots/i) {
         quest::say("To better pursue those who flee before you, wear these boots.  I will need three Crushed Black Marbles and a pair of Unadorned Chain Boots to complete them.");
      }
   }
   else {
      quest::say("You must prove your dedication to the Claws of Veeshan before I will speak to you.");
   }
}

sub EVENT_ITEM {
   if ($faction == 1) { #req ally CoV
         if (plugin::check_handin(\%itemcount, 25831 => 3, 24968 => 1)) { #helm
         quest::summonitem(55324);
      }
      elsif (plugin::check_handin(\%itemcount, 25814 => 3, 24963 => 1)) { #tunic
         quest::summonitem(55325);
      }
      elsif (plugin::check_handin(\%itemcount, 25821 => 3, 24965 => 1)) { #sleeves
         quest::summonitem(55326);
      }
      elsif (plugin::check_handin(\%itemcount, 25838 => 3,24967  => 1)) { #bracer
         quest::summonitem(55327);
      }
      elsif (plugin::check_handin(\%itemcount, 25832 => 3, 24969 => 1)) { #guantlet
         quest::summonitem(55328);
      }
      elsif (plugin::check_handin(\%itemcount, 25825 => 3, 24964 => 1)) { #leggings
         quest::summonitem(55329);
      }
      elsif (plugin::check_handin(\%itemcount, 25833 => 3, 24966 => 1)) { #boots
         quest::summonitem(55330);
      }
      else {
         plugin::return_items(\%itemcount);
         return 1;
      }
      quest::emote("smiles wildly as he hands you your reward.");
      quest::say("Well done, $name.");
      quest::exp(175000);
      quest::faction(42,30); # CoV
      quest::faction(362,30); # Yelinak
      quest::faction(189,-60); # Kromzek
   }
   else {
      quest::say("I do not know you well enough to entrust such an item to you, yet.");
   }
}

#END of FILE Zone: skyshrine ID:114281 -- Roagar_Far`Huin 