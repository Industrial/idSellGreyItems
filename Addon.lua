local frame = CreateFrame('Frame')
frame:RegisterEvent('MERCHANT_SHOW')
frame:SetScript('OnEvent', function (frame, event, ...)
  if event == 'MERCHANT_SHOW' then
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
end)

