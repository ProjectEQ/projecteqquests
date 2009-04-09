sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Good day to you. $name!  I am Devin Ashwood.  Pleased to make your acquaintance."); 
}
if ($text=~/marry/i) {
  quest::say("Bah! Why would the greatest forester in all of Norrath ask you to marry him? Between his time spent protecting wildlife, hunting poachers and training me, I doubt he has any spare time for a foolish girl like you, sister.");
  quest::emote("Lily Ashwood sulks.");
}
if ($text=~/Ganelorn Oast/i) {
  quest::say("Ganelorn Oast! For he has single-handedly caught more poachers than any other ranger. He is credited for helping numerous endangered species recover from certain extinction. I suppose I am lucky he is fond of my sister, as I am soon to train under him as an apprentice. Perhaps one day I will even [call upon the flames] in the way that he does.");
}
if ($text=~/call upon the flames/i) {
  quest::say("Aye, Ganelorn is renowned not only for his abilities as an archer and a master of melee combat, but also for his use of powerful magics. Never before have I seen a forester evoke a fireball of such great force. It would be any ranger's dream to become his pupil just to study that one spell. Ganelorn doesn't train just anyone, though. If you want to learn from him, I'm certain you would have to prove yourself as a forester.");
}
if ($text=~/I want to learn/i) {
  quest::say("He is a very busy individual. I believe he is currently in the eastern part of the Karanas trying to track down a poacher. Even if you can track him down, don't get your hopes up.'
Lily Ashwood says 'Oh! If you're going to see him, would you please take this letter to him? I trust you, since you're a ranger and all.");
}
if ($text=~/I will take him the letter/i) {
  quest::emote("Lily Ashwood smiles sweetly. 'Thank you sooo much.'");
  quest::summonitem(20876);
}
}
#END of FILE Zone:gfaydark  ID:54081 -- Devin_Ashwood 

