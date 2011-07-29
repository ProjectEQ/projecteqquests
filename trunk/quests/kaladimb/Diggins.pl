sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("How is life treating you, bud?  What are you doing around the mines?  Either you are a [member of 628] or you are lost.  If you are lost, I can't help you.  I ain't no guide.");
}
if($text=~/member of 628/i) {
  if ($faction <= 5) { # Require Indifferent and greater faction
     quest::say("I see you are interested in helping out. Good! For starters, go into the surrounding territory of Kaladim and destroy all the goblins. We hear they sometimes carry necklaces of ornate design. 628 wants these Runnyeye warbeads. You bring me no fewer than four and I will pay you and maybe, just maybe, I may have an extra piercing weapon lying around which has your name on it.");
  } else {
quest::say("Don't take this personally,  but I can't quite trust you with such matters.  Maybe a few less Butcherblock bandits would prove your worth.");
 }
}
if ($text=~/small job/i) {
  quest::say("Consider this both a favor and a test. I couldn't rest at night knowing that someone carrying around my secrets was anything less than proficient at smithin'. On top of that, relics crafted by the infamous $name will make some fine conversation pieces I think. Ha ha. If that isn't clear enough for ye, I'd like ye to demonstrate your skill with forge and a hammer. Here's a list of items that ye can make for me. Seal them up in this satchel when you're done and bring them back to me, lad.");
  quest::summonitem(8775);
  quest::summonitem(52331);
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 13931 => 4)) {
  quest::say("Good work. We shall add these to the stash. Here is your reward, as promised. Be happy with it and continue your work. Maybe soon you shall be able to [earn a parrying pick].");
  quest::faction(29,-10);
  quest::faction(33,-10);
  quest::faction(77,10);
  quest::faction(220,10);
  quest::faction(90,-10);
  quest::exp(5000);
  quest::summonitem(quest::chooserandom(7007,7008,7009,7010));
}  
if (plugin::check_handin(\%itemcount, 9813 => 1)) { #rogue 1.5 handin
  quest::say("Fine job, $name. I knew ye had the burning fire of a smith ragin' inside ye. These little relics are going on my mantle, or I may sell em. Not sure yet.' He sets the items aside, 'Now, sit fer a spell and allow me to tell ye what you need to know. It should go without sayin', $name, that a fine blade is crafted with the best metals possible. Any fool knows that. What ye don't know is that the lightest and sturdiest stuff to be found is an alloy called Velixite. With a few pounds of raw Velixite you could truly forge a blade to be feared. Give me jes' a moment while I take down some notes in your journal, $name. There ye are, all done!");
  quest::emote("You have coerced Diggins into revealing his secret. ");
  #Add global
}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladimb  ID:67017 -- Diggins 
