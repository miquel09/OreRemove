--control.lua

function removeTile(e)
    for index, tile in pairs(e.tiles) do
        local entities = game.surfaces["nauvis"].find_entities({{tile.position.x, tile.position.y}, {tile.position.x + 1, tile.position.y + 1}})
        
        for index, entity in pairs(entities) do
            if(entity.type == "resource") then
                entity.destroy()
            end
        end
    end
end

script.on_event({defines.events.on_player_built_tile}, removeTile)
script.on_event({defines.events.on_robot_built_tile}, removeTile)
