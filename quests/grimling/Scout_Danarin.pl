sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello $name. welcome to the front lines of our war against the bastard grimlings. As I'm sure you know. we Vah Shir shun violence, but with this enemy there is no other way. Let me know if you'd like to see some action.");
}
if($text=~/I would like to see some action/i){
quest::say("smiles. 'I can escort you to a camp rich with enemies. With my help you can take possession of their camp. They'll try desperately to reclaim their lost territory and, if we're lucky, an officer will show up. You'll want to bring about ten soldiers as powerful as me. When you're all here and ready for battle, give me a marbled acrylia sphere."); }
}
#END of FILE Zone:grimling  ID:167133 -- Scout_Danarin 

