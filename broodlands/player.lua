local yarlir_popup_id = 2473 -- Journey of Yar`Lir task popup id

function event_loot(e)
  if e.corpse:IsNPCCorpse() and e.item:GetID() == 60284 then -- Symbol of Yar`Lir
    e.self:Popup("Journey of Yar`Lir", 'What is the journey of the one named Yar`Lir? Where did this creature come from and what does it have to do with these lands? The symbol you now possess may hold those very answers.<br><br>Are you willing to take the <c "#00ff00">Journey of Yar`Lir</c> and uncover the answers to these questions?', yarlir_popup_id, 0, 1, 0, "Yes", "No", 1)
    eq.set_timer("remove_symbol", 100)
  end
end

function event_popup_response(e)
  if e.popup_id == yarlir_popup_id then
    e.self:AssignTask(4914) -- Journey of Yar`Lir
  end
end

function event_timer(e)
  e.self:RemoveItem(60284) -- Symbol of Yar`Lir
  eq.stop_timer("remove_symbol")
end
