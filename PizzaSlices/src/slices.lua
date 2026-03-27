PizzaSlices:RegisterModule('slices', function ()
  PS.slices = CreateFrame('Frame', 'PizzaSlicesSlices', PS)

  PS.slices.categories = {}

  local function getRaidmarkSlices()
    return {
      {
        name = '骷髅',
        tex = 'Interface\\AddOns\\PizzaSlices\\img\\skull',
        color = { r = .992, g = .988, b = .980 },
        action = 'raidmark:8',
        noBorder = true,
      },
      {
        name = '叉叉',
        tex = 'Interface\\AddOns\\PizzaSlices\\img\\cross',
        color = { r = 1, g = .275, b = .184 },
        action = 'raidmark:7',
        noBorder = true,
      },
      {
        name = '月亮',
        tex = 'Interface\\AddOns\\PizzaSlices\\img\\moon',
        color = { r = .431, g = .612, b = .753 },
        action = 'raidmark:5',
        noBorder = true,
      },
      {
        name = '星星',
        tex = 'Interface\\AddOns\\PizzaSlices\\img\\star',
        color = { r = .992, g = .988, b = .353 },
        action = 'raidmark:1',
        noBorder = true,
      },
      {
        name = '方块',
        tex = 'Interface\\AddOns\\PizzaSlices\\img\\square',
        color = { r = 0, g = .737, b = .988 },
        action = 'raidmark:6',
        noBorder = true,
      },
      {
        name = '菱形',
        tex = 'Interface\\AddOns\\PizzaSlices\\img\\diamond',
        color = { r = .698, g = .047, b = .816 },
        action = 'raidmark:3',
        noBorder = true,
      },
      {
        name = '三角',
        tex = 'Interface\\AddOns\\PizzaSlices\\img\\triangle',
        color = { r = .094, g = .937, b = .086 },
        action = 'raidmark:4',
        noBorder = true,
      },
      {
        name = '大饼',
        tex = 'Interface\\AddOns\\PizzaSlices\\img\\nipple',
        color = { r = .996, g = .439, b = .024 },
        action = 'raidmark:2',
        noBorder = true,
      },
      {
        name = '清除标记',
        tex = 'Interface\\AddOns\\PizzaSlices\\img\\clear',
        color = { r = .945, g = .890, b = .424 },
        action = 'raidmark:clear',
        noBorder = true,
      },
    }
  end

  local function getSpellSlices(tab)
    local function includeTab(tabName)
      if not tabName then return false end
      if tab then return tabName == tab end
      if tabName == '综合' then return false end
      if tabName == '坐骑' then return false end
      if tabName == '小伙伴' then return false end
      if tabName == '玩具' then return false end
      return true
    end

    local function includeSpell(spellName, spellRank)
      if spellName == 'Summon Warhorse' then return false end
      if spellName == 'Summon Charger' then return false end
      return PS.utils.isActiveSpell(spellName, spellRank)
    end

    return function ()
      local slices = {}

      -- Add class mounts if applicable
      if tab == '坐骑' then
        local _, class = UnitClass('player')
        local classMounts = {}

        if class == 'PALADIN' then
          table.insert(classMounts, 'Summon Warhorse')
          table.insert(classMounts, 'Summon Charger')
        elseif class == 'WARLOCK' then
          table.insert(classMounts, 'Summon Felsteed')
          table.insert(classMounts, 'Summon Dreadsteed')
        end

        for _, mountName in classMounts do
          local mount = mountName
          local hasMount, spellId = PS.utils.hasSpell(mount)
          if hasMount then
            table.insert(slices, {
              name = mount,
              tex = GetSpellTexture(spellId, 'spell'),
              color = PS.utils.getRandomColor(),
              action = 'spell:<name>',
              spellId = spellId,
            })
          end
        end
      end

      local slicesToAdd = {}
      for i = 1, MAX_SKILLLINE_TABS, 1 do
        local tabName, _, tabOffset, tabSpellCount = GetSpellTabInfo(i)
        if includeTab(tabName) then
          for spellId = tabOffset + 1, tabOffset + tabSpellCount, 1 do
            local spellName, spellRank = GetSpellName(spellId, 'spell')
            if includeSpell(spellName, spellRank) then
              slicesToAdd[spellName] = {
                name = spellName,
                tex = GetSpellTexture(spellId, 'spell'),
                color = PS.utils.getRandomColor(),
                action = 'spell:<name>',
                spellId = spellId,
              }
            end
          end
        end
      end

      for _, slice in pairs(slicesToAdd) do
        table.insert(slices, slice)
      end

      return slices
    end
  end

  local function getItemrackSlices()
    local slices = {}
    if Rack_User and Rack and Rack.EquipSet then
      local player = UnitName('player')
      local realm = GetRealmName()
      local rackConfig = Rack_User[player .. ' of ' .. realm]
      if rackConfig and rackConfig.Sets then
        for setName, set in pairs(rackConfig.Sets) do
          if setName ~= 'Rack-CombatQueue' then
            local name = setName
            table.insert(slices, {
              name = '装备方案: ' .. name,
              tex = set.icon,
              color = PS.utils.getRandomColor(),
              action = 'itemrack:<name>',
            })
          end
        end
      end
    end
    return slices
  end

  local function getMacroSlices()
      local regularMacros = {}
      local superMacros = {}

      -- 获取普通宏
      for i = 1, 36 do
        local name, tex = GetMacroInfo(i)
        if name then
          table.insert(regularMacros, {
            name = '宏: ' .. name,
            tex = tex,
            color = PS.utils.getRandomColor(),
            action = 'macro:' .. name,
          })
        end
      end


      -- 合并宏并添加空白分隔
      local slices = {}
      
      -- 添加普通宏
      for _, macro in ipairs(regularMacros) do
        table.insert(slices, macro)
      end
      
      -- 添加空白分隔行
      if PS.utils.length(regularMacros) > 0 and PS.utils.length(superMacros) > 0 then
        table.insert(slices, {
          name = 'spacer',
          type = 'spacer',
          height = 15,
          action = 'none',
          isSpacer = true
        })
      end
      
      -- 添加超级宏
      for _, macro in ipairs(superMacros) do
        table.insert(slices, macro)
      end

      -- 获取超级宏
      -- 检查超级宏插件是否存在，不存在则跳过加载
      local numSuperMacros = 0
      if type(GetNumSuperMacros) == "function" then
          numSuperMacros = GetNumSuperMacros() or 0
      end
      for i = 1, numSuperMacros do
        local name = SM_ORDERED and SM_ORDERED[i] or GetOrderedSuperMacroInfo(i)
        if name then
          local icon = GetSuperMacroInfo(name, "texture") 
          table.insert(slices, {
            name = '超级宏: ' .. name,
            tex = icon,
            color = PS.utils.getRandomColor(),
            action = 'macro:' .. name,
          })
        end
      end
      return slices
    end

  local function getItemSlices()
    local slices = {}
    local added = {}

    for bag = 0, 4 do
      local slots = GetContainerNumSlots(bag)
      for slot = 1, slots do
        local link = GetContainerItemLink(bag, slot)
        if link then
          local _, _, id = string.find(link, "item:(%d+):%d+:%d+:%d+")
          if id and not added[id] then
            local name, _, _, _, _, type = GetItemInfo(id)
            local isQuestItem = type == 'Quest' and string.sub(name, 1, 5) ~= 'Juju '
            if PS.scanner.isUsableItem(id) and not isQuestItem and type ~= 'Trade Goods' then
              local tex = GetContainerItemInfo(bag, slot)
              table.insert(slices, {
                name = name,
                tex = tex,
                color = PS.utils.getRandomColor(),
                action = 'item:<id>',
                itemId = id,
              })
              added[id] = true
            end
          end
        end
      end
    end

    return slices
  end

  local getSlices = {
    ['技能'] = getSpellSlices(),
    ['小伙伴'] = getSpellSlices('小伙伴'),
    ['综合'] = getSpellSlices('综合'),
    ['装备方案'] = getItemrackSlices,
    ['物品'] = getItemSlices,
    ['宏'] = getMacroSlices,
    ['坐骑'] = getSpellSlices('坐骑'),
    ['团队标记'] = getRaidmarkSlices,
    ['玩具'] = getSpellSlices('玩具'),
  }

  function PS.slices.load(withSpells)
    PS.slices.categories = {}
    for category, get in pairs(getSlices) do
      local slices = get()
      if slices and PS.utils.length(slices) > 0 then
        PS.slices.categories[category] = slices
      end
    end

    PS.rings.load(withSpells)
  end

  -- We still need to load slices on init() so it doesn't break
  -- when reloading UI because in that case, SPELLS_CHANGED is
  -- not fired...
  function PS.slices.init()
    PS.slices.load()
  end

  -- Spellbook and macros are only populated later during the
  -- login phase. Once they have been populated, reload all 
  -- slices. Then stop listening to SPELLS_CHANGED because 
  -- apparently it's being fired left and right.
  PS.slices:RegisterEvent('BAG_UPDATE')
  PS.slices:RegisterEvent('UPDATE_MACROS')
  PS.slices:RegisterEvent('SPELLS_CHANGED')
  PS.slices:SetScript('OnEvent', function ()
    if event == 'SPELLS_CHANGED' then
      PS.slices.load(true)
      PS.slices:UnregisterEvent('SPELLS_CHANGED')
    else
      PS.slices.load()
    end
  end)
end)