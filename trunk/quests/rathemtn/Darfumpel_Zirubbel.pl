sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. $name.  I am Darfumpel. master jeweler and proprietor of this shop.  How might I assist you today?  Perhaps you need a stone [cut] or some jewelry [repaired]?");
}
if($text=~/what cut/i){
quest::say("Yes. I use a new gemcutting technique I designed myself.  It will bring out the beauty of any gem.  However. as arrogant as this may sound. I do not cut just any ordinary stone.  They must be rare or of extraordinary quality.  Have you an exceptional stone that requires faceting?  If so. what type of gem is it?");
}
if($text=~/what repaired/i){
quest::say("Although more mundane a task. I do have a shop to keep up and so I repair jewelry for a nominal fee."); }
}
#END of FILE Zone:rathemtn  ID:50129 -- Darfumpel_Zirubbel 

