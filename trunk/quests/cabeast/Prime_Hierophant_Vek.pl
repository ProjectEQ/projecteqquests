sub EVENT_SAY { 
 if($text=~/hail/i){
  quest::say("Praise to the ancients, my friend! There is much suffering to be given unto the world. I am the Prime Hierophant of the Temple of Terror.  Through me and my fellow priests flows the wisdom of our ancestors.");
 }
 elsif($text=~/trades/i){
  quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
  quest::summonitem(51121);
 }
 elsif($text=~/second book/i){
  quest::say("Here is the second volume of the book you requested, may it serve you well!");
  quest::summonitem(51122);
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18206 => 1)){
  quest::say("Welcome, young petitioner. You have been summoned to this temple to join with the Scaled Mystics. Ours is the way of pain and suffering. Here is the weapon of a petitioner. Through you the power of our ancestors shall flow. As your wisdom grows, so shall your power. Someday you may be a vessel for the supreme might of the ancients. Seek knowldege with Oxyn, he is here to help you. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
  quest::summonitem(5140);
  quest::exp(100);
  quest::ding();
  quest::faction(282,20);
  quest::faction(193,10);
 }
 elsif(plugin::check_handin(\%itemcount, 18462 => 1, 22917 => 1)){
  quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
  quest::summonitem(7881);
  quest::exp(20000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
 elsif(plugin::check_handin(\%itemcount, 18359 => 1, 22916 => 1)){
  quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
  quest::summonitem(7881);
  quest::exp(20000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
}

#Submitted by Jim Mills, with thanks to BWStripes