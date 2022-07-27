# items: 12451, 12448
sub EVENT_SAY {
  if($text=~/hail/i){
  # Catfish Croak Sandwich [Part 1]
    quest::say("Buy, buy, buy. Go ahead, make a purchase. I am not here to talk. Go to Cabilis for talk. Come to Foob for armor. Now hurry and.. Ooh.. Foob is starvings. Foob wish he had his [munch break favorite].");
  }
  elsif($text=~/munch break favorite/i){
  # Catfish Croak Sandwich [Part 2]
    quest::emote("rubs his tummy. 'Oh!! Catfish croak sandwich is my favorite, it is. Can only eats on my break. I haves one and one is what the Haggle Baron says to Foob. Only thing is Foob gets way tired from standing. Foob needs some broodling to [fetch the catfish croak sandwich] for him.'");
  }
  elsif($text=~/fetch.*sandwich/i){
  # Catfish Croak Sandwich [Part 3]
    quest::say("What?!! You dus gets Foob his sandwich for his munch break!! You be a good tail. Gets me two sandwiches, one fer break and one fer work, then me pay you something for the troubles. But it be no trouble. Foob is sure you know [how to make sandwich].");
  }
  elsif($text=~/how.*sandwich/i){
  # Catfish Croak Sandwich [Part 4]
    quest::emote("chortles loudly in disbelief. 'How you not know? It da best food. You gots to get a sewer catfish which swims in da Cabilis, and find lizard who have thin sliced froglok. Then all you need is shrub lettuce and honey mush bread. All dis in da oven makes a good sandwich.'");
  }
}

sub EVENT_ITEM {
 #Handin: 2x Catfish Croak Sandwich (12451)
  if(plugin::check_handin(\%itemcount, 12451 => 2)){
  # Catfish Croak Sandwich [Part 8][End]
    quest::say("Me thanks you very much!! Now me stop da tummy grumbles. You have this. And you takes dis. Foob make special, not sold yet, you test it. It is not toughest, but it take a little bashing just like you. It is called Foobscale!!");
  #Summon: Foobscale Coif (12448)
    quest:summonitem(12448); # Item: Foobscale Coif
  }
  plugin::return_items(\%itemcount);
}


#SQL: sharp cutting disk & catfish croak sandwich recipes have been submitted to db.
#Quest: Catfish Croak Sandwich (Submitted By: Senzo)

