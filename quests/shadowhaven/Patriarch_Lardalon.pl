sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is a pleasure to meet you. $name. I am the residing High Priest of the House of Stout. Many have come to seek my guidance for I have seen many a foe in my fighting days. If you are interested in [lending a hand] to the House of Stout. I may have some tasks for you to complete");
}
if($text=~/I am interrested in lending a hand/i){
quest::say("Aye. its good to hear that! We need all the help we can get with all the dern [smugglers].");
}
if($text=~/what about the smugglers?/i){
quest::say("Well the smugglers are a threat to all that we have accomplished here they steal stolen goods and turn around to sell them and undercut all the merchants of our quarter. There is not much we can do about them now but in time I may need your help. For the time being however. if you wish to assist us there are other [tasks] which i need to be completed.");
}
if($text=~/what tasks?/i){
quest::say("I believe we have some letters and supplies that need a trustworthy courier to see that they reach their destination. With the problems of smuggling we are having lately we have had a shortage of honest folks outside of the Haven. Please see Coglixar for further information and inform him that you wish to assist.");
}
if($text=~/i am interested in lending a hand/i){
quest::say("Aye. its good to hear that! We need all the help we can get with all the dern [smugglers].");
}
if($text=~/what smugglers/i){
quest::say("Well the smugglers are a threat to all that we have accomplished here they steal stolen goods and turn around to sell them and undercut all the merchants of our quarter. There is not much we can do about them now but in time I may need your help. For the time being however. if you wish to assist us there are other [tasks] which i need to be completed."); }
}
#END of FILE Zone:shadowhaven  ID:150062 -- Patriarch_Lardalon 

