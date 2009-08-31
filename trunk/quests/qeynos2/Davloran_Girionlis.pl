sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Good day $name. I am Davloran Girionlis Holy Knight in service to the Prime Healer Rodcet Nife. I pride myself on being responsible for ridding my homeland of unimaginable evil during my fighting days. Nowadays I just like to train new Temple of Life paladin [recruits].");
  }
  if($text=~/recruits/i) {
    quest::say("We have a number of new recruits entering our guild hall every single day. For this reason I have developed a set of exercises that test the hunting and gathering skils of all young paladins. If you are a [Paladin of Rodcet] I might be able to present these tests to you as well.");
  }
  if($text=~/paladin of rodcet/i) {
    quest::say("Fantastic $name, let me explain to you how the exercises work. You will combine a number of magical items that you will gather from our city and in the training areas and combine them in a Lightbringers Assembly Kit. Certain items used in certain quantities will combine into a specific armor material. These materials can then be taken with the appropriate mold to a forge and be combined together to create a piece of Lightbringers Armor. I can present you with the material recipes along with the correct armor molds for each armor piece once you are [ready to begin your exercises].");
  }
  if($text=~/ready to begin/i) {
    quest::say("Very well $name. Please take this Lightbringers Assembly Kit. When you are ready to gather the items for a specific armor piece you must only tell me what piece you want to craft. I can provide you with the recipes and armor molds for Lightbringers Platemail [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
    quest::summonitem(17266);
  }
  if($text=~/helms/i) {
    quest::say("To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Whiskered Bat Backbone, 1 Chunk of Meat and 1 Ale in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Lightbringer.");
    quest::summonitem(22610);
  }
  if($text=~/bracers/i) {
    quest::say("To create your bracer material you will need to combine 1 Bricks of Crude Iron, 1 Skeleton Tibia, 1 Gnoll Pup Scalp and 1 Ale in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Lightbringer.");
    quest::summonitem(22611);
  }
  if($text=~/armguards/i) {
    quest::say("To create your armguards material you will need to combine 2 Bricks of Crude Iron, 2 Fire Beetle Carapaces, 1 Gnoll Jawbone and 1 Raw Bamboo in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Lightbringer.");
    quest::summonitem(22613);
  }
  if($text=~/boots/i) {
    quest::say("To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Wisp Essence, 2 Rat Eyes in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boots of the Lightbringer.");
    quest::summonitem(22612);
  }
  if($text=~/greaves/i) {
    quest::say("To create your greaves material you will need to combine 4 Bricks of Crude Iron, 1 Lion Tail, 1 Ruined Cat Pelt, 1 Bottle and 1 Lightstone in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Lightbringer.");
    quest::summonitem(22614);
  }
  if($text=~/gauntlets/i) {
    quest::say("To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Black Wolf Tooth, 1 Mist Wolf Pelt, and 2 Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Lightbringer.");
    quest::summonitem(22615);
  }
  if($text=~/breastplates/i) {
    quest::say("To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Rat Eyes, 1 Fire Beetle Eye, 1 Golden Bandit Tooth, 1 Medium Quality Bear Skin and 1 Severed Gnoll Foot in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Lightbringer. Please come back to see me after you have completed your breastplate. I have a [job] that I can only entrust to one of my finest knights in training.");
    quest::summonitem(22616);
  }
  if($text=~/job/i) {
    quest::say("I have been working for quite some time at my blacksmithing skills in my spare time. My initial interest was to make armor for our new recruits. However. after I discovered these armor recipes there has been more of a need for weaponry rather then armor. I have began to construct weapons suitable for all those that pass the training exercises but I have run short on supplies. I need someone to [gather the necessary supplies] for me.");
  }
  if($text=~/necessary supplies/i){
    quest::say("That's great news $name, I applaud your willingness to help me gather these items. I would go get them myself but I must always be available here should any of the other newcomers need my help. Please collect 2 Flawless Gnoll Hides and 2 Wisp Essences for me and I will do my best to fashion you a weapon together for your trouble.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 27399 => 2, 27417 => 2)) {
    quest::say("These are exactly what I needed! Its for sure that I have a lot to learn about Smithing but low and behold I was able to create this fine blade out of my remaining materials. Please carry it with you as a symbol of my gratitude. Rodcet smiles down upon you young $name, you have done well.");
    quest::summonitem(27490);
    quest::exp(100);
    quest::ding();
    quest::faction(183,3);
    quest::faction(21,-3);
    quest::faction(257,3);
    quest::faction(135,3);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2033 -- Davloran_Girionlis