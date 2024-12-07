function createcard(title, desc, language, img, link, ghlink)
  local htmlstr = [[
<div class="card" data-language="%s">
    <img src="%s" alt="Card Image">
    <div class="card-content">
        <h3 class="card-title">
            <span>%s</span>
            <a href="%s" target="_blank" class="text-body" title="View on GitHub">
                <i class="bi bi-github"></i>
            </a>
        </h3>
        <p class="card-description">%s</p>
        <a href="%s" target="_blank">Learn More</a>
    </div>
</div>
]]
  return string.format(htmlstr, language, img, title, ghlink, desc, link)
end

return {
  ['project-card'] = function(args, kwargs, meta) 
    -- get args
    local title = kwargs["title"]
    local desc = kwargs["desc"]
    local language = kwargs["language"]
    local img = kwargs["img"]
    local link = kwargs["link"]
    local ghlink = kwargs["ghlink"]
    -- return html block for a card based on args
    return pandoc.RawBlock('html',
    createcard(title, desc, language, img, link, ghlink)
  )
  end
}
