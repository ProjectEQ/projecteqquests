# Phylactery Will Get You Nowhere
# Created by Gonner

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hmmm. What? Oh sorry, I was snoozing. I was up throughout last night harvesting my [grapes] by the light of the moon.");
  }
  if($text=~/grapes/i) {
    quest::say("Why, my magic moon-harvested grapes, of course. I will give you some to sample if you would [help] me.");
  }
  if($text=~/help/i) {
    quest::say("The specially-prepared soil that grows the vines for my grapes is becoming muddy again. I need more of the magical sand from the deserts of Ro to mix with my soil. Bring me that and I will give you some grapes.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 16904 => 1)) { #Sand of Ro
    quest::say("Thank you so much. Here are the grapes I promised you. They may not look like much, but master brewers tell me they are required for many magical wines, including some sought by the most powerful magic-workers.");
    quest::summonitem(55276); #Moon-Harvested Grapes
  }
  plugin::return_items(\%itemcount);
}

# END of FILE Zone:misty  ID:33094 -- epicurean_halfling.pl