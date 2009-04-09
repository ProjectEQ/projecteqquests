sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hmmph!! Expect to be a great master such as I? Maybe. You still appear to be a [whiff].");
  }
  elsif($text=~/whiff/i){
    quest::say("A whiff is the sound of a tail striking air. A whiff is you. Inexperienced. I can help you, if you want to earn the [second shackle].");
  }
  elsif($text=~/second shackle/i){
    quest::say("Then you shall perform the first rite. Take this pack. To the Outlands you will go. You will fill and combine the pack with one of each of the following: goblin scout beads, a large scorpion pincer, a froglok skipper skipping stone, and a sabertooth cub canine. Bring these to me and you shall prove yourself a monk.");
    quest::summonitem(17026);
  }
  elsif($text=~/shackle of stone/i){
    quest::say("Interested in the shackle of stone are we? They are made for monks who have earned their first two shackles and are ready to climb up to the next rung. A monk who feels he is ready to wear the shackle of stone must first perform the [task of cleansing].");
  }
  elsif($text=~/task of cleansing/i){
    quest::say("Go forth to the outer gates and seek out the Iksar bandits. They have refused to bow to the will of the empire and shall pay dearly for their traitorous ways. They often wear bandit masks. If you return with two bandit masks and the shackles of dust and clay then I shall reward you with the shackle of stone.");
  }
  elsif($text=~/gandan tailfist/i){
    quest::say("Gandan Tailfist was a powerful commander of the Court of Pain. He went in search of the Whistling Fists, but all that was ever found of him was a worthless flute."); #Allah's comments hints at text, but gives nothing exact. Made this up in place of accurate text.
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 12427 => 1)){
  quest::say("You have succeeded, young $name! You have proven yourself a skilled monk. You will now wear the shackle of clay. You will now be required to increase your intensity of training in hopes that you may soon be able to earn your [shackle of stone].");
  quest::summonitem(4191);
  quest::exp(5000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
 elsif(plugin::check_handin(\%itemcount, 4190 => 1, 4191 => 1, 12428 => 2)){
  quest::say("You have done supremely, $name. You have earned your shackle of stone. Mistress Niska will now help you on your way to earning the shackle of rock. May the elements guide you to the next rung.");
  quest::summonitem(4192);
  quest::exp(10000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
 elsif(plugin::check_handin(\%itemcount, 18469 => 1, 12822 => 1)){
  quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
  quest::summonitem(7881);
  quest::exp(20000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
 elsif(plugin::check_handin(\%itemcount, 18470 => 1, 22924 => 1)){
  quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
  quest::summonitem(7881);
  quest::exp(20000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
 elsif(plugin::check_handin(\%itemcount, 18232 => 1, 18233 => 1)){
  quest::say("This is all that was ever found of Gandan Tailfist. I wish you luck in your quest. May you fare better than he did."); #Unable to find the true text; made this up
  quest::summonitem(12429);
  quest::exp(5000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
  #do all other handins first with plugin, then let it do disciplines
  else {
  plugin::try_tome_handins(\%itemcount, $class, 'Monk');
  plugin::return_items(\%itemcount);
 }
}
   
#Submitted by: Senzo aka Fatty Beerbelly
#Item_IDs : taken from : http://eqitems.13th-floor.org/
#END of FILE : Zone : cabeast : NPC_ID : 3432 : Master_Raska

 
