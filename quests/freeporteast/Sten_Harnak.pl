#############
#Quest Name: Sten Harnak's  North Freeport Bard Armor Quest
#Author: CrabClaw And PEQ(?) (Tabidzukare)
#NPCs Involved: Sten Harnak
#Items Involved:
#zone: freeportn
#Revised CrabClaw v1.1 (Tabidzukare v1.2)



sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings to you $name. I am Sten Harnak Virtuoso of Freeport. I have lived in Freeport and studied the art of songweaving here for all of my days. I am always eager to see new faces here in our concert hall. If you are here for a performance I am afraid it does not start till a bit later but if you are a young bard in training then I might have some [work] for you.");
}
if($text=~/what work/i){
quest::say("Well I have numerous concerts here that I must prepare for so I always must be sure that I have the best possible support as far as my fellow bards go. I am always seeking new young talent to sing in our concerts. If you are a bard I have made tasks for you to complete to see if you are a worthy songweaver. These tasks will test your determination and battle skills. I would only allow one that has completed all of my [specific tests] to sing in my concert hall.");
}
if($text=~/what specific tests/i){
quest::say("If you are ready to begin your training I will assign you a number of tests. These tests will enable you to outfit yourself with a suit of armor only worn by the most respected musicians of Freeport. First. I will present you with a Songweavers Assembly Kit. In this kit you will combine certain [recipes] that will be magically formed into an armor material. Each one of these materials will need to be combined in a forge with the appropriate mold to make your armor piece.");
quest::summonitem("17257");
}
if($text=~/what recipes/i){
quest::say("I have the material recipes available for Songweavers Platemail [Helms]. [Bracers]. [Armguards]. [Boots]. [Greaves]. [Gauntlets] and [Breastplates]. When you are ready to craft a specific piece simply tell me what armor piece you [want] to craft. For example if you would wish to craft a helm tell me [I want to craft a helm]. Also please keep in mind that the components necessary for crafting your breastplate material are the most difficult to collect so you might want to collect them last.");
}
if($text=~/i want to craft armguards/i){
quest::say("Armguards will keep your arms well protected in battle from any foe you may face. To create your armguard material you will need to combine 2 Bricks of Crude Iron Ore, 1 Preserved Snake Eye, 1 Burned Out Lightstone and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Armguards.");
quest::summonitem("22613");
}
if($text=~/i want to craft bracers/i){
quest::say("A bracer is a very vital part of any bards arsenal. To create your bracer material you will need to combine 1 Brick of Crude Iron Ore, 2 Chunks of Meat, 1 Black Wolf Skin and 1 Cats Eye Agate in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Bracer.");
quest::summonitem("22611");
}
if($text=~/i want to craft gauntlets/i){
quest::say("Keeping your hands safe from all wounds is a key to being an effective bard. I am sure you will find it extremely difficult to play your instruments if your hands are not in the best shape possible. To create your gauntlet material you will need to combine 3 Bricks of Crude Iron Ore, 1 Fire Beetle Eye, 1 Orc Pawn Pick and 2 Giant Scarab Brains in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Gauntlets.");
quest::summonitem("22615");
}
if($text=~/i want to craft boots/i){
quest::say("Boots are a very important armor piece and I am glad to hear you wish to craft them. To create your boot material you will need to combine 3 Bricks of Crude Iron Ore, 1 Ruined Bear Pelt  and 1 Severed Orc Foot in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Boots.");
quest::summonitem("22612");
}
if($text=~/i want to craft a helm/i){
quest::say("A very important armor piece indeed $name. one well placed attack to the head by an adversary could leave you in very poor condition. To create your helm material you will need to combine 2 Bricks of Crude Iron Ore, 1 Ruined Wolf Pelt, 1 Deathfist Pawn Scalp and 1 Barley in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Helm.");
quest::summonitem("22610");
}
if($text=~/i want to craft greaves/i){
quest::say("Greaves would be a very wise armor choice should you be able to gather the components necessary for the material. To create your greaves material you will need to combine 4 Bricks of Crude Iron Ore, 2 Spiderling Eyes, 1 Lion Tail, 1 Bottle and 1 Grizzly Bear Skin in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Greaves.");
quest::summonitem("22614");
}
if($text=~/i want to craft breastplate/i){
quest::say("The right breastplate will defend you from most lifethreating attacks that you may endure while in training. With that said I am very happy to see that you are already set to collect your breastplate material componenets. To create your breastplate material you will need to combine 5 Bricks of Crude Iron Ore, 1 Coyote Skull, 1 Snake Bile, 1 Enlarged Fire Beetle Leg, 1 Vial of Smoke and 1 Young Plains Cat Backbone in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Songweavers Platemail Breastplate. Please return to me after you have completed your final armor piece because I have one more [important task] for you.");
quest::summonitem("22616");
}
if($text=~/what important task/i){
quest::say("There has been numerous reports lately of the Orcs in the Commonlands being up to no good. Some actually believe that they are stockpiling wood for some odd reason.  Regardless of their purpose the increased number of orcs in any given area just spells trouble for all the surrounding areas. I need you to go and [collect some warbeads] from some high ranking orcs. Obtaining these warbeads will not be easy I would presume. Will you assist me in this final task?");
}
if($text=~/i will collect some warbeads/i){
quest::say("I am very pleased to hear that you will be able to help us. The warbeads that I require will be found on specific Orc Chieftans. I am sure they are not alone and are well guarded so make sure you bring companions with you that are well proven on the battlefield. Bring me the warbeads of Chief Fosloas, Diedridan and Kelleru. I look forward to seeing you soon.");
}
 }

sub EVENT_ITEM { 
 if (plugin::check_handin(\%itemcount, 9924 => 1, 9925 => 1, 9926 => 1)){
	quest::say("Good work $name.");
	quest::summonitem("9935");
 }
  #Do all other handins first With plugin, then let it Do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
}

#End of FILE Zone:freportn  ID:8065 -- Sten_Harnak