sub EVENT_ITEM{
  if($item1 == 10351){ #Brass Earring
    quest::say("Outstanding! If you can kill the taskmaster, you might prove useful in recovering the items the orcs took from me when they caught me out in the Faydarks. Interested in helping me out?");
    quest::summonitem(13850); #Unfinished Blade Mold
    quest::exp(3000);
    quest::ding();
  }
  if($item1 == 9307){ #Shiny Brass Shield
    quest::say("'MY SHIELD!! Excellent, laddie! Next item on the list is my ringmail. Once I have my [ringmail], I am out of here for good. I will finally be able to leave!");
    quest::summonitem(13851); #Unfinished Sledge Mold
    quest::exp(3000);
    quest::ding();
  }
  if($item1 == 3301){
    quest::say("AHA!! My ringmail!! My, you ARE a resourceful one! Here is your reward as promised. It is exquisite, if I do say so myself. You might also wish to tell the priest in the cell over there that the king is dead. I am sure he will be pleased to hear that and might even be able to help you further. Farewell! It's time for me to make my escape!");
    quest::summonitem(6315);
    quest::exp(30000);
    quest::ding();
    quest::depop();
  }
}
sub EVENT_SAY{
  if($text=~/what ringmail/i){
    quest::say("The king was the last person I heard of who was wearing what sounded like my ringmail. Return it to me and I will reward you with a fine weapon I forged myself.");
  }
}