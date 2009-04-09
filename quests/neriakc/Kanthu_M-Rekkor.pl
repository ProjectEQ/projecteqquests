#Kanthu M'Rekkor, Neriakc 42075
#Status: COMPLETE

sub EVENT_SAY {
if($text =~ /Hail/i)
  {
  quest::say("Greetings, $name. So you are one of Selzar's new recruits. You are to assist in the construction of the armor you will don as a new Rogue of the House of the Ebon Mask. I have assembled a kit that is used in the crafting of Ashen Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor. ");
  }

if($text =~ /materials/i)
  {
  quest::say("Many species of dangerous creatures, the restless dead, and halfling invaders from Rivervale inhabit the Nektulos Forest. You must defeat these creatures and halflings in order to obtain the materials. The materials you seek depend on the piece of armor you desire. Do you desire to craft [gloves], [boots], a [bracer], a [coif], [leggings], [sleeves], or a [tunic]? ");
  quest::summonitem(17124); 
  }

if($text =~ /boots/i)
  {
  quest::say("To craft Ashen Bone Mail Boots you require two [silk thread], two ruined ash drakeling scales, and two halfling foot bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern. ");
  quest::summonitem(19561);
  }

if($text =~ /bracer/i)
  {
  quest::say("To craft an Ashen Bone Mail Bracer you require a [silk thread], a ruined ash drakeling scales, and a halfling ulna bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Bracer Pattern. ");
  quest::summonitem(19558);
  }

if($text =~ /coif/i)
  {
  quest::say("To craft a Ashen Bone Mail Coif you require two [silk thread], a ruined ash drakeling scales, and a halfling skull. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern. ");
  quest::summonitem(19555);
  }

if($text =~ /gloves/i)
  {
  quest::say("To craft Ashen Bone Mail Gloves you require two [silk thread], a ruined ash drakeling scales, and two halfling finger bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern. ");
  quest::summonitem(19559);
  }

if($text =~ /leggings/i)
  {
  quest::say("To craft Ashen Bone Mail Leggings you require three [silk thread], ash drakeling scales, two halfling tibia, and a halfling pelvis bone. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
  quest::summonitem(19560);
  }

if($text =~ /sleeve/i)
  {
  quest::say("To craft Ashen Bone Mail Sleeves you require two [silk thread], ash drakeling scales, and two halfling humerus bones. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern. ");
  quest::summonitem(19557);
  }
 
if($text =~ /tunic/i)
  {
  quest::say("To craft an Ashen Bone Mail Tunic you require four [silk thread], pristine ash drakeling scales, a halfling sternum, and a halfling ribcage. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern. ");
  quest::summonitem(19556);
  }
}

sub EVENT_ITEM {
if($itemcount{2416} == 1)
  {
  quest::say("Greetings, $name. So you are one of Selzar's new recruits. You are to assist in the construction of the armor you will don as a new Rogue of the House of the Ebon Mask. I have assembled a kit that is used in the crafting of Ashen Bone Mail. You must travel beyond Neriak into the Nektulos Forest for the [materials] that compose the armor. ");
  }
} 