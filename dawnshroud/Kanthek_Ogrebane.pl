sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there $name. Welcome my friend! Please sit and rest yourself. There are many [predators] around. I suggest yourest a bit before continuing your journey.'");
}
if($text=~/what predators/i){
quest::say("Just take a look around and see what's around you. There's [galorians]. [lightcrawlers]. [zelniaks]. and [rockhoppers] everywhere. They usually let us be. but I've seen 'em kill. It's not something you want to see.'");
}
if($text=~/what galorians/i){
quest::say("It's been a while since I've seen the Tribal Council. but they have been known to show up unexpectedly. I'm sure if you find Glenda Melonfus. she'll be able to tell you more about them'");
}
if($text=~/what lightcrawlers/i){
quest::say("Lightcrawlers are the biggest bugs I've ever seen. I've heard of bigger. but I've never seen 'em myself. If you're interested in getting some [armor] made out of their shells let me know and I'll see  if we can work something out.'");
}
if($text=~/what armor/i){
quest::say("My cousin can make you some armor. but it'll cost ya. What exactly are you looking for? You looking for a [breastplate]. [greaves]. [helm]. [bracers]. [arms]? You tell me and I'll see what I can do. The only problem is I only have enough material to make a small set. So you might not be able to fit in 'em.'");
}
if($text=~/what breastplate/i){
quest::say("Faber Rugon can make a fine breastplate for you. but it'll require two Pristine Lightcrawler Shells.'");
}
if($text=~/what greaves/i){
quest::say("Give Faber Rugon back two sets of Lightcrawler Legs and two Shimmering Lightcrawler Shells.'");
}
if($text=~/what helm/i){
quest::say("Interested in a new helm. eh? Alright. Bring Faber Rugon two Ardent Lightcrawler Shells and he'll be able to help you out.'");
}
if($text=~/what bracers/i){
quest::say("Faber Rugon can only make one bracer for you. but one will be enough. Bring him back two Stripped Lightcrawler Shells and you'll be set.'");
}
if($text=~/what arms/i){
quest::say("Alright. Bring my cousin. Faber Rugon. back two Spotted Lightcrawler Shell and he'll be able fashion up a fine pair of arms for you.'");
}
if($text=~/what zelniaks/i){
quest::say("Zelniaks don't tend to mess with the likes of others. unless provoked.'");
}
if($text=~/what rockhopper/i){
quest::say("Rockhoppers took over the cave system near Maiden's Eye. They are a crazy bunch of lizards. I suggest stay out of their way. The galorians are even scared of them and they're not scared of much.'");
}
if($text=~/what bracer/i){
quest::say("Faber Rugon can only make one bracer for you. but one will be enough. Bring him back two Stripped Lightcrawler Shells and you'll be set.'"); }
}
#item's are handed into faber rugon in sseru
#END of FILE Zone:dawnshroud  ID:174108 -- Kanthek_Ogrebane 

