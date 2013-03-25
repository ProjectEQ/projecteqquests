# Halas shaman quest armor
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name is it? Have you come to begin some [training]?");
  }
  if ($text=~/training/i) {
    quest::say("I can provide you with instructions on how to create a set of beginning [armor], fit for any Shaman of Justice.");
  }
  if ($text=~/armor/i) {
    quest::say("During your travels you will no doubt run into danger. It is best to have a sturdy set of armor to protect yourself. Take this Justice Plate Assembly Kit. You will use it to create the various parts of your armor such as [helm], [bracers], [armplates], [boots], [legplates], [gauntlets], and [breastplate]. When you combine components in your kit, make sure they are un-stacked. Let me know what piece you wish to craft and I will give you instruction.");
    quest::summonitem(55118);
  }
  if ($text=~/helm/i) {
    quest::say("'A helm is it? That is a fairly easy piece to start with. To craft your Helm of Justice, you will need two Small Pieces of Ore, one Gnoll Pup Scalp, and two Bone Chips. You should be able to find most of these items in Everfrost. The ore is most likely sold here in town. Once you have combined these items in your Assembly Kit, take the Helm of Justice Material to a forge along with this mold to create your new helm.");
    quest::summonitem(55134);
  }
  if ($text=~/bracers/i) {
    quest::say("To craft a Bracer of Justice, collect one Small Piece of Ore, three Bone Chips, and one Ruined Wolf Pelt. Once you have combined these items in your Assembly Kit, take the Bracers of Justice Material to a forge along with this mold to create your new bracers.");
    quest::summonitem(55136);
  }
  if ($text=~/armplates/i) {
    quest::say("To craft Armplates of Justice, collect two Small Pieces of Ore, two Polar Bear Skins, and one Patch of Gnoll Fur. Once you have combined these items in your Assembly Kit, take the Armplates of Justice Material to a forge along with this mold to create your new armplates.");
    quest::summonitem(55135);
  }
  if ($text=~/boots/i) {
    quest::say("To craft Boots of Justice you must find two Small Pieces of Ore, one Spiderling Legs, and one Polar Bear Skin. Once you have combined these items in your Assembly Kit, take the Boots of Justice Material to a forge along with this mold to create your new boots.");
    quest::summonitem(55138);
  }
  if ($text=~/legplates/i) {
    quest::say("Legplates of Justice offer great protection to one who is just starting their adventuring career. To craft your legplates you must find one Small Piece of Ore, two Polar Bear Skins, and two Bone Chips. Once you have combined these items in your Assembly Kit, take the Legplates of Justice Material to a forge along with this mold to create your new legplates.");
    quest::summonitem(55139);
  }
  if ($text=~/gauntlets/i) {
    quest::say("To craft Gauntlets of Justice, you must collect one Small Piece of Ore, four Bone Chips, and one Polar Bear Skin. Once you have combined these items in your Assembly Kit, take the Gauntlets of Justice Material to a forge along with this mold to create your new gauntlets.");
    quest::summonitem(55137);
  }
  if ($text=~/breastplate/i) {
    quest::say("The Breastplate of Justice is perhaps the most difficult piece that you will have to construct. To construct your breastplate, you will need to find three Small Pieces of Ore, two Polar Bear Skins, and one Spider Venom Sac. Once you have combined these items in your Assembly Kit, take this Breastplate of Justice Material to a forge along with this mold to create your new breastplate. Once you have completed your breastplate, I have another [task] for you should you feel ready.");
    quest::summonitem(55140);
  }
  if ($text=~/task/i) {
    quest::say("Prove to me that you are ready to move on and continue your training elsewhere. In Everfrost there are many dangers. One danger are the Snow Orc Troopers. Find four Wrath Orc Wristbands from the Snow Orcs in Everfrost and hand them to me. Do so and I will reward you and your training with me will be complete. May The Tribunal watch over you, $name.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12223 => 4)) {
    quest::say("You have done well and learned much during your training. You have made me proud, $name. Take this weapon as a symbol of your dedication and hard work. You have earned it. Your training with me has ended. Farewell.");
    quest::summonitem(55126);
    quest::exp(5000);
    quest::faction(294,30); #shamen of justice
    quest::faction(213,30); #merchants of halas
    quest::faction(33,-30); #circle of unseen hands
    quest::faction(48,-30); #coalition of tradefolk underground
    quest::faction(90,-30); #ebon mask
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: halas ID: 29079 NPC: Balgros_McMichael

