-- init env and os calls
if minetest.request_insecure_environment then
   ie = minetest.request_insecure_environment()
else
   ie = _G
end

-- when player joins
minetest.register_on_joinplayer(function(player)
  sendToDiscord(':map: <--- {'..player:get_player_name()..'} joined neoxian.city minetest world...')
end)

-- when player leaves
minetest.register_on_leaveplayer(function(player)
  sendToDiscord(':map: ---> {'..player:get_player_name()..'} left neoxian.city minetest world...')
end)

-- function to send to discord
function sendToDiscord(message)
    -- webhook
    local url = '<WEBHOOK-URL>'
    local msg = 'curl -H "Content-Type: application/json" -X POST -d \"{\\"content\\":\\"'..message..'\\"}\" '..url
    print(msg)
    ie.os.execute(msg)
end

-- neoxian silver block
minetest.register_node("neoxian:silver", {
    description = "neoxian silver block",
    tiles = {
        "neoxian_silver.png",
        "neoxian_silver.png",
        "neoxian_silver.png",
        "neoxian_silver.png",
        "neoxian_silver.png",
        "neoxian_silver.png"
    },
})
