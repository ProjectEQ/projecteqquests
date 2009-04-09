sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Shalom friend. My mate Kalaaro is the primary blacksmith of our village. I mostly create his tools. do touch ups and refurbishes. and maintain the [kejek forge].");
}
if($text=~/what kejek forge?/i){
quest::say("Our forge has received the blessings of the Titan Spirits to burn with a supernatural flame! This flame has many beneficial properties but most importantly it can aid in freeing the spirits that have been imprisoned in materials by evil sorcerers."); }
}
#END of FILE Zone:stonebrunt  ID:100115 -- Emylie_Steelclaws 

