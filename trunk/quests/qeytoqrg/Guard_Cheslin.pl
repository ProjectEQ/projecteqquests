## Guard_Cheslin.pl
##
## Cheslin's Illusion Cards
## Created on April 19, 2010 by mrhodes

## Illusion Cards; Item codes
my $chrono = "13906";
my $diamond = "10037";
my $ebon = "13904";
my $library = "13905";

# Flags to keep track of what card was returned already
my $chronoReturned = "0";
my $diamondReturned = "0";
my $ebonReturned = "0";
my $libraryReturned = "0";

# Current grid Cheslin is on.
my $currentGridID = 100;

my $illusionResponse = "0";      #Used because there are two responses to the same word.  Just a way to keep track

sub EVENT_SAY{
   
   if($text=~/hail/i)
   {
      quest::say("Hail, mighty adventurer! I am Guard Cheslin Sydwend and I am here to serve and
         protect. Feel safe when we Qeynos guards are on watch. We are the best!");
   }
   
   if($text=~/father sent me/i)
   {
      #my $waitTime = quest::ChooseRandom("5", "10", "15");
      
      quest::say("My father has no need to worry and I do not need a baby sitter. I may be in training
         still, but a Qeynos guard in training is still a formidable opponent. EVIL, BEWARE!!   HAIL
         ANTONIUS BAYLE!");
      
      # Wait a random amount of time ( Anywhere between 5 to 15 seconds)   
      quest::settimer("1", 1);
   }
   
   if($text=~/illusion/i)
   {
      if($illusionResponse eq "0")
      {
         quest::say("Yes!! I seem to have dropped some of my [Illusion] cards.");
         $illusionResponse = "1";
      }else{
         quest::say("Oh!! Do you play Illusion, too? I love that game. I have some very rare cards in my deck. I
            seem to have dropped four of them somewhere during my last patrol. Darn it! They probably blew away
            the minute I dropped them! I will never find those cards again.");
         
         # reset illusionresponse for next time.
         $illusionResponse = "0";
      }
   } # if($text=~/illusion/i)
} # sub EVENT_SAY{

sub EVENT_TIMER{
   
   if($timer eq "1")
   {
      quest::stoptimer("1");      # Stop the timer....
      quest::say("Hail, fellow guards! I am off to protect the travelers of the hills from evil. I
         shall return!");
      quest::start(100);
   }
} # EVENT_TIMER


sub EVENT_ITEM{
   my $correcthandin = 0;
      
   if(plugin::check_handin(\%itemcount, $chrono => 1))
   {   
      $chronoReturned = 1;
      $correctHandin = 1;
   }
   if(plugin::check_handin(\%itemcount, $diamond => 1))
   {   
      $diamondReturned = 1;
      $correctHandin = 1;
   }
   if(plugin::check_handin(\%itemcount, $ebon => 1))
   {   
      $ebonReturned = 1;
      $correctHandin = 1;
   }
   if(plugin::check_handin(\%itemcount, $library => 1))
   {   
      $libraryReturned = 1;
      $correctHandin = 1;
   }
      
   if($correctHandin)
   {
      quest::say("Wow!! I thought I lost this for good. All together I lost the [illusion] cards: Ebon Lotus,
         Library of Erudin, Chrono Cyclone and Diamond Vale. Man!! Those are rare cards!");
      
      if($chronoReturned && $diamondReturned && $ebonReturned && $libraryReturned)
      {
         quest::say("Oh great! I have all my cards back. Here is a little something for assisting a Qeynos guard.
            And any time you are in trouble, just call on Cheslin, master swordsman. Take it to my father,
            Master Chesgard of the Knights of Thunder in Qeynos. No doubt he sent you to follow me on my
            watch.");
            
         quest::summonitem("18839");
         quest::faction(135, 5);      # Guards of Qeynos
         quest::faction(9, 5);      # Antonius Bayle
         quest::faction(53, -10);   # Corrupt Qeynos Guards
         quest::faction(33, -10);   # Circle of Unseen Hands
         quest::faction(217, 5);      # Merchants of Qeynos
         quest::givecash(8, 11, 2, 0);
         quest::exp(1500);
         quest::ding();      
      }
   }else
   {
      quest::say("I have no need for this, please have it back and let me finish my patrol...");
      plugin::return_items(\%itemcount);
   }
} # EVENT_ITEM

sub EVENT_WAYPOINT_ARRIVE{
   
   quest::say("Fear not, simple travelers. Cheslin the masterful is here to protect you.");
   
   if($currentGridID eq 104)
   {
      quest::stop();
   }
   if($currentGridID eq 103)
   {
      quest::creategroundobject($library, $x, $y, $z, 0, 3600);
      $currentGridID = $currentGridID + 1;
      quest::start(104);
   }
   if($currentGridID eq 102)
   {
      quest::creategroundobject($ebon, $x, $y, $z, 0, 3600);
      $currentGridID = $currentGridID + 1;
      quest::start(103);
   }
   if($currentGridID eq 101)
   {
      quest::creategroundobject($diamond, $x, $y, $z, 0, 3600);
      $currentGridID = $currentGridID + 1;
      quest::start(102);
   }
   if($currentGridID eq 100)
   {
      quest::creategroundobject($chrono, $x, $y, $z, 0, 3600);
      $currentGridID = $currentGridID + 1;
      quest::start(101);
   }
   
   if($currentGridID < 104)      ## If done and on his way back to tower no need to say this.
   {
      quest::say("Hey! Did I just drop something?");
      quest::say("'I lost some of my [illusion] playing cards. And they were the rare ones too! Darn it! If
         anyone finds them, please return them to me.");
   }
} # EVENT_WAYPOINT_ARRIVE 