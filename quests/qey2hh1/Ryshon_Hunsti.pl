# Part of Ghoulbane quest

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $name. What brings you to the Karanas? Do you seek [enlightenment]?");
  }
  if($text=~/enlightenment/i) {
    quest::say("Ahh, i could see by the look in your eyes that you are looking for something more than just enlightenment. Perhaps you are looking for a [sword] crafted by a noble man.");
  }
  if($text=~/sword/i) {
    quest::say("It is not just a sword friend. It is much more than that. This sword carries with it special [power], something unlike anything else within this realm.");
  }
  if($text=~/power/i) {
    quest::say("It is an instrument fashioned together by a noble man. It is said to be blessed by the gods themselves. Only a man who comes from nobility may wield it. Do you seek the [sword of nobility]?");
  }
  if($text=~/sword of nobility/i) {
    quest::say("I see.  Then take this note to Kanthuk Ogrebane. I've been told he can be found fishing not far from the dwarven city.");
    quest::summonitem(2416);
  }
}

# Quest edited by mystic414

