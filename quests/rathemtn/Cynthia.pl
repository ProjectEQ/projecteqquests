# Part of quest for Rod of Insidious Glamour

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hello. I am Cynthia.");
  }
}

sub EVENT_ITEM {

  # A Glamour Stone
  if(($itemcount{10085} == 1) && ($gold >= 50)) {
    quest::say("I've done what I can to enchant your stone, but you will need to find Tarn Visilin in Highpass Keep to finish the enchantments.  Don't forget to pay him the same fee you gave me, or he may decide to keep the stone for himself!"); # Made this text up
    quest::summonitem(10086);
  }

}

# Quest by mystic414

