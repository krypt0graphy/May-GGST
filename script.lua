--Default values
axeBool = true


--Vanilla model
vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)
vanilla_model.HELMET_ITEM:setVisible(true)
vanilla_model.CAPE:setVisible(false)
vanilla_model.ELYTRA:setVisible(false)

--Scripts
local squapi = require("SquAPI")
local anims = require("JimmyAnims")
local squassets = require("SquAssets")

--Models
models.totsugeki:setVisible(false)
models.model.AnimAnchorNegative.AnimAnchor:setVisible(false)
anims(animations.model)


--Squishy
local bounceWalk = squapi.bounceWalk:new(models.model, 0.75)
local smoothTorso = squapi.smoothHead:new(models.model.root.Torso, 0.25, 0.1, 1, false)
local smoothHead= squapi.smoothHead:new(models.model.root.Torso.Head, 0.5, 0.6, 1, true)
--Pages
local myPage = action_wheel:newPage()

-- Main actions
local BackpackAction = myPage:newAction()
local AxeAction = myPage:newAction()

--Toggle Backpack
function pings.backpackToggle(isToggled)
    if isToggled then
        models.model.root.Torso.Body.Backbling:setVisible(true)
    else
        models.model.root.Torso.Body.Backbling:setVisible(false)
    end
end

BackpackAction
:title("Toggle Backpack")
:item("bundle")
:onToggle(pings.backpackToggle)
BackpackAction:toggled(true)

--Toggle axe
function pings.axeToggle(isToggled)
    if isToggled then
        axeBool = true
    else
        axeBool = false
    end
end

AxeAction
:title("Show Axes as May's anchor")
:item("iron_axe")
:onToggle(pings.axeToggle)
AxeAction:toggled(true)

--Item Render
function events.item_render(item)
    if axeBool then
        if item.id:find("_axe") then
            return models.anchor.ItemAnchor
        end
    end
end
