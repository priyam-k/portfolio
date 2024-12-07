function createcard(title, desc, img, link, ghlink)
  local htmlstr = [[
<div class="card">
    <img src="%s" alt="Card Image">
    <div class="card-content">
        <h3 class="card-title">
            <span>%s</span>
            <a href="%s" target="_blank" class="github-link" title="View on GitHub">
                <i class="bi bi-github"></i>
            </a>
        </h3>
        <p class="card-description">%s</p>
        <a href="%s" target="_blank">Learn More</a>
    </div>
</div>
]]
  return string.format(htmlstr, img, title, ghlink, desc, link)
end

return {
  ['project-card'] = function(args, kwargs, meta) 
    -- get args
    local title = kwargs["title"]
    local desc = kwargs["desc"]
    local img = kwargs["img"]
    local link = kwargs["link"]
    local ghlink = kwargs["ghlink"]
    -- return html block for a card based on args
    return pandoc.RawBlock('html',
    createcard(title, desc, img, link, ghlink)
  )
  end
}
