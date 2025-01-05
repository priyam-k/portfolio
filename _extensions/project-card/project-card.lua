function createcard(title, desc, language, img, srclink)
  local linkmode = "Source"
  local biclass = "bi-link-45deg"
  if string.find(srclink, "github") then
    linkmode = "on Github"
    biclass = "bi-github"
  end
  local htmlstr = [[
<div class="card" data-language="%s">
    <div class="imgcontainer">
      <img src="%s" alt="Card Image">
      <div class="text-overlay">%s</div>
    </div>
    <div class="card-content">
        <h3 class="card-title">
            <span>%s</span>
            <a href="%s" target="_blank" class="text-body" title="View %s">
                <i class="bi %s"></i>
            </a>
        </h3>
        <p class="card-description">%s</p>
    </div>
</div>
]]
  return string.format(htmlstr, language, img, language, title, srclink, linkmode, biclass, desc)
end

return {
  ['project-card'] = function(args, kwargs, meta) 
    -- get args
    local title = kwargs["title"]
    local desc = kwargs["desc"]
    local language = kwargs["language"]
    local img = kwargs["img"]
    -- local link = kwargs["link"]
    local srclink = kwargs["srclink"]
    -- return html block for a card based on args
    return pandoc.RawBlock('html',
    createcard(title, desc, language, img, srclink)
  )
  end
}
