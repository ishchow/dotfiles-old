local config = require("deardiary.config")
local substitute = require('pl.template').substitute

local personal_weekly_template = [[
# $(entry_date:fmt("# Week %W of %Y: ") .. dates[1]:fmt("%A, %B %d, %Y - ") .. dates[7]:fmt("%A, %B %d, %Y"))
> for i = 1, #dates do
## $(dates[i]:fmt("## %A, %B %d, %Y")) 
### Meal Plan
- Breakfast:
- Lunch:
- Dinner:

### Todo:
- [ ] Task 1
- [ ] Task 2


> end]]

local music_weekly_template = [[
# $(entry_date:fmt("# Week %W of %Y: ") .. dates[1]:fmt("%A, %B %d, %Y - ") .. dates[7]:fmt("%A, %B %d, %Y"))
> for i = 1, #dates do
## $(dates[i]:fmt("## %A, %B %d, %Y")) 
### Practice:
- [ ] Category 1 (15 min)
    - [ ] Item 1 (7.5 min)
    - [ ] Item 2 (7.5 min)
- [ ] Category 2 (15 min)
    - [ ] Item 1 (7.5 min)
    - [ ] Item 2 (7.5 min)
- [ ] Category 3 (15 min)
    - [ ] Item 1 (7.5 min)
    - [ ] Item 2 (7.5 min)


> end]]

local template = function(entry_date, template_str)
    local dates = {}
    for i = 0, 6 do
        table.insert(dates, entry_date:copy():adddays(i))
    end
    local res, _ = substitute(template_str, {
        _escape = ">",
        entry_date = entry_date,
        dates = dates,
    })
    return res
end

config.journals = {
    {
        path = "~/notes/personal/journal",
        frequencies = {
            "daily",
            weekly = {
                template = function(entry_date)
                    return template(entry_date, personal_weekly_template)
                end,
            },
        },
    },
    {
        path = "~/notes/dev/journal",
        frequencies = {"daily", "weekly"},
    },
    {
        path = "~/notes/music/journal",
        frequencies = {
            "daily",
            weekly = {
                template = function(entry_date)
                    return template(entry_date, music_weekly_template)
                end,
            },
        },
    },
    {
        path = "~/notes/writing/journal",
        frequencies = {"daily", "weekly"},
    },
}
