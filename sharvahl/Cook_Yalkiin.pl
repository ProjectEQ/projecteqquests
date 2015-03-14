#Cook Yalkiin Quests
#Beetle Claw Stew
#Worm Meat Broth
#Vegetables
#Also turn in for Taruun Apprentice quest

#Zone:sharvahl  ID:155207 -- Cook_Yalkiin

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to our kitchen! As you can tell we stay pretty busy in here. There are a lot of people to feed and a vast number of delicious meals to feed them. I'm in charge of preparing [stews], [broth], and [vegetables]. If you ever have any questions about those areas. please let me know.");
  }
  if ($text=~/vegetables/i) {
    quest::say("I could go on forever about vegetables. There is such a huge variety to choose from and so much that you can do with... well... come back a bit later and we can talk about them in greater detail.");
  }
  if ($text=~/stews/i) {
    quest::say("Stews are a staple in this kitchen. When a cook can't think of a real meal or needs to feed a large number of people in a hurry, they can always whip up a stew. You have to be able to adapt and provide, friend. That's our role here. We're here to make sure people eat. When food is abundant, we can be as lavish as we please. When I'm in a hurry or out of supplies, I like to throw some [beetle claws] in some boiling broth and... bam! It's soup!");
  }
  if ($text=~/beetle claws/i) {
    quest::say("Beetle claw stew is quick, easy, and fills stomachs. The main ingredient comes from the Rhino Beetles that can be found in abundance around the city. We use the claws in a variety of dishes, so we can always use a few more. Here, I can give you a bag if you want to go gather some for me. Just fill it up and come back.");
    quest::summonitem(17074);
  }
  if ($text=~/broth/i) {
    quest::say("I can make broth from just about anything. Meat, water, and spices can be turned into a base broth for just about and stew or sauce. The current favorite around here comes from the meat of the large worms that come up from the earth around the base of our city. I know that they look horrid, but they really do taste great! If you want to help, I will pay for every four servings that you bring me.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10390 => 4)) {
    quest::emote("looks at each piece of meat before wrapping them in a spiced cloth.");
    quest::emote("says, 'These look like good cuts of meat. I hope that this will suffice as payment,' as he stacks the wrapped meat on the counter.");
    quest::summonitem(quest::ChooseRandom(30580, 30577));
    quest::givecash(0, 0, 4, 0);
    quest::exp(1000);
    quest::ding();
  }
  if (plugin::check_handin(\%itemcount, 10391 => 1)) {
    quest::emote("tosses the bag in a pile with several others and hands you your payment.");
    quest::say("'Thank you very much,' he says. 'The more of these that I can gather, the better. I always seem to be low.");
    quest::givecash(0,0,6,0);
    quest::exp(1000);
    quest::ding();
  }
  if (plugin::check_handin(\%itemcount, 5559 => 1)) {
    quest::say("I'd love to fill this order, but we're out of the meat that he likes. We've been very busy today, so I doubt that any of us will be able to get out to gather more of it. If you could go out and grab us a few slabs, we could not only fill the order, I could put some away for anyone else that may come through today. This sounds like a perfect task for a young Taruun recruit. Fill this bag with the fatty meat from a young Owlbear and bring it back to me right away. I'll get Joharr's sandwiches as soon as you return with the meat."); 
    quest::summonitem(17608);
  }
  if (plugin::check_handin(\%itemcount, 5562 => 1)) {
    quest::emote("opens the bag and immediately begins to slice the meat into thin sheets. He throws the meat on a few slices of bread and wraps the whole thing up with a hand full of vegetables.");
    quest::say("Here you go, friend!' He says as he hands you what appears to be a lunch bag. 'Joharr should love these sandwiches! The meat that you brought us was great. If you ever need a job as a butcher, just let us know. Take care and tell Joharr I said hello.");
    quest::summonitem(5563);
    quest::ding();
    quest::exp(1000);
    quest::faction(132,10);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155207 -- Cook_Yalkiin