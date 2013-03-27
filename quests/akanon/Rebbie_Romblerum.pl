###################################
#Zone: Ak'anon                    #
#Short Name: akanon               #
#Zone ID:  55                     #
###################################
#NPC Name:Rebbie_Romblerum        #
#NPC ID:  55123                   #
#Author:Soulz                     #
###################################

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail $name!");
  }
  if ($text=~/silk thread/i) {
    quest::say("Silk Thread is created by combineing two spiderling silk in a sewing kit."); #text is made up as i could not find the real text reply.
  }
  if ($text=~/plague rust boots/i) {
    quest::say("To assemble Plague Rust Boots you will require two [silk thread], two ruined ebon drakeling scales, and two rebel clockwork foot plates. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
    quest::summonitem(19561);
  }
  if ($text=~/plague rust bracer/i) {
    quest::say("To assemble a Plague Rust Bracer you will require a [silk thread], ruined ebon drakeling scales, and a rebel clockwork wrist section. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Wristband Pattern.");
    quest::summonitem(19558);
  }
  if ($text=~/plague rust gloves/i) {
    quest::say("To assemble Plague Rust Gloves you will require two [silk thread], ruined ebon drakeling scales, and two rebel clockwork hand plates. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
    quest::summonitem(19559);
  }
  if ($text=~/plague rust leggings/i) {
    quest::say("To assemble Plague Rust Leggings you will require three [silk thread], two ebon drakeling scales, and two rebel clockwork leg sections. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
    quest::summonitem(19560);
  }
  if ($text=~/plague rust sleeves/i) {
    quest::say("To assemble Plague Rust Sleeves you will require two [silk thread], ebon drakeling scales, and two rebel clockwork arm sections. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
    quest::summonitem(19557);
  }
  if ($text=~/plague rust tunic/i) {
    quest::say("To assemble a Plague Rust Tunic you will require four [silk thread], pristine ebon drakeling scales, a giant rat pelt, and a rebel clockwork chest plate. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
    quest::summonitem(19556);
  }
  if($text=~/plague rust coif/i) {
    quest::say("To assemble a Plague Rust Coif you will require two [silk thread], ruined ebon drakeling scales, and a rebel clockwork head plate. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
    quest::summonitem(19555);
  }
}
 
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10988 => 1)) {
    quest::say("Hail $name! You must be one of Kaxon's new trainees. Kaxon has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Rust Mail you are planning on assembling. Do you wish to craft, a [plague rust bracer], [plague rust gloves], [plague rust boots], [plague rust sleeves], [plague rust leggings], or a [plague rust tunic].");
    quest::summonitem(17124);
  }
  plugin::return_items(\%itemcount);
}
#End of file