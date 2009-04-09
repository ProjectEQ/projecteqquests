sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hi there! Are you perhaps a musician? I have lots of finely crafted musical instruments for sale. Each one has its own unique tone. Take a look and see if there are any instruments here to suit your performance needs. Just tap me when you are ready to make a purchase."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5960 =>1 )) {
    quest::say("I would love to fill this order for you friend, but the lad that we sent out into the moor to hunt up our last batch of owlbear guts has not returned. No guts, no strings. I'm afraid that I have neither. If your master will allow it, perhaps you could go gather the guts for me. If you complete this task, I will waive the fee for his next couple of orders. I'm sure that he'll find that proposal pleasant enough. Here's a bag to gather the guts in. Please fill it before you return to me.");
    quest::summonitem(17612);
  }
  if (plugin::check_handin(\%itemcount,  5961=>1 )) {
  quest::say("Thank you for gathering these materials for me. This bag should last for some time. I'll need to clean this bag and make the strings. While I'm doing that, please take this note back to Gawfed and have him specify how many of each string he wants. He only listed the sizes in his note, not the quantities.");
  quest::summonitem(5962);
    quest::faction( 132,10 );
    quest::exp(1000);
  }
  
  if (plugin::check_handin(\%itemcount, 5963 =>1 )) {
  quest::say("Very good, he's got it all written down this time. These strings should work nicely for him, and let's not mention the fact that they are absolutely free. Take care and remember to shop here for all of your Jharin needs.");
  quest::summonitem(5965);
  quest::faction(132 ,10 );
  quest::exp(1000);
    
  }
 plugin::return_items(\%itemcount); 
}
#END of FILE Zone:sharvahl  ID:155208 -- Jangle 

