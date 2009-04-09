sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Greetings traveler, it has been ages since I have seen another living person. I have spent many years down here trying to perfect an ancient spell discovered long ago. While the history of this place is still told throughout Norrath, only those who live here know what really went on when the heretics moved down here. . . [Continue 1]?");
 }
 if($text =~ /Continue 1/i) {
	quest::say("After Paineel was built, some of its inhabitants began to research the Wall of Living Stone. It is said that the wall was erected to keep intruders from entering the Underfoot. Giving in to curiosity, the heretics tried to siphon some of the walls power. This caused a weakening in the wall and a seal within it broke creating an opening to the Underfoot. . . [Continue 2]?");
 }
if($text =~ /Continue 2/i) {

quest::say("The actions of my brethren were viewed as a threat by the minions of Brell, lord of the Underfoot, and so in an effort to drive back the danger, Brell's minions went to war with the heretics. The war resulted in the deaths of many Erudites. To turn the tides of war the heretics hatched a plan that would seal the wall to the Underfoot again. . . [Continue 3]?"); }

if($text =~ /Continue 3/i) {

quest::say("The heretics planned to flood the lower area where the entrance to Brell's kingdom was found, hoping it would weaken the earth elementals and turn them back into earth or mud.. Then, with a magic I had studied from a long-forgotten tome, I would fashion a seal that would separate Paineel and the Underfoot once more. . . [Continue 4]?"); }

if($text =~ /Continue 4/i) {

quest::say("I remember the day we all carried special shields imbued with water-breathing magic and stood around the top of the mighty Hole. We all watched as an unfathomable amount of water rushed from the heavens into the depths of the Hole, drowning the city beneath it. Unfortunately, our attempts resulted in the loss of many of our citizens, because we were not accustomed to fighting underwater. Some of our residents also refused to evacuate, believing they could fight the war without the use of innovative tactics. It was a terrible sight. . . [Continue 5]?"); }

if($text =~ /Continue 5/i) {

quest::say("Many died to Brell's minions and others simply drowned when they lost their shields in their fights. Even so, we were successful. I had time to seal the entrance to Brell's kingdom while the minions focused on their battles. With the muddy bodies of the failing earth elementals, I summoned an ethereal door that resealed the Wall of Living Stone. A few elementals survived and with the threat of Master Yael, a protector of the Underfoot that we believe was sent by Brell-Serilis, we all fled to the tower that lies above the entrance. . . [Continue 6]?"); }

if($text =~ /Continue 6/i) {

quest::say("The seal was a boon to our people. It helped us in two ways. First, it prevented more elementals from entering our city and, second, it cut off the magic that animated those summoned creatures that had come through. We wanted to remove those remaining elementals from our old city, but we had to wait until their powers begin to dissipate. . . [Continue 7]?"); }

if($text =~ /Continue 7/i) {

quest::say("As we waited for the day that we could get rid of Brell's influence, we begin to look for ways to compensate for our reduced numbers. That's when I discovered an old tome detailing a powerful animation spell. The author of the tome detailed how to construct golems and gargoyles and animate them with magic. I went to work using what materials I had here to sculpt some gargoyles and create some golem constructs in the hopes that we could banish the remaining inhabitants of Old Paineel. I think I managed to turn it into an art form. . . [Continue 8]?"); }

if($text =~ /Continue 8/i) {

quest::say("Alas, it took longer then I thought. I was so driven to get the summoned beings created that I completely detached myself from the other survivors. Then, I looked up and saw nothing but the spirits of my brethren. The years I must have spent oblivious to what transpired around me. . . [Continue 9]?"); }

if($text =~ /Continue 9/i) {

quest::say("I began to get lonely and was oft filled with regret. I thought I would try to reach those above the ground, but the elementals still lingered here and diminished any hope of getting to the entrance. With nowhere to go I continued to craft the lifeless statues that I would one day bring to life. . . [Continue 10]?"); }

if($text =~ /Continue 10/i) {

quest::say("Decades passed and I was finally ready to bring life to the stone figures I had created that would end the interference of Brell's minions. But before I begin the ritual, the spirits of my lost brethren began to whisper to me. . . [Continue 11]?"); }

if($text =~ /Continue 11/i) {

quest::say("In their hisses, I heard that another being had entered the Hole. The erudite phantoms told me that this being was slaying all the elementals that dared cross his path. They said he carried the scale of a red dragon as a sign of his strength. The news intrigued me so I rushed to find out who this person was. I was lonely and curious, after all. By time I had left my room in the temple's tower, he had already made his way to the tower entrance. Standing in front of me with ferocious eyes, he sheathed his sword and bowed before me. . . [Continue 12]?"); }

if($text =~ /Continue 12/i) {

quest::say("Who are you? I asked. He replied that he was the great dragon-slayer Nortlav, a warrior of dark magic, who had single-handedly slain a mighty red dragon. He said that he had been sent down here to find out what happened to the heretics. He was meant to bring back clues so that our fellow Erudites above could know what happened. Seeing me alive surprised him and he was anxious to get word back to his employers in Paineel. . . [Continue 13]?"); }

if($text =~ /Continue 13/i) {

quest::say("We sat in front of a fire for many hours as I told the tales of the battles waged down here. Nortlav was moved by the plight of the Erudites lost in the war and vowed to help me take our old city by ending the lives of the remaining minions of Brell. Through his studies of undead magics and summoning, Nortlav did have some knowledge about the magic that would build the constructs I had worked on for so long. . . [Continue 14]?"); }

if($text =~ /Continue 14/i) {

quest::say("That night when we chose to bring life to the mighty constructs I had been forming for so many years, there was a strange tension in the air. Strands of magic filled the tower as I recited the key words to execute the spell. Nortlav stood by and echoed my chants. All was going smoothly until an explosion blew Nortlav and me from our feet. . . [Continue 15]?"); }

if($text =~ /Continue 15/i) {

quest::say("Winded, I stood up to see a hulking mass of liquid black ore oozing towards me. Clearly, the spell had worked, but for some reason the stone had lost its temper. Instead of walking, the golems seemed to slide across the floor. It didn't matter to me then, as they did obey and would seek out the elementals and try to destroy them. . . [Continue 16]?"); }

if($text =~ /Continue 16/i) {

quest::say("Nortlav studied the tome I had been using and asked if I had used a chunk of living rock in the recipe. I told him that it was impossible for me to retrieve living stone on my own. For this spell, I used granite chunks I found at the tower. Nortlav's eyes glowed brightly as he rushed pass me saying he would return shortly. . . [Continue 17]?"); }

if($text =~ /Continue 17/i) {

quest::say("From deep in the caverns, I heard the cry of the horrible elemental guardian, Master Yael. He shouted Nortlav's name and I was sure I would never lay eyes on him again! But Nortlav burst through the door to my chambers with a fierce grin. Bloody and bruised, he reached out and opened his hand. Resting on his palm was a chunk of earth that he retrieved from Yael. He said that with that rock, the spell for the constructs should work. He told me that if I used the armor of my fallen comrades in the spell recipe, that I should be able to construct golems of steel, which would be much stronger then ones of stone. Then, Nortlav turned and disappeared into the hallways of the temple. I expected him to return to assist me with working the spell on my sculptures, but he never did. . . [Continue 18]?"); }

if($text =~ /Continue 18/i) {

quest::say("I called to the golems I had created earlier and commanded them to collect all the pieces of armor they could find on the floor of the Tower. While I waited for the steel ingredients, I smeared some of the earth taken from Yael's body on the gargoyles I had made and begin the ritual again. It worked far better than I could have imagined. Moving as if made of living tissue, the gargoyles sprung to life and crouched before me. I commanded them to begin sculpting more forms for me to give life to. . . [Continue 19]?"); }

if($text =~ /Continue 19/i) {

quest::say("The golems brought back piles of armor, which I coated with the mud from Yael's body and brought them to life. It wasn't long before I had created a significant army of summoned creatures that would help us reclaim our city from Brell's servants. . . [Continue 20]?"); }

if($text =~ /Continue 20/i) {

quest::say("When I felt it was the right time, I sent the constructs forth with one command -- destroy all elementals that inhabit the city. They marched forward and executed the command flawlessly. Realizing that in their weakened condition they stood no chance against my creations, the elementals begin to flee to a hidden part of the city. I called for my summoned creatures to stop their assault and told the spirits of my fellow heretics to once again take back that which was theirs. With relieved and grateful whispers, they floated back into the city and took the places they held when they were alive. . . [Continue 21]?"); }

if($text =~ /Continue 21/i) {

quest::say("There was a lingering issue, though. Ever since Nortlav gave me the earth he found on Master Yael, I had not seen him. It had been years since I'd set my eyes upon him. Escorted by some golems I began to search. Feeling confident and safe, we entered the chamber of Yael. He still stood! While he looked much weaker than the day he came through from the Underfoot, he was still an intimidating sight. . . [Continue 22]?"); }

if($text =~ /Continue 22/i) {

quest::say("I carefully looked around the chamber and saw a ghostly figure. With my brawny servants keeping an eye on Master Yael, I approached the ghostly figure hoping against all hope it wasn't that brave dragon slayer I had once known. But it was Nortlav. After the battle with Yael, he returned and was killed by Yael. Nortlav what happened? I asked. The incoherent moan was all I needed to ignite the flame of revenge inside of me. The thought of this great warrior being reduced to some mindless spirit trapped in Yael's domain caused a fire of hate to burn in my heart. . . [Continue 23]?"); }

if($text =~ /Continue 23/i) {

quest::say("In my fit of rage, I began the ritual again, with a few alterations. With some new words and reagents, I aimed to create the mightiest golem that had ever crushed the ground of Norrath. It's only purpose would be to destroy the failing Master Yael. I wanted the ultimate payment, the highest price possible for killing my people and extinguishing the flaming spirit of Nortlav. . . [Continue 24]?"); }

if($text =~ /Continue 24/i) {

quest::say("I remember the sweat forming on my brow as I twisted the spell to do my bidding. A whirling tornado of magic appeared before me and it was filled with as much rage as I had buried in me for countless ages. The room filled with a vicious storm of magic. I collapsed when the spell was completed. And when the room cleared, there it was -- my perfect construct. . . [Continue 25]?"); }

if($text =~ /Continue 25/i) {

quest::say("Towering over me, his pearly black skin gleamed. I shouted for him to destroy Master Yael and to make sure nothing else ever enters or leaves through the Wall of Living Stone. . . [Continue 26]?"); }

if($text =~ /Continue 26/i) {

quest::say("Master Yael shouted in vain as my construct ripped him to pieces. The battle lasted mere moments before its earthen corpse crumpled to the ground. Having completed its first task, the new construct stood in front of the Wall of Living Stone and called two other constructs to its side. The construct still stands there, forever watching for those creatures that would come through the wall from the Underfoot and violate my home. . . [Continue 27]?"); }

if($text =~ /Continue 27/i) {

quest::say("All of my efforts to reclaim Old Paineel for the heretics, and my vengeance, have taken a toll on me. With nothing to distract me, my desire to return to the world of the living slowly returned. While searching for a safe path to the surface, I discovered a secret wall I had never seen before. . . [Continue 28]?"); }

if($text =~ /Continue 28/i) {

quest::say("I stepped through and came upon a door that could not be opened by my fragile hand. I called to a construct and had it force the door open for me. What I discovered is what lies before you, three portals which take you above ground. The very same heretic who fashioned the spell for my constructs, also had the skill and talent to create the portals. I wonder if they were put there during the war as a failsafe escape. The fact that they weren't used concerned me. I thought they might be unsafe. . . [Continue 29]?"); }

if($text =~ /Continue 29/i) {

quest::say("I've gone through the notes that were left inside the ancient tome he wrote. After going through his notes I think I discovered the problem and have tried to fix it. I am still trying to figure out how these [portals] can be used to return here, but the tome was ripped to shreds one day during one of my experiments. Now the pages lie all over the place. While I have collected many of the pages I have yet to find the remaining twelve and the book cover. If I ever retrieve them I can rebind the book with the aid of the Tome of Research that is held by my perfect construct. In your travels if you happen to come across any of the pages I ask that you combine each chapter in this Lexicon. Then they can be combined with the book cover to complete that part of the ancient tome. When I have, I will be able to go to the surface and then return.");
}
 if($text =~ /What portals/i) {
	quest::say("If I remember correctly, the portal to my right will lead to New Paineel, the current home of the heretics. The one to my left it will lead to the prison in Erudin. The third one behind me leads to the home of the dark elves.");
 }
}