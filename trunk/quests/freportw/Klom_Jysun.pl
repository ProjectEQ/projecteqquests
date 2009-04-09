############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 6,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Quest Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Klom_jysun
# ID: 9085
# TYPE: Guild Master Monk
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Fistfighters Sewing Kit ID-17261
# An Enchanted Cap Pattern ID-22583
# An Enchanted Bracer Pattern ID-22584
# An Enchanted Sleeves Pattern ID-22586
# An Enchanted Sandals Pattern ID-22585
# An Enchanted Trousers Pattern ID-22587
# An Enchanted Gloves Pattern ID-22588
# An Enchanted Robe Pattern ID-22589
# Kloms Blessed Headband ID-9934
# Orc Toes ID-9920
# Kloms Brass Knuckles ID-9939
#
# *** QUESTS INVOLVED IN ***
#
#1 - Stonehand Cap
#2 - Stonehand Bracer
#3 - Stonehand Sleeves
#4 - Stonehand Sandals
#5 - Stonehand Trousers
#6 - Stonehand Gloves
#7 - Stonehand Robe
#8 - Stonhand Favor
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Monk
#2 - Monk
#3 - Monk
#4 - Monk
#5 - Monk
#6 - Monk
#7 - Monk
#8 - Monk
#
############################################

sub EVENT_SAY
{

if($text=~/Hail/i)
{
quest::say("Pleasure to meet you $name. I am Klom Jysun, Grandmaster of the Ashen Order. I have lived in the great city of Freeport for quite sometime now and have watched the city evolve and change. Nowadays though I am in charge of training new members of the Ashen Fist. If you are a young monk and are in need of some armor I might have some work for you. Are you a [monk]?");
}

if($text=~/monk/i && $class == 'Monk')
{
quest::say("I am always pleased when a new disciple visits our sacred halls. If you are [interested] in crafting your own armor I have a number of gathering tasks for you to do that will test both your navigational and fighting skills.");
}

if($text=~/interested/i && $class == 'Monk')
{
quest::say("I am very pleased to here about your interest in proving your worth to the Ashen Order. First let me present you with this Fistfighters Sewing Kit. Inside of it you will combine [various components] to form armor materials. Once you have a material for a certain piece of armor you will combine it in a Loom along with the appropriate pattern. When you inform me what piece of armor you [want] to craft. I will be able to present you with the component recipe and pattern needed for crafting it.");
# Fistfighters Sewing Kit ID-17261
quest::summonitem("17261");
}

if($text=~/various components/i && $class == 'Monk')
{
quest::say("The items you will need to collect are all over the Freeport area, some in stores some off vicious monsters. If you are up for the challenge though I will be able to provide you with the armor recipes and patterns for Stonehand [Cap], [Bracers], [Sleeves], [Sandals], [Trousers], [Gloves] and [Robes]. All you will need to do is tell me what piece of armor you [want to craft], and I will be able to present you with the component recipe and pattern needed for crafting it.");
}

if($text=~/want to craft a cap/i && $class == 'Monk')
{
quest::say("A cap will almost certainly be your most important piece of armor you will craft. To create your cap material you will need to combine 2 Matted Lion Pelts, 1 Malachite, 1 Snake Scales and a Cloth Cap in your assembly kit. Once you have created the proper material take it to a Loom along with this pattern to fashion your very own Cap of the Stonehand.");
# An Enchanted Cap Pattern ID-22583
quest::summonitem("22583");
}

if($text=~/want to craft bracers/i && $class == 'Monk' || $text=~/want to craft bracer/i && $class == 'Monk')
{
quest::say("In the case that you are not able to dodge a blow from an attacker a solid wristband will prevent you from getting seriously hurt. To create your bracer material you will need to combine 1 Matted Lion Pelt, 2 Rat Ears, 1 Coyote Pelt and a Cloth Wristband in your assembly kit. Once you have created the proper material take it to a Loom along with this pattern to fashion your very own Bracer of the Stonehand.");
# An Enchanted Bracer Pattern ID-22584
quest::summonitem("22584");
}

if($text=~/want to craft sleeves/i && $class == 'Monk')
{
quest::say("A monks body is a representation of all that he or she has worked so hard for. It would be a shame to see your body, especially your arms riddled with bruises. To create your sleeve material you will need to combine 2 Matted Lion Pelts, 2 Lion Tails, and Cloth Sleeves in your assembly kit. Once you have created the proper material take it to a Loom along with this pattern to fashion your very own Sleeves of the Stonehand.");
# An Enchanted Sleeves Pattern ID-22586
quest::summonitem("22586");
}

if($text=~/want to craft sandals/i && $class == 'Monk')
{
quest::say("Lightweight but effective, your Sandals of the Stoenhand will give you the appropriate foot protection without weighing you down while you are fighting. To create your sandals material you will need to combine 3 Matted Lion Pelts, 1 Giant Spider Egg Sack, 2 Severed Orc Feet, 1 Bone Chip and Cloth Sandals in your assembly kit. Once you have created the proper material take it to a Loom along with this pattern to fashion your very own Sandals of the Stonehand.");
# An Enchanted Sandals Pattern ID-22585
quest::summonitem("22585");
}

if($text=~/want to craft trousers/i && $class == 'Monk')
{
quest::say("Trousers are a definite must for any Initiate of the Ashen Fist. You will learn to generate some attacks using your legs later in your training that is why it is necessary that you keep them in as best shape as possible. To create your trouser material you will need to combine 4 Matted Lion Pelts, 1 Cutthroat Insignia Ring, 1 Spider Venom Sac and 1 Cracked Giant Scarab Carapace in your assembly kit. Once you have created the proper material take it to a Loom along with this pattern to fashion your very own Trousers of the Stonehand.");
# An Enchanted Trousers Pattern ID-22587
quest::summonitem("22587");
}

if($text=~/want to craft gloves/i && $class == 'Monk')
{
quest::say("The gloves will assist you in hitting anything that might have some kind of magical barrier surrounding it preventing you from damaging it with your bare hands. To create your glove material you will need to combine 3 Matted Lion Pelts, 1 Giant Scarab Eye, 1 Rat Whisker, 1 Ale and 1 Armadillo Carapace in your assembly kit. Once you have created the proper material take it to a Loom along with this pattern to fashion your very own Gloves of the Stonehand.");
# An Enchanted Gloves Pattern ID-22588
quest::summonitem("22588");
}

if($text=~/want to craft a robe/i && $class == 'Monk')
{
quest::say("Your robe is essential to your armor set and I am very pleased to hear that you are ready to craft it. To create your robe material you will need to combine 5 Matted Lion Pelts, 1 High Quality Cat Pelt, 1 Lion Mane, 1 Leaf Scarab Carapace, 1 Giant Scarab Brain and 1 Cloth Shirt in your assembly kit. Once you have created the proper material take it to a Loom along with this pattern to fashion your very own Robe of the Stonehand. Please come back to see me after you have completed your robe, I have a [favor] to ask of you.");
# An Enchanted Robe Pattern ID-22589
quest::summonitem("22589");
}

if($text=~/favor/i && $class == 'Monk')
{
quest::say("I had a student not too long ago that trained with me for quite sometime. He showed a lot of promise on his way to becoming a Grandmaster, however one day he came to tell me that he intended on joining the militia. I told him that I did not feel that was what he wanted to do but he insisted. On the day that he left he stole a headband from me that I was presented with by the Hall of Truth. This headband meant a lot to me, if you were able to find Firansad I am sure he will have it. Return it to me with two Orc Toes and I will surely reward you for your trouble.");
}

}


sub EVENT_ITEM
{
  # Kloms Blessed Headband ID-9934 , # Orc Toes ID-9920
 if ($class == 'Monk'&& plugin::check_handin(\%itemcount, 9934 => 1, 9920 => 2))
 {
   quest::say("Good work, $name, try these knuckles.");
    # Kloms Brass Knuckles ID-9939
   quest::summonitem("9939");
 }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Monk');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportw  ID:9085 -- Klom_Jysun 
