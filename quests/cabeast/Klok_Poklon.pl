sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Greetings, thirsty traveler. Pull up a stool and lay yer copper down. Its time to drink and be merry. Just don't get too merry or I will have to call the troopers.");
  }
 elsif($text=~/talon southpaw/i){
  quest::emote("feints with two quick left hooks!! 'Talon Southpaw. He had the fastest hands in the empire. I remember he once beat another lizard in an arm wrestling match. The amazing thing was, while he was gripping the croaks left hand, he left hooked him without losing his hold!! Thats quick!! I hear one of his treasured hands is in the possession of a monk called Master Rinmark.'");
  }
   if($text=~/Sisters of Scale/i && $shmskullquest >= 8 && $faction <= 5){
      quest::say("Hmm, yes, the Babble around here is that one of the Kloks in the Lake Garrison has one of the Sisters of Scale Skull up for Auction. The Temple will bury him when they hear of it!");
   } 
   if ($text=~/What memory of Sebilis?/i) {
     quest::emote("takes a sip of Legion Lager.");
     quest::say("Puhh...lease!! That's the little trophy the War Baron brought back from Sebilis. He got it stolen from him by some thieves!! I say it was the [Steelhead gang]. They were waltzing in and out of Cabilis like it was a blasted public vomitorium!!");
   }
   if ($text=~/What steelhead gang?/i) {
     quest::emote("picks some flesh from between his teeth.");
     quest::say("The Steelhead gang were a band of Forsaken thieves. No one knew this!! They used to walk around here like they were rebirthed!! They used to frequent my place and get involved in head butt contests. Whew!! I tell ya, the only way to crack their skulls is with a forging hammer!! Heheh!!");
   }
 }

 #Submitted by: Senzo aka Fatty Beerbelly
 #END of FILE : Zone : cabeast : NPC_ID : 3038 : Klok_Poklon