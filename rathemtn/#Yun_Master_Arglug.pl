# Yun Master Arglug
# Froglok Newbie Shaman armor
#by Realityincarnate
# items: 17392, 51064, 51062, 51066, 51065, 51068, 51063, 51067, 51093, 51095

sub EVENT_SAY {
  if($text=~/Hail/i) {
	quest::say("Welcome back, young Yun. I hope your training is going well. Unfortunately, I have been unable to keep up to date on your progress, but should you need advanced training in any individual skills, I am here to help you with that. As well, I am here to help guide you through your growth as a Shaman in the Guktan Army. The spirits will also be your guide, and with the skills that you learn here, you will be better equipped to serve the Army. If you plan on following the path of a [Shaman], I have some tasks for you to complete, if it suits your interest.");
  }

  if($text=~/shaman/i) {
	quest::say("I thought as much. I am glad that you have chosen to become a Shaman. Let's get started on your training. I will give you a list of items that you will need to collect, as well as a magical assembly kit in which to combine these items. Once you have successfully combined the items, it will create a material that you will use to craft a suit of armor that will protect you from the dangers of the training grounds. If you are ready to begin your task, I will give you the assembly kit and instructions for collecting the items required to craft your armor. Are you ready to receive your [assembly kit]?");
  }

  if($text=~/assembly kit/i) {
	quest::say("Excellent, then it is time that we get started. Here is the assembly kit used to combine the different items required to craft your own Yun Initiate's Armor. Each piece of armor will require different items to craft. These items will be available from both our outpost, as well as the training grounds near here. When you are ready to receive a recipe for a specific material, simply tell me which armor piece you [wish to craft]. I hold the recipes for Yun Initiate's [Helms], [Bracers], [Boots], [Armguards], [Legplates], [Gloves] and [Breastplates]. Keep in mind that the items required to make some of the larger pieces of armor will be a bit more difficult to get. You may want to wait until you are more experienced before attempting to obtain the components.");
	quest::summonitem(17392); # Item: Yun Recruit's Assembly Kit
  }

  if($text=~/helm/i) {
	quest::say("Wise choice, young recruit. The helm is one of the most important pieces of armor that one could ever hope to obtain. Protection of your head at all times is a must. To create the material needed to craft your helm, you will need to gather a water moccasin tail, two mosquito eyes, and a chunk of digested earth, and combine them in your assembly kit. Once you have the correct material, you will need to combine the items together in a forge, along with this mold, to craft your Helm of the Yun Initiate.");
	quest::summonitem(51064); # Item: Yun Helm Mold
  }

  if($text=~/bracers/i) {
	quest::say("A bracer is a simple, but effective piece of armor. It enables some deflection of small blows to the wrists in melee-based combat. The bracer is one of the most basic sections of armor to craft, as well as being the easiest of all the armor pieces to collect the correct items. To create the material needed to craft your bracer, you will need to gather a crab spider's carapace, the poison sack of a bleeder, and two airborne spores, and combine them in your assembly kit. Once you have the resulting material, you will need to combine it together in a forge, along with this mold, to craft your Bracer of the Yun Initiate.");
	quest::summonitem(51062); # Item: Yun Bracer Mold
  }

  if($text=~/boots/i) {
	quest::say("A pair of boots would be a wise choice for a young recruit. Our training grounds are often dangerous, and plagued with various perils. Boots would offer some excellent protection for your feet, as well as some protection from the elements. To create the material needed to craft your boots, you will need to gather two kobold talons, an amulet from an undead froglok, and a ball of pulpy fungus, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Boots of the Yun Initiate.");
	quest::summonitem(51066); # Item: Yun Boot Mold
  }


  if($text=~/armguards/i) {
	quest::say("Armguards are one of the pieces of armor that no froglok should be without! They offer protection for the arms, and some for the shoulders, as well. A good thing if a block goes awry! To create the material needed to craft your armplates, you will need to gather two chunks of mosquito meat, a large fungal spore, and a giant snake fang, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Armplates of the Yun Initiate.");
	quest::summonitem(51065); # Item: Yun Armplate Mold
  }

  if($text=~/legplates/i) {
	quest::say("Legplates are one of the more difficult items to craft; however, they offer a significant amount of protection for a young recruit. Since the legplates are a bit larger then most other pieces of armor, the components required to craft the material comes from some of the larger, and more dangerous creatures in the training grounds. To create the material needed to craft your legplates, you will need to gather two bull 
alligator teeth, one larval carapace, and one pristine kobold paw, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Legplates of the Yun Initiate.");
	quest::summonitem(51068); # Item: Yun Legging Mold
  }

  if($text=~/gloves/i) {
	quest::say("Excellent! Gauntlets are the choice of smart recruits. One of the first things that one should do is protect your hands, since your hands are very important, especially in melee combat! To create the material needed to craft your gauntlets, you will need to gather two pristine bleeder skins, one crab spiderling fang, a mushroom spore, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Gauntlets of the Yun Initiate.");
	quest::summonitem(51063); # Item: Yun Gauntlet Mold
  }

  if($text=~/breastplates/i) {
	quest::say("You wish to craft a breastplate? Do you think you are skilled enough to obtain the materials needed to craft it? Well, I hope that you aren't wrong; it would be tragic if we lost a recruit because he was too zealous, too soon. Regardless, as you have asked, I will give you the recipe to craft the breastplate. To create the material needed to craft your breastplate, you will need to gather two burly kobold ears, some moccasin poison, and two bull alligator spines, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Breastplate of the Yun Initiate. After you have completed your breastplate, I may have another [task] for you to complete.");
	quest::summonitem(51067); # Item: Yun Breastplate Mold
  }

  if($text=~/task/i) {
	quest::say("I speak of this with you, only because I believe you have proven yourself to be a recruit of impeccable reputation, and feel that you will not let me down. Not long ago, a small artifact was lost, though the details of how were never discovered. What we do know, is that a small band of froglok traitors, and exiles took the item. The artifact was not extremely powerful, it had more sentimental value than anything else, but, if you could retrieve it, you would save me the trouble of having to hunt them down myself.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 51093 => 1)) {
	#text made up
	quest::say("Thank you for retrieving the artifact, young one.  Your training is now complete, and I present to you the last of the equipment granted to Yun Initiates, the cudgel of our order.  May it serve you well in your travels.");
	quest::summonitem(51095); # Item: Cudgel of the Yun Initiate
  }
  plugin::return_items(\%itemcount);
}

#end of file