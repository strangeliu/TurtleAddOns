if not SilverDragon then
    SilverDragon = {}
end

function SilverDragon:ImportDefaults()
    local emptyZones = {}

    if not self.db or not self.db.profile or not self.db.profile.mobs then
        return
    end

    for zone, mobs in pairs(self.db.profile.mobs) do
        if zone ~= "*" then
            local namesToRemove = {}

            for name, info in pairs(mobs) do
                local defaultInfo = self:GetDefaultMobInfoString(zone, name)
                local _, _, _, _, _, _, lastseen = self:GetMobInfo(zone, name)
                if defaultInfo and (defaultInfo == info or lastseen == 0) then
                    table.insert(namesToRemove, name)
                end
            end

            for _, name in ipairs(namesToRemove) do
                self.db.profile.mobs[zone][name] = nil
            end

            if not next(self.db.profile.mobs[zone]) then
                table.insert(emptyZones, zone)
            end
        end
    end

    for _, zone in ipairs(emptyZones) do
        self.db.profile.mobs[zone] = nil
    end
end
