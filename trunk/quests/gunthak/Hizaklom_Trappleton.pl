#zone: gunthak NPC: Hizaklom_Trappleton (224203)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("Well hey there youngin', what brings you to this neck of the woods?  Lookin' to buy one of my trained [drogmors] are ya?  Well ya come to the right place.  I've the best prices in all of the land when it comes to drogmors.  And you'll not find a better display of fine animals anywhere!  So if ya got the coin and the inclination, I've got just the thing to improve your traveling situation.  Step right up and take a look.");
 }
}