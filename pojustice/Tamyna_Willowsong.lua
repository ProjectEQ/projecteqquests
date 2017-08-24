----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Tamyna Willowsong (201325)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("gives a solemn nod in recognition of ".. e.other:GetName() .. ", though her features are wrought with an unfathomable sorrow, 'Shhh, friend. The prisoners are not to speak here. If we are caught, we will be placed in solitary confinement, and I do not think that I would be able to endure that torment again. Nevertheless, your presence is comforting. It has been a long time since I have had another show any interest in me.' The Feir'Dal's face gains a strange light of wonder for a moment, 'Perhaps you would wish to [" .. eq.say_link("I wish to hear your tale",false,"hear my tale") .. "] and grant a brief moment of release from this torture?");
    elseif(e.message:findi("hear your tale")) then
        e.self:Emote("smiles gently, though the sorrow on her features almost sting at your heart, 'I'm grateful for it, friend. I was not always a prisoner and was once a being of good heart and faith. A bard of Erollisi Marr, I traveled Norrath in hopes of spreading joy and hope to all of its citizens. During my travels, my own heart was graced with Erollisi's passions in a most unfortunate and tragic [" .. eq.say_link("circumstance") .. "].");
    elseif(e.message:findi("circumstance")) then
        e.self:Say("I was visiting the city of Freeport, delivering one of my many tales to the people in the Theatre of the Tranquil. As I finished my tale, the most handsome man I had ever seen approached me. He gave praise to my tale and song and offered to walk with me a while through the Commonlands beyond. He claimed that he was enchanted and could not rest the night without being witness to my talents further, for my tales and voice struck his heart and spirit like no other. I was immediately enchanted with the half-elven gentleman and took his hand. Seemingly, it was a joyful man that led me through the calm Commonlands. I serenaded him with my lute and voice, all the while giving the glorious tales of Norrath's most notable legends. When the night turned to dawn and the sands of Ro were at our feet, he returned me to the city and our company parted at the bard's guild that housed me throughout my stay there. This meeting would [" .. eq.say_link("how did it change your life",false,"change my life") .. "].'");
    elseif(e.message:findi("life")) then
        e.self:Say("The handsome man, who revealed his name to me as Tarraul, returned for each of my shows and each night for the three weeks that I remained in Freeport, we spent together. I had fallen in love with the man -- more passionately and truly than I believed my heart possible. He claimed to return the same feelings for me, having brought gifts of single flowers upon each night that we met. I thanked Erollisi silently, for never in my deepest fantasies had I dreamed that such a love was possible. The final eve before my return to the isle of Erollisi in the Ocean of Tears, Tarraul proposed but it was not a moment of joy for me, for he held a condition -- a [" .. eq.say_link("What Choice",false,"choice") .. "] that tore me apart.");
    elseif(e.message:findi("choice")) then
        e.self:Say("Tarraul requested that I forfeit my place amongst the sister of Erollisi and join him solely in the city of Freeport. He claimed that he could not bear to be without me, should I be his bride, and that my dedication to the sisters would have us in needless separation. I asked if he would join me on my ventures around Norrath, but he declined, for Freeport was his home and his obligations resided there. I returned to the isle of Erollisi without an answer to my love's question. For a week I sat in thought and wonder, questioning my faith for the first time. How could I be given this gift of love -- so pure and whole in my entirety, but yet be asked to remove myself from that which had brought us together? I eventually made a [" .. eq.say_link("What was your decision",false,"decision") .. "], one that I would regret for the rest of my short life.");
    elseif(e.message:findi("decision")) then
        e.self:Say("I found Erollisi to be a cruel goddess whose followers were naive. I could not understand how the goddess of love would place one of her followers on a path of choice between the two guiding passions in their lives. I left the isle in fury, rudely denouncing my faith in the Queen of Love and forever removing myself from the order. I returned to Freeport and my love that eve. We were married the following week in a small, private ceremony performed by one of Tarraul's dear friends. It wouldn't be for another three years before I would discover exactly what [" .. eq.say_link("what had you done",false,"I had done") .. "].");
    elseif(e.message:findi("done")) then
        e.self:Say("One eve, a knock came upon our door. Tarraul and a fellow merchant were occupied at the time, engaged in affairs of business. I answered the door and to my surprise, two paladins from the Temple of Marr were at our door. They exclaimed that they wished to speak with my husband. Surprised and confused, I allowed them in and questioned their reasoning for coming to our home so late. They looked upon me with pity and expressed their remorse in having to reveal the truth of my husband to me in this fashion, but they had no choice. I was so confused and demanded to know why they were in my home. Tarraul had come down the stairs and the knights, pushing me aside, drew their blades and ordered that he go with them. My husband looked at me, a sly grin upon his face -- one that I had not seen in the years that I had known him. A split moment and all was rent. It would be too late before I discovered the '[" .. eq.say_link("truth") .. "]' the paladins had spoken.");
    elseif(e.message:findi("truth")) then
        e.self:Say("My husband did something I had not thought him capable of in the past -- he reached out his arms in a graceful arcane motion and uttered an incantation. The three of them were immediately engaged. I was confused, and concerned for my love's safety. I did not think clearly at that moment and drew my rapiers from their proper place upon the wall and joined my husband's side. It would work, somehow, that both paladins would fall to my blades and in the end, Tarraul would stand, smirking with an immeasurable sense of pride and a wicked light to his face that I shall never forget. He then took me upstairs and helped me wash the paladin's blood from my hands. My clothes were disposed of and my weapons polished. He spoke not a word to me, despite how I questioned him. Only the light of dark pride filled his eyes. The paladin's bodies were disposed of before I had finished cleaning up. Frantically, I demanded [" .. eq.say_link("answers") .. "] of my husband and finally, he gave them to me.");
    elseif(e.message:findi("answer")) then
        e.self:Say("I asked him why the paladins sought him and why his reaction was so brash and violent. He smirked at this and revealed something that should have torn me a part then, but had no effect. The half-elven man I had known for three years disappeared and in his wake, stood a Teir'Dal. He was an enchanter and an aid to the Dismal Rage and Sir Lucan D'Lere. He said he was proud of me, that the actions I was so quick to perform had surprised and intrigued him most deeply. I loved him still, for I cared not what race he was -- I still do not care. I could not see past his lies and deceit and I agreed to help him dispose of the paladin's bodies. We returned to our house and the last thing I remember was a muttered word and then darkness. I awoke in the prison beneath the Temple of Marr three days later. I never did see my husband again. The paladins would deliver unto me the short path that had dictated the rest of my short existence.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end