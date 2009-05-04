sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. good adventurer!  I am afraid that my services are not available at the moment.  I am too worried about my [daughter].");
}
if($text=~/who is your daughter/i){
quest::say("My daughter's name is Lenara.  I have not seen her in several months. and I fear the worst.  She went off adventuring. even though I told her how dangerous it was."); }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 5573 => 1)) { #folded note
    quest::say("What's this? Oh my goodness! I was so worried I had lost my little girl. Thank you so much $name. Here please take this, it was once a magical cloak but its powers have diminished over time. If you take it to my wife in erudin I'm sure she can restore it.");
    quest::summonitem(1056); #Faded cloak
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
} 
#END of FILE Zone:felwithea  ID:61017 -- Tolkar_Parlone 

