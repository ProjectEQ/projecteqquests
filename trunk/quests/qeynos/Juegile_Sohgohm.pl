# Arcane Order armor quests
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Why hello there $name! Its not often that I get many visitors to our sacred hall here. I am Juegile Sohgohm, Master Elementalist of the Order of Three. I have studied in these hallowed halls for all of my days. In my spare time I also pride myself as being a mentor for all of our new apprentices. If you are a young [Magician, Wizard or Enchanter] and you hail from the Order of Three house I might have some work for you.");
  }
  if ($text=~/I am a young magician/i) {
    quest::say("Excellent, you must have certainly heard of the [training exercises] all new recruits must undergo."); 
  }
  if ($text=~/I am a young wizard/i) {
    quest::say("Excellent, you must have certainly heard of the [training exercises] all new recruits must undergo.");
  }
  if ($text=~/I am a young enchanter/i) {
    quest::say("Excellent, you must have certainly heard of the [training exercises] all new recruits must undergo.");
  }
  if ($text=~/what training exercises/i) {
    quest::say("The training exercises that I have prepared for my recruits are very necessary for the development of ones intellectual and hunting abilities. You will be presented with a Beginners Sewing Kit first, that will be used to combine a number of different [magical items] to create an infused armor material. Your material can then be combined in a loom with a pattern that I will present you with to create assorted pieces of Arcane Order Armor.");
  }
  if ($text=~/what magical items/i) {
    quest::say("The items that are required for your armor materials will come from all areas of Qeynos, including some of our merchants. When you are ready to collect the items for a specific armor piece please tell me what armor piece you [want] to craft. I can provide you with the material recipes and applicable patterns for Arcane Order [Caps], [Bracers], [Sleeves], [Sandals], [Trousers], [Gloves] and [Robes].");
    quest::summonitem(17271);
  }
  if ($text=~/gloves/i) {
    quest::say("To create your glove material you will need to combine 3 Woven Spider Silks, 1 Shadow Wolf Paw, 1 Puma Skin and 1 Giant Fire Beetle Eye in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Gloves of the Arcane Order.");
    quest::summonitem(22588);
  }
  if ($text=~/sandals/i) {
    quest::say("To create your boot material you will need to combine 3 Woven Spider Silks, 1 Gnoll Jawbone, 2 Gnoll Pup Scalps, and Cloth Sandals in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Sandals of the Arcane Order.");
    quest::summonitem(22585);
  }
  if ($text=~/bracer/i) {
    quest::say("To create your bracer material you will need to combine 1 Woven Spider Silk, 2 Snake Eggs, 1 Large Myotis Bat Ear and a Cloth Wristband in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Bracer of the Arcane Order.");
    quest::summonitem(22584);
  }
  if ($text=~/cap/i) {
    quest::say("To create your cap material you will need to combine 2 Woven Spider Silks, 1 Rabid Wolf Hide, 1 Fire Beetle Leg and a Cloth Cap in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Cap of the Arcane Order.");
    quest::summonitem(22583);
  }
  if ($text=~/trousers/i) {
    quest::say("To create your trouser material you will need to combine 4 Woven Spider Silks, 1 Giant Fire Beetle Carapace, 1 Spider Legs and 1 Matted Lion Pelt in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Trousers of the Arcane Order.");
    quest::summonitem(22587);
  }
  if ($text=~/sleeves/i) {
    quest::say("To create your sleeves material you will need to combine 2 Woven Spider Silks, 2 Giant Whiskered Bat Eyes, and Cloth Sleeves in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Sleeves of the Arcane Order.");
    quest::summonitem(22586);
  }
  if ($text=~/robes/i) {
    quest::say("To create your robe material you will need to combine 5 Woven Spider Silks, 1 Medium Quality Bear Skin, 1 Bandit Sash, 1 Giant Fire Beetle Leg, 1 Golden Bandit Tooth and 1 Cloth Shirt in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Robe of the Arcane Order. I have one more [task] for you to complete young Conlara, so please come see me after you have completed your robe.");
    quest::summonitem(22589);
  }
  if ($text=~/task/i) {
    quest::say("I have heard word that there are numerous gnolls in the hills terrorizing a good friend of mine Rephas. I need you to go to the hills and assist my friend Rephas. Rephas had 3 pages of research he was studying and they were stolen by these gnolls. I need you to retrieve these pages and bring them to Rephas. He will then give you a completed book to return to me. Bring me back the completed book from Rephas and I will surely reward you for your efforts.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,27431 => 1)) {
    quest::say("I knew I could rely on Rephas to finish this research for me. We both know that this would not have been possible without your help young $name . Please take this dagger as a symbol of your dedication to the Order of Three. Your good deeds will surely be known throughout our guildhouse. Good luck to you!");
    quest::exp(5000);
    quest::faction(240,30); # Order of Three
    quest::faction(21,-30); # Bloodsabers
    quest::faction(135,30); # Guards of Qeynos
    quest::faction(235,-30); # Opal Dark Briar
    quest::summonitem(27495);
  }
  else {
    plugin::try_tome_handins(\%itemcount, $class, 'Magician');
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: qeynos ID: 3037 name: Juegile_Sohgohm 