####################
# Prashnak.pl - 
#
# Zone: Grobb - grobb
#
# Quests: Spiritcharmers Armor, Spiritcharmer Final Job (Staff)
#
# Revised by RealityIncarnate 2-29-08; restored to Grobb quests

sub EVENT_SAY {

   if ($text=~/Hail/i) {
      quest::say("Hullo $name, who yoo be? You need be a [Shaman] or me not talk to yoo");
   }

   if ($text=~/i am a shaman/i) {
      quest::say("You is Shaman? Well me is too so I can give yoo some tings to do if yoo want to make yer own [armor]");
   }

   if ($text=~/what armor/i) {
      quest::say("Me can tell yoo where to get tings to craft yer own armor. Yoo den take dese tings with dis armor kit and combine dem. When you have yer armor material take it too da forge and with da pattern I give yoo to make yer armor. I can give yoo recipe fer [Coif], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics]. When yoo ready yoo tell me whut piece you [want to craft]");
   quest::summonitem(61095); # Spiritcharmers Assembly Kit
   }

   if ($text=~/want to craft coif/i) {
      quest::say("Here is yer pattern, once yoo have combined 2 Bricks of Crude Bronze, 1 Ruined Wolf Pelt, 1 Fire Beetle Eye and 1 Water Flask in yer kit place it in da forge along with dis pattern to create yer Spiritcharmer Chainmail Coif");
   quest::summonitem(22671); # An Enchanted Coif Pattern
   }

   if ($text=~/want to craft bracers/i) {
      quest::say("Go out into da forest and seek out 1 Brick of Crude Bronze, 2 Snake Fangs, 1 Zombie Skin and 1 Short Ale. Once yoo have combined dem in yer kit to make da bracer material take it to a forge along with dis pattern to create yer Spiritcharmer Chainmail Bracer.");
   quest::summonitem(22672); # An Enchanted Bracer Pattern
   }

   if ($text=~/want to craft sleeves/i) {
      quest::say("If Sleeves are what yoo wish to craft yoo will need to get 2 Bricks of Crude Bronze, 1 Burned Out Lightstone, 1 Black Mamba Skin and 1 Bottle of Milk den combine dem in yer kit to fashion da necessary material. Take dis pattern to da nearest forge with that material to create yer Sleeves of the Spiritcharmer.");
   quest::summonitem(22673); # An Enchanted Sleeves Pattern
   }

   if ($text=~/want to craft boots/i) {
      quest::say("If yoo want to make Boots of da Spiritcharmer yoo will need 3 Bricks of Crude Bronze, 1 Giant Wood Spider Femur, 1 Ruined Bear Pelt and 1 Snake Egg. Combine dem together to make yer mold and put it in da forge along with dis pattern to make yer boots.");
   quest::summonitem(22674); # An Enchanted Boots Pattern
   }

   if ($text=~/want to craft legplates/i) {
      quest::say("If yoo wants leggings go get 4 Bricks of Crude Bronze, 2 Snake Eggs, 1 Low Quality Bear Skin and 1 Red Wine den combine dem in yer kit to create yer Legplates material.");
   quest::summonitem(22675); # An Enchanted Legplates Pattern
   }

   if ($text=~/want to craft gauntlets/i) {
      quest::say("To create da Gauntlet materials please collect 3 Bricks of Crude Bronze, 1 Fresh Fish, 1 Spider Venom Sac and 2 Bat Wings. When yoo done and have made yer material put it in da forge with dis pattern to make yer gauntlets.");
   quest::summonitem(22676); # An Enchanted Gauntlets Pattern
   }

   if ($text=~/want to craft tunic/i) {
      quest::say("I'm happy to see that yer training is coming along so well $name. I have no doubt in my mind that yoo are ready to craft yer Tunic. Go collect 5 Bricks of Crude Bronze, 1 Garter Snake Tongue, 1 Ruined Bear Pelt, 1 Calcified Ulna, 1 Giant Snake Fang and 1 Calcified Foot Bones. Come back after yoo are finished, I have a [job] for yoo.");
   quest::summonitem(22677); # An Enchanted Tunic Pattern
   }

   if ($text=~/what job/i) {
      quest::say("I want yoo too get some tings for me that I need for me special trollie. Get me 2 Woven Grass Amulets, 1 Black Mamba Skin, 1 Blood Drenched Cloak and I will give you a nice shiny ting.");
   }

}

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount, 16166 => 1, 14550 => 2, 22620 => 1)) { # Woven grass amulet x 2, black mamba skin, blood drenched cloak
      quest::summonitem(61100); # Staff of The Spiritcharmer
      quest::exp(100);

   } else {

      quest::say("I have no need for this $name, you can have it back.");
      plugin::return_items(\%itemcount);

   }

}

#END of FILE Zone:grobb  ID: 40074