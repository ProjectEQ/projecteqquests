----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Qallan Shellhopper (201224)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Good day to you, to you!  The Mother's Blessings shine upon you, upon you!'  He winks and smiles warmly at you.  'Such a lovely day, is it not?  A beautiful day indeed; one to treasure and to enjoy!  Have you come to [" .. eq.say_link("palaver") .. "]?'");
    elseif(e.message:findi("palaver")) then
        e.self:Emote("grins a wide, toothy grin.  'Brilliant!  I love a good chat.  The conversation around these parts isn't up to a great deal.  In fact, I'd go so far as to say that it's pretty bland.  What news from the [" .. eq.say_link("wild lands") .. "]?");
    elseif(e.message:findi("wild lands")) then
        e.self:Say("Ah, such beauty, such beauty.  I miss them more than any, more than any.  I'd love to see my home just one more time.  It's been so long, so long.  The likes of me, well we don't get to stay at home too much.  That's [" .. eq.say_link("the Gift") .. "] for you.  It gives, so it takes away, they say, they say.");
    elseif(e.message:findi("the Gift")) then
        e.self:Say("I've a little of the Touch in me, much like my Da and his Da before him, before him.  Sometimes it's a little flicker, a dim little candle, but mine...  so bright, they say, so bright.  The Chief took me aside as soon as he found out about my Gift.  That was so long ago now!  He took me out to the distant walks and told me what was to [" .. eq.say_link("happen") .. "].");
    elseif(e.message:findi("happen")) then
        e.self:Say("Sent away from home, from home.  So we all are, with the Touch, the Touch.  When the moon reaches its last Fill of the year, so she comes. Comes to us, she does, appears, appears. Of course to the tribe it must seem pretty fearful, but I know better now.  It's all the Gift, the Gift. She [" .. eq.say_link("showed") .. "] me.");
    elseif(e.message:findi("showed")) then
        e.self:Say("Showed she did!  She came on the last Fill of my fifteenth year, the year we leave behind our Strapling years and become Tribesmen!  On the Fill of the Moon she came, appearing out of nowhere, right in the village centre, as we waited, just as it's always been, always been.  She came for my Da when it was his time, and she came for my Da's Da before then.  She took me by the hand and closed my eyes, and smiled, smiled she did.  Then, the village was [" .. eq.say_link("gone") .. "]!");
    elseif(e.message:findi("gone")) then
        e.self:Say("Gone just like that, like that.  We were standing in a dark forest.  Scared I was, scared.  I clasped my paws over my eyes and prayed that the Watery One would whisk me away to a swift end.  Silly I know, I know.  Now I'm older, it's all very funny!  She comforted me, and sat me down, and told me what was to happen.  [" .. eq.say_link("Elder") .. "] she was, Elder.");
    elseif(e.message:findi("Elder")) then
        e.self:Say("You don't know the Elders?  Hush!  What kind of " .. e.other:Race() .. " are you!  The stories I learned when I was a wee strapling, all about them.  Forever they are, forever!  Few know anything of them really, but the stories are pretty fantastic!  And I got to meet one!  Well, not just one, but all [" .. eq.say_link("Nine") .. "]!  Seen I did, seen them all!");
    elseif(e.message:findi("Nine")) then
        e.self:Say("All Nine, yes indeed, yes!  All dancing and happy they were, in and about the clearing.  So busy the clearing, so full!  All over they come, all of the Wise Ones, and they all meet up in that forest once every year.  Every one has the Touch, like me, like me!  They all have the Gift, and they all use it to protect and care, to protect and care - following the Mother's will and some the Rainkeeper.  They knew my Da, and my Da's Da, and she who took me  there... she said she knew all of my Da's Das right back to the first Shellhopper that ever there was.  She must have been joking, she was so small - she didn't look even half the age of my [" .. eq.say_link("Ma") .. "]!");
    elseif(e.message:findi("Ma")) then
        e.self:Say("My Ma, I miss her more than anything.  It's probably why I [" .. eq.say_link("ran") .. "].  Doubt flickers across his face.  'Ran, I did.'");
    elseif(e.message:findi("ran")) then
        e.self:Say("I had to, had to!  I had to run, I couldn't stay there, away from me Ma for so long!  I had to go, don't you see?  Had to, had to!  The Elder one, she took me aside once I'd got there and eaten a bit.  She told me, told me.  All about what happens to those of us with the Touch, and how we come here to join and serve the Mother.  To join, to serve...  I can't join, and I can't serve!  I'm but a strapling, a strapling!  So I ran, I had to go.  I snuck out when the bonfires and dancing were at their highest.  Snuck out, snuck out, and into the forest!  I ran.  Right into their [" .. eq.say_link("camp") .. "].");
    elseif(e.message:findi("camp")) then
        e.self:Emote("looks uncharacteristically downcast for a moment, before raising his eyes to yours.  A tear rolls down his furry cheek.  'On the outer edge of the forest they were, they were.  A whole camp of them, of Greenskins, just like in the nursery rhymes.  What a to do, to do...  they tried to kill me, kill me!  I had to escape!  The Gift, it rose up inside me...  then the [" .. eq.say_link("explosion") .. "].");
    elseif(e.message:findi("explosion")) then
        e.self:Say("The noise!  Oh the noise, the noise!  I was so scared, so angry!  I had to get away!  I wanted to slow them Greenskins down, slow them so they couldn't chase me!  But, but...    one caught me, by the arm.  His touch!  So horrid, so horrid!  I turned on him and, and...  the next thing I know there is a big explosion and he is on fire, on fire!  Oh so terrible, I watched him burn in front of my eyes, like a shrimp on the charcoal.  He burned, and he screamed, and he screamed more, and his friends, they all ran, they ran.  She came after me, she held my hand and [" .. eq.say_link("talked") .. "].");
    elseif(e.message:findi("talked")) then
        e.self:Say("Talked, she did, the Elder.  She said she'd watched what happened but that it was Fate, she couldn't help me.  She brushed my hair, all soft like, just like my Ma used to.  She made me stop crying.  Told me it would all be ok, that everyone has to learn.  I couldn't believe it, I'd killed the Greenskin.  Killed!  Me, killed it!  Shellhoppers don't kill, don't kill.'  Tears pour from his sad, brown eyes.  'I [" .. eq.say_link("told her") .. "], I told her I did.");
    elseif(e.message:findi("told her")) then
        e.self:Say("I asked her to send me to the Judges of the Shells.  Where all the evil people like me go, all the murderers and killers and...'  Sobs wrack his body.  '... and all the poor Shellhoppers that kill Greenskins like shrimp on the charcoal.'  He takes a while to compose himself, then wipes his eyes.  'She looked at me, long and sad like.  Long and sad.  Said that she couldn't do anything since I asked for the Judges.  She kissed me on the cheek, kissed me and gave me this flower,  and then she was gone, everything gone.  I was here.  Here I am, still.   Here, and waiting.  Waiting.'  His tears fall onto the petals of a lotus flower that he clasps in his hands, as fresh as if it were recently plucked.  He lowers his head and his cries echo throughout the still air.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end