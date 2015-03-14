#Shazda Kaekwon - Stonebrunt
#NPC ID: 100150
#Items used:
#
#6966, Head of a Male Heretic Invader
#6967, Head of a Female Heretic Invader
#17884, Burlap Satchel
#6969, Satchel of Heretic Heads
#6955, Kejekan Tribal Headband
#6953, Swiftclaw Sash
#
#Requires a recipe (@4 or 6..  heads in empty satchel = #6969)
#Quest by Dave

sub EVENT_SAY {
  if($text =~ /Hail/i) {
    quest::say("Shalom, $name! I welcome you to our humble village in these [trying times].");
  }
  if($text =~ /trying times/i) {
    quest::say("There are many threats currently facing this village. The kobolds of Clan Kolbok are becoming bolder in pushing the boundaries of the territory in which they usually hunt. A few of the kobolds now hunt recklessly, killing for pleasure instead of sustenance. [Rognarog] the Infuriated is the most murderous of such kobolds. Then there are the [heretics] that have been invading both Clan Kolbok and Kejek territories alike, practicing their dark sorceries as a show of devotion to their faceless god.");
  }
  if($text =~ /heretics/i) {
    quest::say("The heretics have not only corrupted their own spirits but they defile the spirits of the dead with their evil sorceries. Fill this satchel with the heads of invading heretics and I shall reward you for your allegiance to Kejek.");
    quest::summonitem(17883);
  }
  if($text =~ /rognarog/i) {
    quest::say("Rognarog the Infuriated was once a mighty warrior for Clan Kolbok until his devotion to the kobold god Rolfron Zek devoured his spirit and drove him mad with anguish. Now he wanders the mountains and valleys of Stonebrunt shedding the blood of whatever creatures cross his path. Should you face Rognarog and release him from this life I will reward you for his severed head.");
  }
}

sub EVENT_ITEM {
  if($itemcount{6969} == 1) {
    quest::say("Less heretics to defile the lands and spirits. You have the gratitude of Kejek for your assistance in repelling the heretic threat.");
    quest::summonitem(quest::ChooseRandom(6955,6953));
  }
  if($itemcount{6968} == 1) {
    quest::say("Thank you $name. Let's hope that sends out a strong message to the hertics. Please, take this as a reward.");
    quest::summonitem(quest::ChooseRandom(6982,6983,6984));
  }
}

