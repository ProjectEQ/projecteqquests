sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail $name. I am Bruax Grengar, master necromancer of the Bloodsabers. I assist not only young necromancers with their training but also aid all those Bloodsabers who have chosen to practice the [sorcerous arts]. If you a practitioner of a sorcerous art I can give you instructions to obtain an [outfit and robe] that will assist you in your work. Once you have been properly outfitted I will also assist you in acquiring a [Staff of the Bloodsabers].");
  }
  if($text=~/sorcerous arts/i) {
    quest::say("I speak of those who practice the sorcerous arts other than necromancy: the arts of Enchantment, Magery, and Wizardry. It is a common misnomer proclaimed by those uneducated to the ways of the Plague Bringer that only Shadowknights and Necromancers serve Bertoxxulous. In fact this temple alone has members from all walks of life, from tailors, scholars, and blacksmiths to warriors and sorcerers.");
  }
  if ($text=~/outfit and robe/i) {
    quest::say("I have prepared this special curing kit for the crafting of an outfit and robe. The materials required for each article of clothing vary. Do you desire to craft a [scourge sorcerer cap], [scourge sorcerer wristband], [scourge sorcerer gloves], [scourge sorcerer boots], [scourge sorcerer sleeves], [scourge sorcerer pantaloons], or [scourge sorcerer robe]?");
    quest::summonitem(17125);
  }
  if ($text=~/cap/i) {
    quest::say("To craft a Scourge Sorcerer Cap you will require two [silk thread], klicnik drone bile, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
    quest::summonitem(19555);
  }
  if ($text=~/wristband/i) {
    quest::say("To craft a Scourge Sorcerer Wristband you require a [silk thread], klicnik drone bile, and a king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
    quest::summonitem(19558);
  }
  if ($text=~/gloves/i) {
    quest::say("To craft Scourge Sorcerer Gloves you require two [silk thread], klicnik drone bile, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
    quest::summonitem(19559);
  }
  if ($text=~/boots/i) {
    quest::say("To craft Scourge Sorcerer Gloves you require two [silk thread], klicnik drone bile, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
    quest::summonitem(19561);
  }
  if ($text=~/sleeves/i) {
    quest::say("To craft Scourge Sorcerer Sleeves you require two [silk thread], klicnik warrior bile, and two large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
    quest::summonitem(19557);
  }
  if ($text=~/pantaloons/i) {
    quest::say("To craft Scourge Sorcerer Pantaloons you require two [silk thread], klicnik warrior bile, and four large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
    quest::summonitem(19560);
  }
  if ($text=~/robe/i) {
    quest::say("To craft a Scourge Sorcerer Robe you will require three [silk thread], klicnik noble bile, two giant king snake skins, and a giant whiskered bat fur. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
    quest::summonitem(11395);
  }
  if($text=~/staff of the bloodsabers/i) {
    quest::say("A Staff of the Bloodsabers is a useful implement for young sorcerers dedicated to Bertoxxulous the Plague Lord. I will assist you in the creation of a staff but first you must complete a task for me. The sorcerers of The Order of Three are supporters of Antonius Bayle IV. the haughty ruler of Qeynos. They lend magical aid to the Knights of Thunder and Priests of Life to identify and capture members of the Bloodsabers. A rather troublesome member of The Order of Three, Larkin Tolman, has recently been spotted at a settlement in the Western Plains of Karana. Find this Larkin Tolman and bring me his head.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20204 => 1)) {
    quest::say("Well done. The Bloodsabers have many enemies within the city of Qeynos and its surrounding regions. You must exercise much caution when not within the safety of our temple here in the Qeynos Catacombs. Take this Rough Bloodsaber Staff and when you have gathered a Giant King Snake Skin, two Gnoll Fangs, and a Giant Fire Beetle Eye, return them to me with this staff and I will complete its construction.");
    quest::summonitem(20203);
  }
  elsif (plugin::check_handin(\%itemcount, 13915 => 2, 19946 => 1, 13251 => 1, 20203 => 1)) {
    quest::say("Excellent work! Here is your reward.");
    quest::summonitem(20264);
    quest::exp(100);
    quest::ding();
    quest::faction(21,1);
    quest::faction(135,-1);
    quest::faction(235,1);
    quest::faction(257,-1);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qcat  ID:45065 -- Bruax_Grengar