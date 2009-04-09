sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Might you be an [apprentice] or a [guide]?' Llara then grins evilly...");
 }
 elsif($text=~/apprentice/i){
  quest::say("Welcome to the Guide Program, $name. I am sure you will enjoy your time here. Do not worry about being only an apprentice right now, I'm sure that in time you will be ready for promotion. This is truly the best place to be in the world. Good luck to you, $name!");
 }
 elsif($text=~/guide/i){
  quest::emote("cracks her whip in $name's direction and says, 'Well, if you are a guide, then what the heck are you doing here!?! Get to work on the queue, it's not going to be under 20 all day!.'");
 }
 elsif($text=~/miss you/i){
  quest::say("I miss you, too, $name! But don't worry about me. I am in a good place now, watching over all of you.");
 }
 elsif($text=~/Valtron/i){
  quest::say("I am Llara. I was a guide on Erollisi Marr some time ago. I passed away shortly after becoming an apprentice trainer. My rebirth came from the help of Valtron. He is that stinky little dorf always running around Norrath. Valtron held a memorial service on Erollisi Marr shortly after I passed away. It was truly a beautiful event. Many people showed up to honor my passage.' Llara smiles...");
 }
 elsif($text=~/your story/i){
  quest::say("Llara was a Guide on Erollisi Marr server. She was there for 6 months and was also the training Co-Ordinator. David, her controller, was a private person but we did learn that he was married with a family and had a dry sense of humour that tickled us all. Llara was one of those Guides, who hardly ever missed a shift and if she did, she never missed posting it. She never complained, not about a petitioner, a peer or the weather. On one Sunday while waiting for new candidates for buffing Llara hadn't been in touch with us like she always was. The Guide Board was checked and it was noticed that she hadn't guided since Wednesday and for someone who was -always- around it seemed very strange. GM Valtron was called to ask when he might be in to buff the new apprentices and if he had heard anything from Llara. While talking to him, an email from Heather, David's daughter arrived. She explained that David had a heart attack on the Tuesday night and had sadly not survived.");
 }
}

#Submitted by: Jim Mills