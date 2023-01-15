#Kanthu M'Rekkor, Neriakc 42075
#Status: COMPLETE
# items: 17124, 19561, 19558, 19555, 19559, 19560, 19557, 19556, 2416

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, $name. So you are one of Selzar's new recruits. You are to assist in the construction of the armor you will don as a new Rogue of the House of the Ebon Mask. I have assembled a kit that is used in the crafting of Ashen Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
  }
  if($text=~/materials/i) {
    quest::say("Many species of dangerous creatures, the restless dead, and halfling invaders from Rivervale inhabit the Nektulos Forest. You must defeat these creatures and halflings in order to obtain the materials. The materials you seek depend on the piece of armor you desire. Do you desire to craft [gloves], [boots], a [bracer], a [coif], [leggings], [sleeves], or a [tunic]?");
    quest::summonitem(17124); # Item: Mail Assembly Kit
  }
  if($text=~/boots/i) {
    quest::say("To craft Ashen Bone Mail Boots you require two [silk thread], two ruined ash drakeling scales, and two halfling foot bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
    quest::summonitem(19561); # Item: Tattered Boot Pattern
  }
  if($text=~/bracer/i) {
    quest::say("To craft an Ashen Bone Mail Bracer you require a [silk thread], a ruined ash drakeling scales, and a halfling ulna bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Bracer Pattern.");
    quest::summonitem(19558); # Item: Tattered Wristband Pattern
  }
  if($text=~/coif/i) {
    quest::say("To craft a Ashen Bone Mail Coif you require two [silk thread], a ruined ash drakeling scales, and a halfling skull. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
    quest::summonitem(19555); # Item: Tattered Cap Pattern
  }
  if($text=~/gloves/i) {
    quest::say("To craft Ashen Bone Mail Gloves you require two [silk thread], a ruined ash drakeling scales, and two halfling finger bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
    quest::summonitem(19559); # Item: Tattered Glove Pattern
  }
  if($text=~/leggings/i) {
    quest::say("To craft Ashen Bone Mail Leggings you require three [silk thread], ash drakeling scales, two halfling tibia, and a halfling pelvis bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
    quest::summonitem(19560); # Item: Tattered Pant Pattern
  }
  if($text=~/sleeves/i) {
    quest::say("To craft Ashen Bone Mail Sleeves you require two [silk thread], ash drakeling scales, and two halfling humerus bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
    quest::summonitem(19557); # Item: Tattered Sleeve Pattern
  }
  if($text=~/tunic/i) {
    quest::say("To craft an Ashen Bone Mail Tunic you require four [silk thread], pristine ash drakeling scales, a halfling sternum, and a halfling ribcage. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
    quest::summonitem(19556); # Item: Tattered Tunic Pattern
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 2416 => 1)) {
    quest::say("Greetings, $name. So you are one of Selzar's new recruits. You are to assist in the construction of the armor you will don as a new Rogue of the House of the Ebon Mask. I have assembled a kit that is used in the crafting of Ashen Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor.");
    quest::exp(500);
  }
  else {
    quest::say("I do not need this.");
    plugin::check_handin(\%itemcount);
  }
} 