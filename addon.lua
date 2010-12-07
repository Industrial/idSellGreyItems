local frame = CreateFrame('Frame')

local function sell_grey_items ()
  local link
  for bag = 0, 4 do
    for slot = 0, GetContainerNumSlots(bag) do
      link = GetContainerItemLink(bag, slot)
      if link and select(3, GetItemInfo(link)) == 0 then
        ShowMerchantSellCursor(1)
        UseContainerItem(bag, slot)
      end
    end
  end
end

local function onevent (frame, event, ...)
  if event == 'MERCHANT_SHOW' then
    sell_grey_items()
  end
end

frame:SetScript('OnEvent', onevent)
frame:RegisterEvent('MERCHANT_SHOW')

