# NPC: Larsk_Juton
# Zone: Qrg
# By Andrew80k

sub EVENT_SAY {
 if($text =~ /Hail/i) {
        quest::say("Hail, Adventurer! I hope you are enjoying your time in Surefall Glade. You must be careful when leaving the Jaggedpine. There have been many report of [Sabertooths] attacking travelers.");
 }
 if($text =~ /Sabertooths/i) {
        quest::say("The gnolls of Blackburrow are called Sabertooths. They have been seen in force on a regular basis. They are surely up to something. We have even heard rumors of a [pact] between Qeynos merchants and the dogs.");
 }
 if($text =~ /pact/i) {
        quest::say("Sources have come forward to tell of a pact between a merchant of Qeynos and the Sabertooths. It all has to do with blades and brew. We hear that a meeting will occur soon, somewhere in the Qeynos Hills at night. Do not fear, we shall find a brave ranger to [halt this meeting].");
 }
 if($text =~ /halt this meeting/i) {
        quest::say("Very good of you. Stop this meeting by killing the gnoll in Qeynos Hills. We hear that he shall be there in the late evening, and that his name is Furgoot or Furgy, something like that. Find him and kill him. I want his head. And if you should find any evidence of who the merchant is, be sure to hand it over to me.");
 }
 if ($text =~ /assist in the extermination of the gnoll brewers/i){
        quest::say("Within the bowels of Blackburrow, our scouts have reported seeing the gnoll brewers.  You will go and brave the lair of the dogs and slay these brewers in order to cease the flow of Blackburrow Stout.  During your mission, should you find any Blackburrow casks, you must return them to me.  When you have recovered three of these casks, I shall award you the [Cloak of Jaggedpine].");
 }
 if ($text =~ /Cloak of Jaggedpine/i) {
       quest::say("The Cloak of Jaggedpine was made for those loyal to the ways of the forest.  It is enchanted to increase one\'s dexterity.  It is awarded to those who have aided in our cause to rid the land of those vile dogs called the Sabertooths.  Should you earn one, be sure to hold onto it - you never know when we may alter the enchantments placed upon the cloak.");
 }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  if(plugin::check_handin(\%itemcount,13309=>1)) {
     quest::say("So, I see you rid the hills of the beast. Good work! I have a reward for you. I hope it will be usefull. I am afraid this gnoll\'s death will not halt the alliance between the two. I shall require your services to [assist in the extermination of the gnoll brewers].");
     quest::faction(265,10);
     quest::faction(159,10);
     quest::faction(279,-30);
     quest::faction(135,10);
     quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
     quest::summonitem(2140);
     quest::exp(1000);

  } elsif (plugin::check_handin(\%itemcount,17970=>3)) {
     quest::say("Excellent!  Ridding the area of those foul beasts will certainly slow down whatever it is they are planning.  Here is the Cloak of Jaggedpine.  You should keep this, for you never know when we may decide to alter the enchantments on it.");
     quest::summonitem(2915);
     quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
     quest::faction(265,10);
     quest::faction(159,10);
     quest::faction(279,-30);
     quest::faction(135,10);
     quest::exp(1000);

  } elsif (plugin::check_handin(\%itemcount,18811=>1)) {
     quest::say("Fine Work, $name. Hmmm. It seems this needs taking care of. Take this note to the Captain of the City Guard in Qeynos. His name is Captain Tillin. He will have to attend to this matter. Also.. Let me see the gnoll\'s head. I must know you killed him. Be safe, my friend. I am sure that whoever this McNeal is, he was simply a lackey. Whoever he works for is most likely going to be looking for you. Watch your back in Qeynos.");
     quest::summonitem(18811);
     
  }    
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}