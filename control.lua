--control.lua

local function starts_with(str, start)
    return str:sub(1, #start) == start
 end

function removeTile(e)
    -- Get the settings
    local setting = settings.global["RO-behaviour"].value

    -- Remove the resource if the setting is on
    if setting ~= "off" then
        for index, tile in pairs(e.tiles) do
            -- Get the entities in the current area
            local entities = game.surfaces["nauvis"].find_entities({{tile.position.x, tile.position.y}, {tile.position.x + 1, tile.position.y + 1}})
        
            for index, entity in pairs(entities) do
                if entity.type == "resource" then
                    if setting == "all" then
                        entity.destroy()
                    else 
                        if setting == "infinite only" and starts_with(entity.name, "infinite") then
                            entity.destroy()
                        end
                    end
                end
            end
        end
    end
end

script.on_event({defines.events.on_player_built_tile}, removeTile)
script.on_event({defines.events.on_robot_built_tile}, removeTile)
