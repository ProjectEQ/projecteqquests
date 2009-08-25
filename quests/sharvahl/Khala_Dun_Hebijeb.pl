sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met. friend.  May I be of assistance?"); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 2877 =>1 )) {
  quest::say("I was told to expect you, $name. It is my duty to supervise this stage of your training, which will help strengthen you in preparation for your life of service to our people. There is much to do in very little time so let us begin. There are creatures that roam freely at the base of the rock on which we live. You are tasked with demonstrating a basic understanding of combat by defeating skeletons of grimlings and delivering to me four of their femurs.");  
  }
  if (plugin::check_handin(\%itemcount, 3443 =>4 )) {
quest::emote("looks at you with an expression of approval");
    quest::say("Your completion of the assigned task has been noted. Accept this weapon as a token of the Khala Dun's gratitude. You will find the Khala Dun to be very generous to it's humble students, quick to reward obedience. I have been notified that one of our citizens needs some assistance, bring me proof that you have aided Dronqam Runghi.");
    quest::summonitem(3445);
    quest::exp(1000);
    quest::faction(132,10 );
  }
if (plugin::check_handin(\%itemcount, 3449 => 1)) {
quest::emote("takes the acrylia dust and places it in a vial already half full of the metal");
quest::say("You are nearly finished with the task at hand, $name. I now need you to begin your training in the art of blacksmithing, an essential aspect of the life of the Khala Dun. Combine this mold with three metal bits and a flask of water to fashion a buckler frame. When this is done bring it to me with the Crude Bone Short Sword and your initiate's cloak.");
quest::summonitem(3450);
  
}    
if (plugin::check_handin(\%itemcount, 3451 =>1, 3445=>1, 2878=>1 )) {
  quest::say("Your progress pleases our order young one, and I am proud to promote you to the rank of recruit within the Khala Dun. Wear this cloak with pride, $name. I have completed your buckler as well as enhanced your sword. The blade will now be more effective when used against the skeletons from which it was constructed. Show the buckler to Armsman Khaigesh and he will instruct you further.");
  quest::shout("Fellow citizens of Shar Vahl, help me welcome $name to the rank of recruit in the honorable Khala Dun. May his actions henceforth reflect the strict sense of loyalty to our king that defines our order. May he exhaust his every resource in glorious defense of our proud people!");
  quest::faction( 132,10 );
  quest::exp(2000);
  quest::ding();
  quest::summonitem(3453);
  quest::summonitem(3452);
  quest::summonitem(3454);
}
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155082 -- Khala_Dun_Hebijeb 

