sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say('Hello. I am the guild master.');
 }
 if ($text=~/small job/i) {
   quest::say("How's your sewing, $name?' Elyn smirks at the absurdity of her query. 'Don't worry, this ain't no woman's work. I've got my eye on a certain market - for those in need of tasteful tailoring that conceals cold steel. You'd be surprised how much interest there is in such a product. The catch is, I need high quality materials and I need this taken care of discreetly. My contact wants to see a sample of the product soon. Everything you need to know you'll find on this list. Bring the items back to me in this here satchel, and don't let anyone catch you at work.");
   quest::summonitem(8775);
   quest::summonitem(52330);
 }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 9807 => 1)) {
  quest::say("Mighty fine quality and craftsmanship if I do say so, $name. My contact will surely appreciate this. You've done right to bring this back so quickly. I was starting to think you had forgotten about our bargain.' She releases her grip on her dagger so that you can get a view of the handle. 'Take a close look. You see the grooves in the handle, the soft leather? This beauty was made specially to fit my hands. A fine blade ain't no good unless you can wield it well. It's tantamount important that your weapon is comfortable. It should be a part of you, an extension of your arm. How else can you expect to wield it well? This is the knowledge I pass on to you.");
  quest::emote("You have coerced Elyn into revealing her secret.");
}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
