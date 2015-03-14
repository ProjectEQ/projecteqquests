sub EVENT_SAY {
  if ($faction <= 5) {
    if($text=~/hail/i){
      quest::say("Whatchoo want?"); 
    }
    if($text=~/dryad pate/i){
       quest::say("You want my secret recipe for Nymph Pate? You don't look like you could even cook a [Patty Melt] without making a disgusting mess, let alone something as delicate and refined as Nymph Pate!");
    }
    if($text=~/patty melt/i){
       quest::say("Yeah, you know a patty melt! It's like a [Grilled Cheese Sandwich] with some meat stuck in between the whole mess. Sheesh, are you a vegetarian or something?");
    }
    if($text=~/grilled cheese sandwich/i){
       quest::say("Great Brell's gravy, you are inept aren't you! I'll say this slowly. You take some bread, then you take some cheese then you put them together and cook it with a frying pan! I'll tell you what, if you can manage to figure out how to make a Patty Melt, bring it back to me and if it's halfway edible I'll give you my recipe for Nymph Pate.");
    }   
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 8194 => 1)) { #Hand-In: Patty Melt
    quest::emote("wolfs down the Patty Melt in one bite.");
    quest::say("Yeah, this isn't too bad I guess. Not nearly as good as I could have done though.");
    quest::emote("scribbles on a piece of paper and hands it to $name.");
    quest::say("Here is the recipe you wanted.");
    quest::summonitem(18430); #Elegant Pates
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:jaggedpine  ID:181119 -- Chef_Brargus 