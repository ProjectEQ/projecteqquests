sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Ahh. hello there $name. I am a trader from Sanctus Seru trying to make my way to Shadowhaven for some dealings. I have come this far with the aid of guards from Sanctus Seru, but they have turned back and left me to go on my own. I hear there are many terrible [creatures] here lurking in the shadows. Leave it to the guards of the Hand to leave me unprotected.");
  }
  if($text=~/creatures/i) {
    quest::say("What I was told is that this pass is filled with small horrible creatures with no eyes. Perhaps you could [help by providing safe passage] to the other side?");
  }
  if($text=~/help by providing safe passage/i) {
    #quest::say("Great! If I can get safely to the other side I will give you a small trinket that I was going to sell. Getting safe passage for the rest of my goods is worth more than the item in itself. Surely you know a good deal when you hear one. Take this note. If you agree to the conditions that I get across safely before you get payment return it to me and we will be on our way.");
    #quest::summonitem(5982);
    quest::say("I am not ready yet. Maybe later.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 5982 => 1)) {
    quest::say("Let us go then. Please be alert throughout the cavern. Once we get to the other side safely give me the signed agreement and you will have your payment.");
    quest::summonitem(5983);
  }
  elsif(plugin::check_handin(\%itemcount, 5983 => 1)) {
    quest::say("Thank you so much for your help! As I promised here is a small token of my appreciation.");
    quest::summonitem(5984);
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:netherbian  ID:Not_Found -- Lerin_Sardor