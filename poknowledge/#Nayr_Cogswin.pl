#Nayr_Cogswin.pl
#Rallican's Bracer


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hey watch it $race. Never mind, my concentration is broken. I just can't figure out how I am going to do it without help. What would [Rallican] say if he knew how much of a failure I have become.");
  }
  if($text=~/rallican/i) {
    quest::say("Who is Rallican you say. Take a seat there little one and listen up. Rallican was a good friend of mine he was a tough adventurer whose exploits would have become legendary. For some reason he had the strangest luck, it seemed like nothing could happen to him. He always said that it was his lucky bracer that brought him such luck. Rallican always wore this jewel covered bracer which he called his good luck charm. The bracer was made out of a special metal with a unique gem in the center. While the bracer had no special qualities it was really quite a sight to see. He swore that nothing could happen to him as long as he had it on. . . That's why I refuse to believe something [happened].");
  }
  if($text=~/happened/i) {
    quest::say("Well Rallican went out on a journey one day. Trusty bracer on his wrist and supplies on his back, he said he was going to find the materials his bracer was made of in hopes that I could make a spell that would summon replicas of the bracer. I never heard from him again. They say his remains were found in Innovation but until I see that bracer as proof I refuse to believe he is gone. Since that day I have been trying to somehow make the spell because that is what he would have wanted me to do, but I have not been able to without those [materials].");
  }
  if($text=~/materials/i) {
    quest::say("An Oxidized Steel Plate and a Cohesion Gem are what I need to make a Rallican Bracer replica spell. Now that I think about it I will also need a Gallenite Sapphire Bracelet to use as a base. Now I know what you're thinking, strong guy like me should be able to go and collect those ingredients with no problems. Well to tell ya the truth, I am an old little gnome even though I don't look it. So I was hoping that, seeing as how you disturbed me and all, you would be willing to collect those ingredients and bring them back to me. If you do I will make an extra scroll to give to you and you can make bracers of your own providing you are a fellow member of the summoning class.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 67022 => 1, 31993 => 1, 29798 => 1)) {#Cohesion Gem, Oxidized Steel Plate, Gallenite's Sapphire Bracelet
    quest::emote("'s eyes widen with anticipation as he pulls a small jeweler's kit from his back pocket. Placing the gem and the iron inside Nayr steps back as smoke begins to spew froth from the concoction. 'Hmmm I think I may have worked but we won't know until the smoke clears. Anyways thanks for your help here is your reward as promised. Now I know it may not be an exact replica but at least you will never run out.'");
    quest::summonitem(59568); #Spell: Summon Steel Bracelet
    quest::exp(4088112);#3% of level 47 exp
  }  
  plugin::return_items(\%itemcount);
}
#Done