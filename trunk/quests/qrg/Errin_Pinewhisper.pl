#Zone: Surefall Glades
#Short Name: qrg
#Zone ID: 3
#
#NPC Name: Errin Pinewhisper
#NPC ID: 3041
#Quest Status: finished
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to Surefall Glade friend. I am Errin Pinewhisper, Ranger of Karana the Storm Lord. You will find worshipers of both Karana and Tunare residing here in harmony. I train young rangers of both faiths and assist them in getting prepared for work in the often dangerous lands beyond the glade. If you are in need of a [sturdy outfit] suitable for work as a young ranger then I will gladly instruct you on the means to obtain one.");
  }
  if ($text=~/sturdy outfit/i) {
    quest::say("This specially prepared curing kit will allow you to craft an outfit that will protect you in the wilds of Norrath. The materials required for the outfit vary depending on the piece you desire to craft. Do you desire to craft Pine Scout [Gloves], Pine Scout [Boots], a Pine Scout [Bracer], a Pine Scout [Cap], Pine Scout [Leggings], Pine Scout [Sleeves], or a Pine Scout [Tunic]? Once you are properly outfitted there is an [issue] that you may be of assistance in resolving.");
    quest::summonitem(17125);
  }
  if ($text=~/boots/i) {
    quest::say("To craft Pine Scout Boots you require two [silk thread], ruined gnoll chain boots, two giant field rat whiskers, and a large whiskered bat fur. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
    quest::summonitem(19561);
  }
  if ($text=~/bracer/i) {
    quest::say("To craft an Pine Scout Bracer you require a [silk thread], a ruined gnoll chain bracer, and a giant field rat whiskers. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
    quest::summonitem(19558);
  }
  if ($text=~/cap/i) {
    quest::say("To craft a Pine Scout Cap you require two [silk thread], a ruined gnoll chain cap, a large whiskered bat fur, and a large field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Coif Pattern.");
    quest::summonitem(19555);
  }
  if ($text=~/gloves/i) {
    quest::say("To craft Pine Scout Gloves you require two [silk thread], ruined gnoll chain gloves, two giant field rat whiskers, and a large whiskered bat fur. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
    quest::summonitem(19559);
  }
  if ($text=~/leggings/i) {
    quest::say("To craft Pine Scout Leggings you require three [silk thread], ruined gnoll chain leggings, two large whiskered bat furs, and a giant field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
    quest::summonitem(19560);
  }
  if ($text=~/sleeves/i) {
    quest::say("To craft Pine Scout Sleeves you require two [silk thread], ruined gnoll chain sleeves, two large whiskered bat furs, and a giant field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
    quest::summonitem(19557);
  }
  if ($text=~/tunic/i) {
    quest::say("To craft a Pine Scout Tunic you require four [silk thread], a ruined gnoll chain tunic, a giant whiskered bat fur, and a giant field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
    quest::summonitem(19556);
  }
  if ($text=~/silk thread/i) {
    quest::say("Silk thread is created from two spiderling silks woven together in a sewing kit or loom.");
  }
  if ($text=~/issue/i) {
    quest::say("A poacher was recently discovered hunting the bears in Surefall Glade and Qeynos Hills. This poacher has been identified as Yollis Jenkin and it appears that he has fled to Western Plains of Karana to escape retribution by the Jaggedpine Treefolk for his murders. Find Yollis Jenkin and tell him the Jaggedpine Treefolk sent you. He is wanted dead or alive so if he resists capture then bring me his head.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19949 => 1)) {
    quest::say("It is a shame when human blood must be shed in the defense of our brother wolves and bears. I thank you for your dedication to the Jaggedpine Treefolk. Take this rusty pine scout sword and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done return the sharpened sword to me with a gnoll fang and a large king snake skin and I will put the finishing touches on the weapon.");
    quest::faction(159,30); #jaggedpine treefolk
    quest::faction(265,30); #protectors of pine
    quest::faction(267,30); #qrg protected animals
    quest::faction(347,-30); #unkempt druids
    quest::faction(135,30); #guards of qeynos
    quest::exp(5000);
    quest::summonitem(19950);
  }
  elsif (plugin::check_handin(\%itemcount, 20104 => 1, 13915 => 1, 19945 => 1)) {
    quest::emote("fashions a grip from the large king snake skin, attaches the gnoll fang to the heel of the swords hilt, and polishes the blade of the sword with a luminescent green polish.");
    quest::say("Here is your new weapon young ranger. May it serve you well.");
    quest::faction(159,30); #jaggedpine treefolk
    quest::faction(265,30); #protectors of pine
    quest::faction(267,30); #qrg protected animals
    quest::faction(347,-30); #unkempt druids
    quest::faction(135,30); #guards of qeynos
    quest::exp(10000);
    quest::summonitem(20263);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}

#END of FILE Zone: qrg ID:3041 -- Errin_Pinewhisper


