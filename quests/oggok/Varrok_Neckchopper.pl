sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Me got da toughest weapons in da lands! Yoo come ta buy weapon or ta learn from Varrok bout [war mace] an [war hammer]?");
}
if($text=~/what war mace/i){
quest::say("Yoo want ta make mighty war mace? Den yoo must go to special Oggok forge with mold for head of mace. oak shaft for handle of mace. Ogre Swill. and sheet of adamantite. If yoo hab powerful shaman friend den maybe he give you imbued amber or jade to make mace even stronger. but If yoo do dat den you must use blood temper instead of Ogre Swill.");
}
if($text=~/what war hammer/i){
quest::say("Yoo want t' make ogre war hammer? Den yoo need ta go ta da special Oggok forge wit a mold for da head of da hammer. an oak shaft for da handle of da hammer. Ogre Swill. an a sheet of adamantite. Powerful shaman can gib ya imbued amber ' jade ta make it eben stronger hammer. but ib yoo do dat den yoo must use blood temper instead of da Ogre Swill."); }
}
#END of FILE Zone:oggok  ID:49051 -- Varrok_Neckchopper 

