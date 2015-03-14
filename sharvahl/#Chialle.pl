sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello there traveler. Please take a moment to look at my goods. I have delicious meals perfect for traveling conditions.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30625 => 4)) {
    quest::say("Oh wow! This is just what I was hoping for. Thank you so much! You must be a real good friend to Saren to have her make you these, she never makes freshly squeezed nectar unless she really likes someone. You have a kind heart Khatzhana. Please take this with you as a token of my friendship.");
    quest::summonitem(30609);
    quest::exp(10000);
    quest::ding();
    quest::faction(132,20);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_WAYPOINT_ARRIVE {
  if ($wp == 1) {
    quest::settimer(1,120);
  }
  if ($wp == 2) {
    quest::stoptimer(1);
    quest::say("Whew! I sure could use something sweet to drink.");
  }
  if ($wp == 13) {
    quest::emote("makes a deposit.");
  }
}

sub EVENT_TIMER { 
  my $random = int(rand(6));  

  if ($random == 0) {
    quest::say("Weary traveler, please come have a look at my foods. My almonds make for a great traveling snack."); 
  }
  if ($random == 1) {
    quest::say("Welcome to Shar Vahl! Please come look at my goods. Try my Shawerma sandwiches. I'll give you a good deal.");
  }
  if ($random == 2) {
    quest::say("Come have a look at my goods. I have lots of delicious food that travels well."); 
  }
  if ($random == 3) {
    quest::say("Hold friend! Come see what I have to offer. Salted fish! Fresh Almonds! Delicious sandwiches!"); 
  }  
  if ($random == 4) {
    quest::say("Hey there, don't be shy! Come over here and have a look at what I have for sale."); 
  }  
  if ($random == 5) {
    quest::say("Don't let yourself go hungry brave adventurer. My food is fairly priced, come see for yourself."); 
  }
}