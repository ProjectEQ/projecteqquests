################################### 
#Zone: Ak`Anon                    #                                              
#Short Name: akanon               #                                                                  
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Tergon_Brenclog        #                             
#NPC ID: 55133                    #
#Quest Status: Complete           #                                      
###################################
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Eh!!? What do I see before me? A young upstart? Some child pretending to be a great mind? If you wish to test your mettle then you will assist Tergon. Will you [Help Tergon] or are you far [too superior] to deal with such things?");
}
if($text=~/I will help tergon/i){
quest::say("No!! You will help yourself. Your task shall find your skills tested. Succeed and knowledge is yours. Fail and death shall embrace you. Go to the Steamfont Mountains and seek out a troll named Bugglegupp. As a youngster I once tried to attack the beast with a device of mine. It sent an Iron Pellet deep into the beasts head. Kill Bugglegupp and return the Iron Pellet. I hope the Pellet does not get lost in the battle.");
}
if($text=~/I am too superior/i){
quest::say("Well excuse me!! your majesty. Please forgive my arrogance. Now get out of here, before you stink this place up with that rotting grape you call a brain!");
}
if($text=~/What further tasks/i){
quest::say("Not all experience is gained upon the battlefield. We magicians must heighten our minds to become formidable opponents. I see much promise in you, Vaslin . I will require you to [travel abroad] toward Freeport.");
}
if($text=~/I will travel abroad/i){
quest::say("You will go to Freeport and seek out the Academy of Arcane Science. There you shall find my brother Retlon. He has scribed some new spells in my [personal spellbook]. Hand him this note as proof of your alliance. He works closely with Master Dooly Jonkers.");
quest::summonitem(1717);
}
if($text=~/What Defector/i){
quest::say("It seems a gnome magician by the name of Toko Binlittle has gone and left the guild. He joined forces with the [Pirates of Gunthak]. Find him. He must be destroyed. Our secrets cannot be known. Return his head to me and I shall give you the [Elemental Grimoire].");
}
if($text=~/What pirates of gunthak/i){
quest::say("From what I know, the Pirates of Gunthak are from the southern Gulf of Gunthak. It seems as though a small band of them has been operating within the Ocean of Tears, leagues from their own territory.");
}
if($text=~/what elemental grimoire/i){
quest::say("The Elemental Grimoire contains the knowledge which will advance your techniques in research. With it you shall learn to research spells and scribe them for your own spellbook."); }
}
sub EVENT_ITEM {
if($item1=="13333"){
quest::say("So, you have survived. There is no doubt in my mind that you achieved this solely with your own powers. Only a dim one requires the assistance of others. Take this. May it help you in your pursuit of greatness. [Further tasks] may bring you to that point.");
quest::summonitem(quest::ChooseRandom(15400,15397,15399,15398,15317,15058));
quest::faction(91,3);
quest::faction(71,-3);
quest::faction(322,-3);
quest::faction(115,3);
quest::faction(176,3);
quest::exp(150);
}
if($item1=="13387"){
quest::say("Thank you $name. I had no doubt you would fulfill my will and return my spellbook.. here is your reward for such effort. Now I have news of a larger matter. It has to do with a [defector].");
quest::faction(91,3);
quest::faction(71,-3);
quest::faction(322,-3);
quest::faction(115,3);
quest::faction(176,3);
quest::exp(150);
quest::summonitem(15058);
 }
  if($item1=="13388") {
    quest::say("Excellent work, $name. It's unfortunate this had to be done, but we cannot allow our secrets to fall into the hands of others.");
    quest::summonitem(17502); #elemental grimoire
    quest::exp(300);
    quest::faction(91,3);
    quest::faction(71,-3);
    quest::faction(322,-3);
    quest::faction(115,3);
    quest::faction(176,3);
  }
}