sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hail to ye too $name, what brings ye to Kaladim`s hall of champions? I am Dirjadak Barbrawler and its gud to meet ye. I pride myself on being one of the finest Warlords to have ever served in Brells Army. However, my days nowadays aren't all that exciting. I just spend me time training young ones that are born into the life of a Kaladim Champion. If you are a young [warrior] of Brell I might have some work for you.");
  }
  if($text=~/warrior/i){
    quest::say("Excellent $name, you must surely have been sent to me to begin yer training then. Aye? If you are [interested] in beginning yer training as a Champion of Kaladim I will be happy to present you with yer instructions for crafting yer own set of Axebringers Platemail Armor.");
  }
  if($text=~/interested/i){
    quest::say("Dats great to here dere young one. First and foremost you will need dis Dusty Mail Assembly Kit to combine all the various items that you will need to collect from different parts of the Butcherblock Mountains and in our great city of Kaladim. As you collect specific items from yer surroundings, you will use them in certain quantities in this kit to create armor materials that will then be placed in a forge with armor molds to fashion yer armor. Once you are [ready] to begin collecting the supplies for yer materials I will be happy to supply you with the necessary material recipes and molds to craft yer armor.");
    # Summon: Dusty Mail Assembly Kit
    quest::summonitem(17247);
  }
  if($text=~/ready/i){
    quest::say("Glad to ere that I am indeed Aye! When you have decided what armor piece you would like to collect please simply tell me what piece it is that you want to craft and I will supply you material recipe and mold necessary for crafting Axebringers Platemail [Helm], [Bracer], [Armguards], [Boots], [Greaves], [Gauntlets], and [Breastplate].");
  }
  if($text=~/armguards/i){
    quest::say("To create yer armguards material you will need to combine 2 Bricks of Crude Bronze, 2 Giant Scarab Claw, and 1 Torch in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Armguards of the Axebringer.");
    # Summon: Crude Vambraces Mold
    quest::summonitem(19635);
  }
  if($text=~/boots/i){
    quest::say("To create yer boots material you will need to combine 3 Bricks of Crude Bronze, 1 Skunk Eye and 1 Water Flask in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Boots of the Axebringer.");
    # Summon: Crude Boots Mold
    quest::summonitem(19634);
  }
  if($text=~/bracer/i){
    quest::say("To create yer bracer material you will need to combine 1 Bricks of Crude Bronze, 1 Scarab Carapace, 1 Giant Bat Fur and 1 White Wine in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Bracer of the Axebringer.");
    # Summon: Crude Bracer Mold
    quest::summonitem(19632);
  }
  if($text=~/breastplate/i){
    quest::say("To create yer breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Glyndas Tongue, 1 Pristine Forest Drakeling Scale, 1 Golden Bandit Tooth, 1 Goblin Brain and 1 Aqua Goblin Headdress in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Breastplate of the Axebringer. I would also like to see you after you have completed yer breastplate because I have a final [favor] to ask of ye.");
    # Summon: Crude Breastplate Mold
    quest::summonitem(19637);
  }
  if($text=~/gauntlets/i){
    quest::say("To create yer gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Chunk of Meat, 1 Giant Scarab Eye, and 1 Cracked Giant Scarab Carapace in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Gauntlets of the Axebringer.");
    # Summon: Crude Gauntlets Mold
    quest::summonitem(19633);
  }
  if($text=~/greaves/i){
    quest::say("To create yer greaves material you will need to combine 4 Bricks of Crude Bronze, 1 Skunk Scent Gland , 1 Giant Scarab Egg Sack and 1 Small Lantern in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Greaves of the Axebringer.");
    # Summon: Crude Greaves Mold
    quest::summonitem(19636);
  }
  if($text=~/helm/i){
    quest::say("To create yer helm material you will need to combine 2 Bricks of Crude Bronze, 1 Aviak Chick Talon, 1 Spider Leg and 1 Fishing Bait in yer assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion yer very own Helm of the Axebringer.");
    # Summon: Crude Helm Mold
    quest::summonitem(19631);
  }
  if($text=~/favor/i){
    quest::say("Well ya see young one, I am a dwarf and I like me Ale. But there is one thing that I like more then my Ale and that?s me mug! While out in the mountains late one evening not too long ago I had a few too many then I should have me wife says. Har har. Anyways, when me woke up da next morning me mug was gone so I had to have lost it out there somewhere. If you should find my mug and were able to return it to me intact or not I would be very grateful! Return my mug to me along with 2 Pristine Krag Claws and I will reward you with a blade worthy of Brells finest battlemaster. Now git going!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28064 => 2, 28063 => 1)){
    quest::say("Here is that blade I promised you $name.");
    # Summon: Gem-Etched Battle Axe
    quest::summonitem(26076);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
