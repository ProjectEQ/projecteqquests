##################################################
#  NPC:  Marton Sayer
#  Zone:  qeytoqrg
#  Quest:  The Gnoll Slayer
#  Author:  Andrew80k, corrected some of the text portions
##################################################

#remake of the the second make, Powerful dog part was screwed up but now fixed

#Script for marton_sayer in qeytoqrg. The gnoll slayer quest. 

#this is my revision of the one curently in cvs. the one there does not work. 



sub EVENT_SAY { 

   if($text=~/Hail/i){ 

      quest::say("Welcome. Please stock up on provisions, especially if you are headed toward the lair of the vile gnolls. If so, I wish you much luck and many gnoll pelts!! I also have knowledge of a [powerful dog]. I pray you do not encounter him."); 

   } 

   if($text=~/powerful dog/i){ 

      quest::say("I have encountered a gnoll who spoke the common tongue. He dared to call himself Lord Elgnub. He swore that some day we would cross paths and he would snatch my infant son Joseph from our home. He would stand no chance against me and the mighty [Gnoll Slayer]."); 

   } 

   if($text=~/gnoll slayer/i){ 

      quest::say("Gnoll Slayer is the mighty longsword which was passed down unto me through generations of Sayers. My days of battle are over, but I can still wield her with ferocity. The only thing more precious would be my son, Joseph Sayer. I would trade Gnoll Slayer only for him to be safe and sound at home."); 

   } 

   if($text=~/potential/i){ 

      quest::say("The true potential of Gnoll Slayer is an enchantment which was once imbedded into a gnoll's eye which was placed into the hilt of the blade. The spell would help you fight off disease and call forth a wolf to fight beside you. Alas, the gnoll eye was stolen from the blade by a great, one-eyed, white gnoll. Alone with the eye, the only book which explained how to return the enchantment was also stolen. I know not where this gnoll might be. If you can find the journal and the eye, return them with the Gnoll Slayer to me for I have been searching for decades."); 

   } 

} 

sub EVENT_ITEM { 

   if(plugin::check_handin(\%itemcount, 12204 =>1)){ 

      quest::summonitem(5416); 

      quest::say("Baby Joseph!! Look, Momma!! Baby Joseph has been rescued by this good adventurer!! That evil Lord Elgnub made good on his word and snatched my son from under our noses. You saved the day!! For this you shall wield 'Gnoll Slayer'!! Be aware of its [true potential]."); 

   } if(plugin::check_handin(\%itemcount, 8357 =>  1,  8356 => 1, 5416 => 1)){ 

      quest::summonitem(5417); 

      quest::say("You have found the missing pieces!  Now the Gnoll Slayer is returned to it's full power!"); 

       

   } 

}