sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings and salutations, $name! My name is Reebo Leafsway, loyal Druid of [Karana]. I am in charge of helping young druids who wish to get started down the [trail to Karana's wisdom]. I also do my share of tending the [crops].");
  }
  if($text=~/shakey/i) {
    quest::say("Shakey is our protector and friend. He is just getting old. Losing his [stuffing]. His [head] is getting very cracked and dry as well.");
  }
  if($text=~/stuffing/i) {
    quest::say("The hay he requires is difficult to obtain. It must have been harvested from the Plains of Karana, then cursed by a high priest of the Faceless, [Cazic-Thule]. Finally, you must cast the hay and a flask of blessed Oil of Life into an armorer's forge. Only then will the hay be ready. We Stormreapers will reward you greatly if you could accomplish this task. Remember, you must give the scarecrow stuffing to Shakey only after it has been properly prepared.");
  }
  if($text=~/who is karana/i){
    quest::say("Karana is known as the Rainkeeper. It is through His will that our [crops] and our children grow big and healthy. He watches over us and protects us. calling down the fury of a tempest on those who wish harm upon His followers.");
  }
  if($text=~/crops/i) {
    quest::say("The crops we grow here are mostly carrots, lettuce and squash. We also are the only place on all of Norrath where the soil can support the mystical Jumjum Stalk.");
  }
  if($text=~/head/i) {
    quest::say("The head of a scarecrow is difficult to replace. We do not know what is needed and all of our attempts have failed. Perhaps you could [research] this for us and bring back a new head for our old friend Shakey?");
  }
  if($text=~/research/i) {
    quest::say("We have heard of a great forbidden tome penned by an evil necromancer that holds the secrets of instilling life into scarecrows. We have recovered pages from that book. That is how we know about Shakey's hay. But the pages detailing the creation of a scarecrow's head are missing. We believe that the Erudites possess at least some of the pages and might know where the rest of them may be found. Start your search in their city of Erudin.");
  }
  if($text=~/nillipuss/i) {
    quest::say("Nillipuss is a brownie that lives in the area who often steals and destroys our JumJum Stalk. Will you teach him a [lesson]?");
  }
  if($text=~/lesson/i){
    quest::say("Good. Bring me back some of the JumJum he has stolen and I will reward you for your trouble.");
  }
  if ($text=~/acknowledgment/i) {
    quest::emote("Reebo Leafsway shakes his head sadly");
    quest::say("Poor old [Shakey] just isn't what he used to be.");
  }
  if($text=~/trail to Karana's wisdom/i) {
    quest::say("Good. First you should learn that Karana's work is just that.. work. Karana provides us with the tools but it is by the sweat of our brows that we prosper. Common sense and hard work are two things that are highly prized by our people. Time for you to sweat, young one. Take this crate of carrots over to Blinza Toepopal in the Fool's Gold. They need our finest carrots for Mayor Gubbin's stew. When you return I will teach you a lesson of the Rainkeeper.");
    quest::summonitem(13971); 
  }
  if (($text=~/hail/i) && (plugin::check_hasitem($client, 52355))) {
    quest::say("You took care of our problem, $name, and for that you have my eternal thanks. With the new head you supplied, we should be able to squeeze a few more years out of Shakey. Not sure what you'd want to do with the old one. That dilapidated pumpkin is worthless. Moldy, dried out . . . doesnt hold a light. He shrugs empahtically. Go ahead and hold onto the thing if that tickles your fancy, though. May Karana watch over you in your travels!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13971 => 1)) {
    quest::say("Very good. Very good indeed. Karana does not need the blind obedience that so many deities require. Trust your instincts, they are more often right than not. Here, take this to Blinza. Hurry, she is expecting them. You may keep the donation she gives you in return.");
    quest::summonitem(13957);
  }
  elsif(plugin::check_handin(\%itemcount, 13972 => 1)) {
    quest::say("These carrots are rotten. They were rotten when I gave them to you. Why would you waste time and energy on such a fool's errand? Because I asked you to? Many, even those you trust will ask you to do things which you should not. Use the common sense that Karana has blessed you with to know which tasks can benefit our people and which could harm them. Learn this lesson well. You will need it if you plan to adventure beyond the vale. Now take these fresh carrots to Blinza and apologize for your error. You may keep the donation she gives you as payment.");
    quest::summonitem(13958);
  }
  elsif(plugin::check_handin(\%itemcount, 13974 => 3) || plugin::check_handin(\%itemcount, 13974 => 2) || plugin::check_handin(\%itemcount, 13974 => 1)) {
    quest::say("Oh good! I see you have taugh that nasty Nillipuss a thing or two! Good. But it seems to me that he has stolen more jumjum than this. Perhaps he needs another lesson?");
    plugin::return_items(\%itemcount);
  }
  elsif(plugin::check_handin(\%itemcount, 13974 => 4)) {
    quest::say("Excellent!!  You must have taught ol' Nillipuss a great deal!  But he never seems to learn..  Oh well.  The Stormreapers and all of Rivervale owe you a debt of gratitude.  Please accept this token of our appreciation.");
    quest::givecash(0,4,6,0);
    quest::summonitem(quest::ChooseRandom(10308,8303,8304,10302,10303,10304,10305,10306,10309,17302,12001,10301,17301,17300,12002));
    quest::exp(27440);
    quest::ding();
  }
  else {
    plugin::try_tome_handins(\%itemcount, $class, 'Druid');
    plugin::return_items(\%itemcount); # return unused items
  }
}

sub EVENT_SIGNAL {
 if($signal == 0) {
  quest::say("Old [Shakey] hasn't been feeling like himself lately, I'm afraid.");
 }
}
#END of FILE Zone:rivervale  ID:19056 -- Reebo_Leafsway