sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Who dares to address me while I am clearly busy reviewing my daily research. I sure hope this is important $name, I do not have time to waste on just any initate of House Spurned. Not a single day goes by that I do not come face to face with cannon fodder that is not even worthy of a headstone in our burial grounds. If you wish to [prove yourself] then I might be in a generous mood.");
  }
  if($text=~/prove myself/i) {
    quest::say("I must admit this is not the first time I have heard someone say that nor will it be the last, however I am wiling to give you a chance. First thing we will need to do is get some clothes in your back if you wish to survive for any amount of time. If you are a young Wizard, Enchanter or Magician of House Spurned then I will present you with a [mystical sewing kit].");
  } 
  if($text=~/mystical sewing kit/i) {
    quest::say("'The Mystical Sewing kit that I have created is one that is able to fashion a material used for crafting clothes worn by all Initates of House Spurned. All that is required are Cloaks worn by Lightwalkers that plague our Forest to this very day. If you are to take my task and seek vegenence on this inferior group of Arcane lightwalkers you will pride your house along with gathering one of the [key ingredients] for your armor. I have heard rumor that they have tried to generate some kind of magic from a source shrouded by our forest.");
  } 
  if($text=~/key ingredients/i) {
    quest::say("You will be given different combination recipes for whichever armor piece you wish to craft. You will combine the specific items in the Mystical Sewing Kit that I will give to you when you are ready. After you have combined the correct items in your sewing kit you will fashion together a Bloodstained Cloth of the Spurned. At that time you will put the pattern that I will give you for each armor piece you request in the loom along with this cloth to craft your Armor piece. I will also suggest that you craft your Breastplate last due to the difficulty of obtaining the items. Do you [understand] the instructions I have given you?");
  }
  if($text=~/understand/i) {
     if ((($class == 'wizard') ||($class == 'magician') || ($class == 'enchanter')) && ($race == 'dark elf')){
    quest::say("'Very well $name, here is your Mystical sewing kit. I have the patterns and recipes necessary to craft Spurned Initiate [Skullcaps], [Bracers], [Sandals], [Sleeves], [Trousers], [Gloves} and [Robes]. When you feel you are ready to gather the items necessary to craft your armor simply tell me which piece you want to craft. The items that you will need to collect will mostly be found in the Forest but some will be here in town. As I said before seek out the Arcane Lightwalkers to collect the cloaks that you will need to make the armor materials. I look forward to seeing what you will make of this opportunity.");
    quest::summonitem(17246);#Mystical Sewing Kit
     }
     else {
     quest::say("You are no member of House Spurned.  Begone!"); #text made up, I have no record of what's said if you're not an inkie chanter/wizzy/mag
     }
  }
  if($text=~/skullcaps/i) {
    quest::say("You will need to collect 1 Blood Drenched Cloak 1 Ash Drakeling Scale 2 Bone Chips and 1 Red Wine. Combine these all in your Mystical Sewing Kit to create a Bloodstained Cloth of the Spurned that is used for creating your Skullcap. Take this Cap pattern that I have given you and place it in the closest loom along with your Bloodstained Cloth of the Spurned to craft a Skullcap of the Spurned Initiate.");
    quest::summonitem(22628);#Enchanted Cap Pattern
  }
  if($text=~/bracers/i) {
    quest::say("$name, you will need to collect 1 Blood Drenched Cloak, 1 Black Mamba Skin, 1 Fire beetle Eye, 1 Short Beer. Combine these all in your Mystical Sewing Kit to create a Bloodstained Cloth of the Spurned that is used for creating your Bracer. Take this Bracer pattern that I have given you and place it in the closest loom along with your Bloodstained Cloth of the Spurned to craft a Bracer of the Spurned Initiate.");
    quest::summonitem(22629);#Enchanted Bracer Pattern
  }
  if($text=~/sandals/i) {
    quest::say("$name, you will need to collect 2 Blood Drenched Cloaks, 2 Snake Scales, 1Ruined Bear Pelt and 2 bandages. Combine these all in your Mystical Sewing Kit to create a Bloodstained Cloth of the Spurned that is used for creating your Sandals. Take this Sandal pattern that I have given you and place it in the closest loom along with your Bloodstained Cloth of the Spurned to craft Sandals of the Spurned Initiate.");
    quest::summonitem(22630);#Enchanted Slippers Pattern
  }
  if($text=~/sleeves/i) {
    quest::say("Welcome back $name, you will need to collect 3 Blood Drenched Cloaks, 1 Fire Beetle Leg, 1 Black Wolf Pelt and 1 Water Flask. Combine these all in your Mystical Sewing Kit to create a Bloodstained Cloth of the Spurned that is used for creating your Sandals. Take this Sleeve pattern that I have given you and place it in the closest loom along with your Bloodstained Cloth of the Spurned to craft Sleeves of the Spurned Initiate.");
    quest::summonitem(22631);#Enchanted Sleeves Pattern
  }
  if($text=~/trousers/i) {
    quest::say("Hello again $name, you will need to collect 4 Blood Drenched Cloaks, 1 Deathfist Legionnaire Scalp, 2 Bone Chips and 1 Ruined Wolf Pelt. Combine these all in your Mystical Sewing Kit to create a Bloodstained Cloth of the Spurned that is used for creating your Trousers. Take this Trouser pattern that I have given you and place it in the closest loom along with your Bloodstained Cloth of the Spurned to craft Trousers of the Spurned Initiate.");
    quest::summonitem(22632);#Enchanted Trousers Pattern
  } 
  if($text=~/gloves/i) {
    quest::say("Excellent $name, you will need to collect 3 Blood Drenched Cloaks, 2 Garter Snake Tongues and 2 Spiderling Silks. Combine these all in your Mystical Sewing Kit to create a Bloodstained Cloth of the Spurned that is used for creating your Sandals. Take this Glove pattern that I have given you and place it in the closest loom along with your Bloodstained Cloth of the Spurned to craft Gloves of the Spurned Initiate.");
    quest::summonitem(22633);#Enchanted Gloves Pattern
  } 
  if($text=~/robes/i) {
    quest::say("It brings me great pleasure to see that your training has come this far $name, for your House Spurned Ceremonial Gown you will need to collect 5 Blood Drenched Cloaks, 2 Basilisk Eye Stalks, 1 Embalming Dust, 2 Large Snake Skins. Combine these all in your Mystical Sewing Kit to create a Bloodstained Cloth of the Spurned that is used for creating your Robe. Take this Glove pattern that I have given you and place it in the closest loom along with your Bloodstained Cloth of the Spurned to craft a Robe of the Spurned Initiate. Please return to me should you succeed in this task, I have one [final test] for you in mind.");
    quest::summonitem(22634);#Enchanted Robe Pattern
   }
  if($text=~/final test/i) {
    quest::say("Well, I must say that I did not expect you to progress in your training at the rate you have. I also knew there was something that separated you from our other initiates. For your final test, I will need you to execute three specific Orc Chieftans in the Nektulos forest. Bring me the Prayer beads of all three Orc Chieftans. These Orc Chieftans are the heads of each Orc camp and will be heavily guarded, so I would suggest bringing any friends you have made that are somewhat proficient on the battlefield to assist you. They have caused my house many problems and it is time that they are put to rest. You have come too far to fail me now. I hope to see you soon...alive, that is.");
  }     
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 22642 => 1, 22643 => 1, 22644 => 1)) {
    quest::say("Your prowess both in the classroom and on the battlefield has certainly amazed me. Please take this relic that is only presented to the most dedicated initiates and carry it with pride. You have made your house very proud on this day.");
    quest::summonitem(22647); #Ceremonial Dagger of the Spurned
  }
  plugin::return_items(\%itemcount);
}

# Quest by Kilelen, based on a quest by mystic414 