sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome back, young Kor. I hope your training is going well. Unfortunately I have been unable to keep up to date on your progress, but should you need advanced training in any individual skills, I am here to help you with that. As well, I am here to guide you through your growth as a Cleric in the Guktan Army. With the skills that you learn here, you will be better prepared to serve the Army. If you do indeed plan on following the path of a [Cleric], I have some tasks that you will need to complete, if it suits your interest.");
  }
  if ($text=~/cleric/i) {
    quest::say("Excellent! I will give you a list of items to collect, and then combine in this magical assembly kit. This will create a material that you will use to craft a suit of armor that will protect you from the various dangers of Norrath, for years to come. If you are ready to begin your task, I will give you the assembly kit, as well as instructions for collecting the necessary items to craft your armor. Are you ready to receive your [assembly kit]?'");
  }
  
  if ($text=~/assembly kit/i) {
    quest::say("Here you are $name, take this assembly kit, it is what you will use to combine the different items required to craft your own Kor Initiate's armor. Different items will be required to craft the different pieces of armor. These items will be available from both our outpost, as well as the training grounds near here. When you are ready to receive a recipe for a specific material, simply tell me which armor piece you [wish to craft]. I hold the recipe's for Kor Initiates [Helms], [Bracers], [Boots], [Armguards], [Legplates], [Gloves] and [Breastplates]. Keep in mind that the items required to make some of the larger pieces of armor will be a bit more difficult to get. You may want to wait until you are more experienced before attempting to obtain the components.");
    quest::summonitem(17393);
  }
  if ($text=~/helm/i) {
    quest::say("Excellent choice, the helm is without a doubt one of the most important pieces of armor for a young recruit. It is imperative that you protect yourself from blows to the head, while you are in the training grounds! To create the material needed to craft your helm, you will need to gather a cracked skull, two bleeder wings, and a set of moccasin scales, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Helm of the Kor Initiate.");
    quest::summonitem(51057);
  }
  
  if ($text=~/bracers/i) {
    quest::say("The bracer is one of the most basic sections of armor to craft, as well as being the easiest of all the armor pieces to collect the correct items. Even though it is a basic piece of armor, it serves a big role in the protection of the wrists. To create the material needed to craft your bracer, you will need to gather two spiderling silks, a blackened fungus, and a bleeder carapace and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Bracer of the Kor Initiate.");
    quest::summonitem(51055);
  }
  
  if ($text=~/boots/i) {
    quest::say("A pair of boots would be an excellent choice, especially if you plan on doing any extended training in the training grounds. These boots offer excellent protection from the elements, as well as excellent support for your feet. To create the material needed to craft your boots, you will need to gather two kobold scalps, an alligator hide, and a giant moccasin fang, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Boots of the Kor Initiate.");
    quest::summonitem(51059);
  }
  
  if ($text=~/armguards/i) {
  quest::say("The armguards are also handy to have. While they are a bit restricting in the movement in the arms, it is much better to have them on when you don't need them, rather then not having them on when you do need them. To create the material needed to craft your armplates, you will need to gather two moccasin eggs, one mosquito carcass, and a kobold talisman, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Armplates of the Kor Initiate.");
  quest::summonitem(51058);
      }
      if ($text=~/legplates/i) {
        quest::say("The legplates are one of the more difficult armor pieces to craft. Due to the sheer size of the materials needed to craft the leggings, you will need to gather the items from some of the more dangerous regions of our training grounds. To create the material needed to craft your legplates, you will need to gather a kobold liver, two giant moccasin eyes, and one foot from a froglok ghoul, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Legplates of the Kor Initiate.");
        quest::summonitem(51061);
      }
      if ($text=~/gloves/i) {
        quest::say("Gauntlets are a definite must for any recruit, especially those who do any sort of melee combat! Imagine what a shame it would be to have your recruitment cut short because you lose an appendage. It would be truly tragic. To create the material needed to craft your gauntlets, you will need to gather a cracked spider leg, a malleable bleeder skin, and two spore buds, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Gauntlets of the Kor Initiate.");
        quest::summonitem(51056);
      }
      if ($text=~/breastplate/i) {
        quest::say("So, you think yourself skilled enough to obtain the components necessary to craft your breastplate? I sure hope that you aren't wrong, it would be a very sad day to know that we lost such a promising young recruit because they were a bit overzealous. Regardless, as you have asked, I will give you the recipe to craft the breastplate. To create the material needed to craft your breastplate, you will need to gather two pristine bull alligator hides, larvae skin, and two pristine moccasin scales, and combine them in your assembly kit. Once you have the correct material, you will need to forge the items together, along with this mold, to craft your Breastplate of the Kor Initiate. After you have completed your breastplate, I may have another [task] for you to complete.");
        quest::summonitem(51060);
      }
      if ($text=~/task/i) {
        quest::say("If you are asking me about the task I spoke of earlier, then you must have surely completed the full suit of Kor Initiates Armor! You have proven your worth, and moved past the stages of recruitment. Moving along in your training, this task that I wish you to complete will be dangerous, and you may perish, but know that it will greatly help our cause. Enough of my chatter, the task I need you to complete is to recover a [lost journal] from the person who stole it. ");
        }
        if ($text=~/lost journal/i) {
          quest::say("This journal was very important to a friend of mine, and a fellow recruit of yours. It also had some very detailed notes on a mission that he was on, however, it got lost during an attack on his camp one night. He managed to escape with his life, but the journal was lost. The only information that we have is that it was a band of undead abominations that attacked the camp. If you could perhaps return to us with this journal, I would be greatly appreciative.");
        }
     
    
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 51094 =>1 )) {
quest::say("Great work.  These notes will help us in our cause.");
  quest::summonitem(51096);
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}