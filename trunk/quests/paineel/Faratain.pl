sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Salutations $name. If you are here to make use of the forges then feel free to pursue your crafts within this chamber. If you are a new Fell Blade in need of a suit of armor and weapon then I will assist you in crafting [armaments] fitting of a young Shadow Knight.");
}
if($text=~/armaments/i){
quest::say("You will require this specially prepared Mail Assembly Kit in order to construct a suit of Fell Blade Armor. The materials required vary depending on the piece of armor you desire to craft. Once you have been outfitted in the Fell Blade Armor. return to me and I will present you with a somewhat important [task]. Do you desire to craft a [fell blade helm], a [fell blade bracer], [fell blade gauntlets], [fell blade boots], [fell blade vambraces], [fell blade greaves], or a [fell blade breastplate]?");
quest::summonitem(17124);
}
if($text=~/task/i){
quest::say("The blacksmiths of [Clan Kolbok] craft weapons using an ancient Kobold tradition that has been long forgotten by most of the kobold clans. I believe there is something to be learned from their traditions should we discover their intricacies. Go into the Warrens and locate the chambers of the kobold blacksmiths. There you should be able to find some record of their traditional techniques to return to me here in Paineel where they can be translated and studied.");
}
if($text=~/greaves/i){
quest::say("To assemble Fell blade Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Intact Kobold Pelts and two Calcified Tibia in the Mail Assembly Kit.");
quest::summonitem(19636);
}
if($text=~/helm/i){
quest::say("To assemble a Fell blade Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Kobold Pelt and a Calcified Skull in the Mail Assembly Kit.");
quest::summonitem(19631);
}
if($text=~/boots/i){
quest::say("To assemble Fell blade Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Kobold Pelts. and two Calcified Foot Bones in the Mail Assembly Kit.");
quest::summonitem(19634); 
 }
if($text=~/bracer/i){
quest::say("To assemble a Fell blade Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Kobold Pelt and a Calcified Ulna Bone in the Mail Assembly Kit.");
quest::summonitem(19632);
}
if($text=~/breastplate/i){
quest::say("To assemble a Fell blade Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Pristine Kobold Pelt, a calcified sternum, and a calcified ribcage in the Mail Assembly Kit.");
quest::summonitem(19637);
}
if($text=~/gauntlets/i){
quest::say("To assemble Fell blade Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Kobold Pelt and two Calcified Finger Bones in the Mail Assembly Kit.");
quest::summonitem(19633);
}
if($text=~/vambraces/i){
quest::say("To assemble Fell blade Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with an Intact Kobold Pelt and two Calcified Humerus Bones in the Mail Assembly Kit.");
quest::summonitem(19635);
}
 }

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20421 => 1)){
  quest::say("Well done $name. I will have this translated immediately so that it may be studied. Take this Dull Fell Blade Cutlass and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done bring me the Sharp Fell Blade Cutlass, a Large Briar Snake Skin, and a Petrified Eyeball and I will put the finishing touches on the weapon.");
  quest::summonitem(20403);
}
  if(plugin::check_handin(\%itemcount, 20404 => 1, 20355 => 1, 20402 => 1)){
  quest::emote("Faratain fashions a grip from the large briar snake skin, fastens the petrified eyeball to the pommel of the hilt, and polishes the blade with a shimmering black substance. I present you with your Fell Blade Cutlass. May it serve you well in the name of Cazic Thule.");
  quest::summonitem(20416);
 }
}

#END of FILE Zone:paineel  ID:75047 -- Faratain 