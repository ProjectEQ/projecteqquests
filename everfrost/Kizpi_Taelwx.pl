sub EVENT_SAY {
  if(plugin::check_hasitem($client, 40900)) { #Satchel of Abu-Kar
    if($text=~/hail/i) {
      quest::say("Greetings! I see you have a fabulous Satchel of Abu-Kar in your possession. You are very lucky indeed to own such a wondrous item! I can however introduce to you a way to make it even better! Are you [interested]?");
    }
    if($text=~/interested/i) {
      quest::say("By gathering some items from the recently discovered dungeons around Norrath, your satchel can be upgraded to hold more items and become even more efficient. Journey to the Adventurer's Camp in the East Commonlands and talk to Kayci Strahtin. Take this note to him. It details the very difficult process of upgrading your satchel. Do not worry however. You need no knowledge of how to upgrade it yourself. My friends will assist you if you can gather the appropriate components. Stop by again some time! Safe travels.");
      quest::summonitem(55268); #Kizpi's Note
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
}