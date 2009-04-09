sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is a pleasure to meet you $name. I am Thekela Meepup. one of the highest ranking Clerics in all of Rivervale. I pride myself on being the mentor for all of the furryfooted that are called upon by Bristlebane to give life. If you are a [Cleric] I might have some training for you to complete if you so wish.");
}
if($text=~/I am a Cleric/i){
quest::say("$name the Templar. Well I suppose that does have quite a nice ring to it don't you say? If you stick with your training perhaps this could be what you are referred to one day. Before that day though. you have a lot to learn and a lot of training ahead of you! Do you want to [begin your training] at this time?");
}
if($text=~/I want to begin my training/i){
quest::say("Excellent! I will give you a variety of items to collect and combine in this magical assembly kit to create a material that you will use to craft armor. My hope is that as you gather these items you will learn about your home and how to navigate around the surrounding areas of the Vale. If you are ready to begin your adventure I will present you with your Magical Mail Assembly Kit and the instructions for collecting the necessary items to craft your armor. Are you [ready to receive your Magical Mail Assembly Kit]?");
}
if($text=~/I am ready to receive my Magical Mail Assembly Kit/i){
quest::say("Here you are $name. Take this mail assembly kit. it is what you will use to combine the different items necessary to craft your own Platemail of the Stoutdeacon. Different combinations of items will be required from both our town and the hunting grounds in the thicket to create materials for specific armor pieces with Crude Iron Ore being the basis for all of your armor materials. When you are ready to receive a recipe for a specific material simply tell me what armor piece you [want] to craft. I will then supply you with the mold and recipe for Stoutdeacon Platemail [Helms]. [Bracers]. [Boots].  [Armguards]. [Greaves]. [Gauntlets] and [Breastplates].");
quest::summonitem(17249);
}
if($text=~/I want to craft helm/i){
quest::say("Your Helm of the Stoutdeacon will indeed be one of the most important pieces of your armor set. It is very important that you are well protected from any blows to the head while you are on the battlefield. To fashion together the material necessary for making your helm gather 2 Bricks of Crude Iron Ore. 1 Low Quality Wolf Skin. 1 Chunk of Meat and 2 Water Flasks then combine them in your assembly kit. Once you have the correct Helm material take it to the closest forge. along with this pattern and combine them to create your Helm of the Stoutdeacon.");
quest::summonitem("22610");
}
if($text=~/I want to craft bracer/i){
quest::say("You will be required to gather most of the items for your bracer material from the Misty Thicket. You will need to collect 2 Bricks of Crude Iron Ore. 1 Bixie Stinger. 1 Runnyeye Warbeads and 1 Turnip then combine them in your kit to create the material necessary for crafting a Bracer of the Stoutdeacon. After you have done this take the material to a forge along with the mold I have given you to fashion together a Bracer of the Stoutdeacon.");
quest::summonitem("22611");
}
if($text=~/I want to craft boots/i){
quest::say("Well boots would be quite a good idea if I do say so myself $name. for certain situations only though! You should be proud of your feet and all the lovely hairs that they have been blessed with by Bristlebane! However if you wish to create a material that you will use along with this mold to create your boots you will need 2 Bricks of Crude Iron Ore. 2 Dark Elf Skins. 2 Bixie Wings and 1 Rat Foot.");
quest::summonitem("22612");
}
if($text=~/I want to craft armguards/i){
quest::say("It is important that your arms are protected while you are on the battlefield $name. To create your Armguards material make sure you collect 3 Bricks of Crude Iron Ore. 1 Giant Wood Spider Hairs. 2 Thorn Drakeling Scales and 2 Lettuce then combine them in your kit. After you have your material ready take it to the forge and combine it along with this mold to create your very own Armguards of the Stoutdeacon.");
quest::summonitem("22613");
}
if($text=~/I want to craft Greaves/i){
quest::say("Not a bad idea to get some pants on $name. Although we are halflings and we have no real need for shoes. pants on the other hand are a definite must. To create the material necessary to craft your greaves gather 4 Bricks of Crude Iron Ore. 2 Large Yellowjacket Tergites. 2 Deathfist Slashed Belt and 1 Bottle of Kalish then combine the finished product in a forge with this mold to fashion your Legplates of the Stoutdeacon.");
quest::summonitem("22614");
}
if($text=~/I want to craft Gauntlets/i){
quest::say("To create the necessary material for your gauntlets you will need to collect 3 Bricks of Crude Iron Ore. 1 Dark Elf Skin. 2 Bone Chips and 1 Vegetables then combine them in your Kit. Once you have done this place the gauntlet material in a forge along with this mold to fashion your Gauntlets of the Stoutdeacon.");
quest::summonitem("22615");
}
if($text=~/I want to craft Breastplate/i){
quest::say("So the time has finally come for you to create your final piece of armor I see $name. Seek out 5 Bricks of Crude Iron Ore. 1 Deathfist Slashed Belt. 1 Giant Yellowjacket Sternites. 2 Dark Elf Skins and 1 Undamaged Mossy Rat Pelt then combine them in your kit. Take that material along with this mold to the nearest forge and reap the rewards of your hard work. Come back to see me when you are finished because I have a [special task] for you.");
quest::summonitem("22616");
}
if($text=~/what special task/i){
quest::say("If you are asking me about this special task that I need completed then you surely must have completed all the steps necessary to prove yourself as a worthy servant of Bristlebane. Going forward I will need you to gather some [research annals] from a Muddite in the Gorge of King Xorbb that stole them from me.");
}
if($text=~/what research annals/i){
quest::say("The research annals that I need you to retrieve are very important ones to me. King Tearis Thex of Felwithe presented them to me for study. He entrusted me with them because he felt I could benefit from the knowledge that they contained. Will you [seek out my annals ]?");
}
if($text=~/i will seek out my annals/i){
quest::say("Please go to the maze of Beholder. otherwise known as the Gorge of King Xorbb and slay the Muddite Recordkeeper. After you have received the annal from him I will also need you to collect 3 Pristine Stingers. Before these annals were stolen I remember him saying I needed those 3 stingers for a special spell so please gather them for me. I hope to see you soon $name."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 22668 => 1, 22696 => 3)) {
    quest::summonitem(22697);
    quest::exp(500);   
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:rivervale  ID:19068 -- Thekela_Meepup 

