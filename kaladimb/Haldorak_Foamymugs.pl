sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hail dere me friend. I be Haldorak Foamymugs High Priest of Clerics dat heed the call of Brell. I am a very busy Dwarf for I have many new house recruits to train. Ye see I am in charge of all the young ones that pass through our halls. They must all undergo and pass me [tests] before they are truly ready to travel the dangerous world of Norrath.");
  }
  if($text=~/tests/i){
    quest::say("Well ye see $name, we cant just send anyone out 
into dis world to spread Brells word and not make sure dey are properly trained in the ways of battle. Dis is why I have created some exercises for our young ones so that dey may be able to do which will in the end enable them to make a full set of their own armor. If`n ye are a young [cleric] of Brell 
well den these special exercise will surely be right for ye! Aye.");
  }
  if($text=~/cleric/i){
    quest::say("Well den lets not waste anytime and lets get you started! Here is yer Assembly Kit of Brell. In this kit ye will be collected many different items from both da Mountains of Butcherblock as well is in our great minin city o Kaladim! You will then place certain items in yer kit to create armor materials that you will then combine in a forge with an armor mold to make yer armor piece. If`n yer ready to begin craftin yer armor then I will be glad to present you with da material [recipes]!");
  }
  if($text=~/recipes/i){
    quest::say("Now yer talking $name, I be glad to see yer ready to begin crafting yer honor and heed yer calling as a servant o Brell! I have the armor material recipes and molds for Brells Blessed Platemail [Helm], [Bracer], [Armguards], [Boots], [Greaves], [Gauntlets], and [Breastplate]. All ye must do is simply tell me what armor piece ye want to craft and I will gladly present ye with the material recipe and armor mold necessary fer craftin it.");
    # Holy Assembly Kit    
    quest::summonitem(17253);
  }
  if($text=~/armguards/i){
    # Quest: Brells Blessed Platemail Armguards 
    quest::say("To create yer armguards material you will need to combine 2 Bricks of Crude Bronze, 1 Spiderling Silk and 1 Scarab Leg and 1 Elven Wine in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Brells Blessed Armguards.");
    # Crude Vambrace Mold
    quest::summonitem(19635);
  }
  if($text=~/boots/i){
    # Quest: Brells Blessed Platemail Boots
    quest::say("To create yer boots material you will need to combine 3 Bricks of Crude Bronze, 1 Basilisk Tongue, 1 Bat Wing and 1 Bottle of Milk in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Brells Blessed Boots.");
    # Crude Boot Mold
    quest::summonitem(19634);
  }
  if($text=~/bracer/i){
    # Quest: Brells Blessed Platemail Bracer
    quest::say("To create yer bracer material you will need to combine 1 Bricks of Crude Bronze, 2 Snake Fangs, 1 Bone Chip and 1 Cask in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Brells Blessed Bracer.");
    # Crude Bracer Mold
    quest::summonitem(19632);
  }
  if($text=~/breastplate/i){
    # Quest: Brells Blessed Platemail Breastplate
    quest::say("To create yer breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Glynns Tongue, 1 Dwarven Bandit Coinpurse, 1 Pristine Forest Drakeling Scale, 1 Undead Pawn Tibia and 1 Golden Bandit Tooth in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Brells Blessed Breastplate. Please come back to see me after ye has completed yer final armor piece? I need a lil [help] with something that only a proven disciple of Brell can complete.");
    # Crude Breastplate Mold
    quest::summonitem(19637);
  }
  if($text=~/gauntlets/i){
    # Quest: Brells Blessed Platemail Gauntlets
    quest::say("To create yer gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Krag Chick Beak, 1 Rock Spiderling Legs, and 2 Bat Wings in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Brells Blessed Gauntlets.");
    # Crude Gauntlets Mold
    quest::summonitem(19633);
  }
  if($text=~/greaves/i){
    # Quest: Brells Blessed Platemail Greaves
    quest::say("To create yer greaves material you will need to combine 4 Bricks of Crude Bronze, 2 Snake Scales , 1 Gundls Tongue and 1 Raw Bamboo in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Brells Blessed Greaves.");
    # Crude Greaves Mold
    quest::summonitem(19636);
  }
  if($text=~/helm/i){
    # Quest: Brells Blessed Platemail Helm
    quest::say("To create yer helm material you will need to combine 2 Bricks of Crude Bronze, 1 Snake Egg, 1 Bat Fur and 1 Bottle in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Brells Blessed Helm.");
    # Crude Helm Mold
    quest::summonitem(19631);
  }
  if($text=~/help/i){
    # Quest: Brells Blessed Platemail Help
    quest::say("A helper ye say ye is Aye? Well den let me tell ye what I need assistance with. There has been an overwhelming number of goblins seen in the surrounding areas lately, and well dat gives me da creeps. These goblins are known to be allied with the bandits that infest our lands and they must be stopped before its too late. If you would like to help me I need you to collect some very important [items].");
  }
  if($text=~/items/i){
    # Quest: Brells Blessed Platemail Help
    quest::say("I need someone to collect blood samples form dese vile goblins for me so that I can have my resident alchemist study them. We are interested in the genetics of these dern goblins so that we can know exactly how powerful they are and what we are up against. Aye. Please bring me 2 samples of da Green Goblin Blood and 2 samples of da Aqua Goblin Blood and I will surely reward you for yer great deeds.");
  }
}

sub EVENT_ITEM {
  # Handin: Aqua Goblin Blood, Green Goblin Blood
  if(plugin::check_handin(\%itemcount, 28062 => 2, 28061 => 2)){
    # Quest: Brells Blessed Platemail Help (End)
     quest::say("Well done $name! Here is your reward.");
     # Blessed Brellium Warhammer
     quest::summonitem(26075);
  }
}


 