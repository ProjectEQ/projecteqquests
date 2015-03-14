#Berzerker Newbie Armor
#Zone:sharvahl  ID:155089 -- Pashir_Vollemon



sub EVENT_SAY {

if($text=~/hail/i){
	quest::say("Greetings. If you follow the ways of the [berserker], I can perhaps be of assistance.
 If not, then I do not have much to say to you.");
}
if($text=~/I am a berserker/i){
	quest::say("I thought I saw the gleam of rage in your eyes. If you are truly dedicated to our way 
of life and embrace the primal rage that burns from within our souls, I can perhaps assist you with the
 knowledge of [armor] making passed down by our ancestors.");
}

if($text=~/armor/i){
	quest::say("It is a special suit of armor that does not constrict our ability to fight. It is not
 necessary that you acquire this armor; however, it would help you while you struggle to learn the ways of
 the berserker. When you are [ready] to begin, let me know.");
}

if($text=~/ready/i){
	quest::say("Take this assembly kit. With this kit, you will be able to combine the various components
 necessary to make your armor. I can instruct you on how to make [boots], [leggings], [bracers], 
[gloves], a [coif], a [gorget], or a [tunic]. I suggest you wait to make the tunic last, as it is the most
 difficult item to construct.");
	quest::summonitem(55422);  #savageclaw chain assembly kit
}

if($text=~/boots/i){
	quest::say("To craft Savageclaw boots, you must obtain two small pieces of ore, one low quality
 rockhopper hide, and one bloodling carapace. You should able to find the animal parts in Shadeweaver's
 Thicket and the ore somewhere here in town. Once you have combined these items in your assembly kit, take
 the Savageclaw Boots Material to a forge along with this mold to create your new boots.");
	quest::summonitem(55418);   #boot mold
}

if($text=~/leggings/i){
	quest::say("To craft Savageclaw Leggings, you must obtain two small pieces of ore, one low quality
 rockhopper hide, and one sharp bloodling mandible. You should able to find the animal parts in Shadeweaver's
 Thicket and the ore somewhere here in town. Once you have combined these items in your assembly kit, take
 the Savageclaw Leggings Material to a forge along with this mold to create your new leggings.");
	quest::summonitem(55419);	#leggings mold
}

if($text=~/bracers/i){
	quest::say("To craft a Savageclaw Bracer, you must obtain one small piece of ore, one shadeling silk,
 and two sharp bloodling mandibles. You should able to find the animal parts in Shadeweaver's Thicket and
 the ore somewhere here in town. Once you have combined these items in your assembly kit, take the Savageclaw
 Bracer Material to a forge along with this mold to create your new bracer.");
	quest::summonitem(55416);  #bracer mold
}


if($text=~/coif/i){
	quest::say("To make a Savageclaw Coif, you must obtain two small pieces of ore, one low quality
 rockhopper hide, one bone chips, and one shadeling silk. You should able to find the animal parts in
 Shadeweaver's Thicket and the ore somewhere here in town. Once you have combined these items in your 
assembly kit, take the Savageclaw Coif Material to a forge along with this mold to create your new coif.");
	quest::summonitem(55415);    #coif mold
}

if($text=~/gorget/i){
	quest::say("To make a Savageclaw Gorget, you must obtain one small piece of ore, one medium
 quality rockhopper hide, two bone chips, and one shadeling silk. You should able to find the animal 
parts in Shadeweaver's Thicket and the ore somewhere here in town. Once you have combined these items in
 your assembly kit, take the Savageclaw Gorget Material to a forge along with this mold to create your new
 gorget.");
	quest::summonitem(55417);	#gorget mold
}


if($text=~/gloves/i){
	quest::say("To make Savageclaw Gloves, you must obtain one small piece of ore, one needle thin claw,
 one bone chips, and one shadeling silk. You should able to find the animal parts in Shadeweaver's
 Thicket and the ore somewhere here in town. Once you have combined these items in your assembly kit, 
take the Savageclaw Gloves Material to a forge along with this mold to create your new gloves.");
	quest::summonitem(55420);	#glove mold
}


if($text=~/tunic/i){ 
	quest::say("To make a Savageclaw Tunic, you must obtain two small pieces of ore, one medium quality
 rockhopper hide, one sharp bloodling mandibles, one low quality rockhopper hide and one bloodling carapace.
 You should able to find the animal parts in Shadeweaver's Thicket and the ore somewhere here in town. Once
 you have combined these items in your assembly kit, take the Savageclaw Tunic Material to a forge along with
 this mold to create your new tunic. Once you have made your tunic, return to me and I may have another
 [task] for you to complete.");
	quest::summonitem(55421);	#tunic mold
}

if($text=~/task/i){
	quest::say("If you are truly ready, I will need you to travel to the Hollowshade Moor and bring me
 four cracked rhino beetle carapaces. You will find that Hollowshade Moor is a more dangerous hunting ground
 than Shadeweaver's Thicket, but trust in your primal instincts and you will persevere.");
}
}

sub EVENT_ITEM {

if(plugin::check_handin(\%itemcount,30660=>4)){
	quest::say("Congratulations, $name!  You are truly on your way to being a legendary berzerker.  Use
this axe wisely in your coming adventures.");   #adlib text
	quest::ding();
	quest::exp(1000);
	quest::summonitem(55423);	#savageclaw axe
}
plugin::return_items(\%itemcount);
}