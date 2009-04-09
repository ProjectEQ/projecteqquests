sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Pleased to meet you $name. I am Filian Weagleross High Priest of the glorious Rodcet Nife! I have recently taken upon some very [important duties] here in our temple so if your business is not urgent please excuse me.");
}

if($text=~/important duties/i){
quest::say("My important duties are training the new recruits of our temple. It can be quite perilious for a new adventurer in our world today as I am sure you will soon find out. The Temple of Life is dedicated to ensuring that once our young ones leave our home to venture out into Norrath they are ready for whatever might present itself. If you are a [young cleric of Rodcet] then we can begin your training at once.");
}

if($text=~/young cleric of rodcet/i){
quest::say("Your training will be very important to your development as a Cleric of Rodcet Nife so I do hope you will remain focused at all times. Your exercises will take you all over your hunting area and our city to specific [magical items].");
}

if($text=~/magical items/i){
quest::say("The magical items you need to collect will be necessary for creating your magical armor will be placed in this Prime Healers Mail Kit that will create armor materials.When you are ready to collect the items necessary for creating a piece of armor all you must do is tell me what armor piece you [want] to craft. I can present you with the recipes and armor molds for Prime Healer Initiate [Helms]. [Bracers]. [Armguards]. [Boots]. [Greaves]. [Gauntlets] and [Breastplates].");
quest::summonitem(17267);
}

if($text=~/i want to craft helm/i){
quest::say("To create your helm material you will need to combine 2 Bricks of Crude of Iron Ore. 1 Piece of Rat Fur and 1 Chunk of Meat in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Prime Healer Initiate.");
quest::say("To create your helm material you will need to combine 2 Bricks of Crude of Iron Ore. 1 Piece of Rat Fur and 1 Chunk of Meat in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Prime Healer Initiate.");
quest::summonitem("22610");
}

if($text=~/i want to craft bracers/i){
quest::say("To create your bracer material you will need to combine 1 Brick of Crude of Iron Ore. 1 Brown Bear Femur and 1 Giant Rat Ear in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Prime Healer Initiate.");
quest::summonitem("22611");
}

if($text=~/i want to craft armguard/i){
quest::say("To create your armguards material you will need to combine 2 Bricks of Crude of Iron Ore. 2 King Snake Scales. 1 Rat Whiskers and 1 Large Myotis Bat Ear in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Prime Healer Initiate.");
quest::summonitem("22613");
}

if($text=~/i want to craft boots/i){
quest::say("To create your boot material you will need to combine 3 Bricks of Crude of Iron Ore. 1 Severed Gnoll Foot. 2 Rabid Wolf Hides. 1 Large Myotis Bat Wing in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boot of the Prime Healer Initiate.");
quest::summonitem("22612");
}

if($text=~/i want to craft greaves/i){
quest::say("To create your greaves material you will need to combine 4 Bricks of Crude of Iron Ore. 1 Bear Meat. 1 Giant Fire Beetle Leg and 1 Young Plains Scalp in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Prime Healer Initiate.");
quest::summonitem("22614");
}

if($text=~/i want to craft gauntlets/i){
quest::say("To create your gauntlet material you will need to combine 3 Bricks of Crude of Iron Ore. 1 Spider Legs. 1 Lion Tooth. 1 Wolf Meat and 1 Bandit Sash in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Prime Healer Initiate .");
quest::summonitem("22615");  
}

if($text=~/i want to craft breastplates/i){
quest::say("To create your breastplate material you will need to combine 5 Bricks of Crude of Iron Ore. 1 High Quality Cat Pelt. 1 Golden Bandit Tooth. 1 Shadow Wolf Paw. 1 Matted Lion Pelt and 1 Lock of Scarecrow Straw in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Prime Healer Initiate. When you have completed your armor I have a [delivery] for you to make.");
quest::summonitem("22616");
}

if($text=~/what delivery/i){
quest::say("As we speak I have a recruit much like yourself scouting in Blackburrow to monitor the Gnolls that reside there. They have been stockpiling supplies and many fear it is for an upcoming attack. Please deliver this bag of rations to him and return to me with his report along with 1 Perfect Gnoll Skin and 2 Severed Gnoll Paws and you shall be rewarded for your efforts.");
quest::summonitem("27498","1");
}

}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2032 -- Filian_Weagleross 
