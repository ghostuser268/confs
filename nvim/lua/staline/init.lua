--local STYLE = 'minimal' -- fancy | minimal | monochrome

local STYLE = "minimal"
return {
  run = function()
    local mode = require("staline.modules.mode")
    local filename = require("staline.modules.filename")
    local folder = require("staline.modules.folder")
    local position = require("staline.modules.position")
    return table.concat {
      mode(STYLE),
      filename(),
      "%=",
      folder(STYLE),
      position(STYLE),
    };
  end,
}
