sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Step forth. young $name!  I heard that you have come of age!  The spirit of adventure has entered your body.  That is good.  Go and speak with the others.  They shall help you.  I am afraid I have no time to spend conversing.  There is much I have to [ponder].");
}
if($text=~/what ponder/i){
quest::say("Must you know everyone's business?  Hmm..  Maybe you can be of assistance.  You see. I have been instructed by Furtog to tend to a matter of extreme urgency. which is keeping me from clearing the mines of rats.  Will you assist and [exterminate the rats]?");
}
if($text=~/i want to exterminate the rats/i){
quest::say("Very good!  I shall reward you for every four giant rat pelts returned to me.  And be on the lookout for a [metal rat]!");
}
if($text=~/what metal rat/i){
quest::say("I cannot tell you how many reports I have heard of metal rats in Kaladim.  I first thought it was a vision obtained from having too many Tumpy Tonics. but Furtog himself is said to have seen them.  If you ever catch sight of the little metal beast. give chase!!  Return its metal carcass to me and I shall reward you."); 
}
if ($text=~/doran vargnus/i) {
  quest::say("Doran resides on an island in the Ocean of Tears. The island is filled with beautiful maidens. I could think of worse places to live.");
}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 13054 =>4 )) {
   quest::say("Great work, young one! We shall soon rid our mines of these pests. Keep a lookout for that [metal rat]. Here is a small reward for such fine work. Soon, you shall be know as Kaladim's resident exterminator.");
  quest::exp(500);
  quest::ding();
  quest::faction( 314,3 );
  quest::faction( 169,3 );
  quest::faction( 219,3 );
  quest::faction( 215,3 );
  quest::faction( 57,-5 );
  quest::givecash(0,3,0,0);
}
if (plugin::check_handin(\%itemcount, 13282 =>1 )) {
  quest::say("I thank you, my friend. I was to destroy this metal monster months ago. I could never find him. Please accept this reward for such good service. Oh yes.. And take this card to a man named [Doran Vargnus]. He is a blacksmith. I am sure he will reward you with one of his finest suits of armor. Perhaps you may now assist me in an [important Stormguard matter].");
  quest::exp(500);
  quest::ding();
  quest::faction( 314,3 );
  quest::faction( 169,3 );
  quest::faction( 219,3 );
  quest::faction( 215,3 );
  quest::faction( 57,-5 );
  quest::givecash(6,0,0,0);
  quest::summonitem(13995);
}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladima  ID:60007 -- Beno_Targnarle 
