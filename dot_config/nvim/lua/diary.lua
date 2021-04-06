local config = require("deardiary.config")
local substitute = require('pl.template').substitute

local personal_daily_template = [[
# $(entry_date:fmt("%A, %B %d, %Y"))
## Notes

## Journal

]]

local default_weekly_template = [[
# $(entry_date:fmt("Week %W of %Y: ") .. dates[1]:fmt("%A, %B %d, %Y - ") .. dates[7]:fmt("%A, %B %d, %Y"))
> for i = 1, #dates do
## $(dates[i]:fmt("%A, %B %d, %Y"))


> end]]

local personal_weekly_template = [[
# $(entry_date:fmt("Week %W of %Y: ") .. dates[1]:fmt("%A, %B %d, %Y - ") .. dates[7]:fmt("%A, %B %d, %Y"))
> for i = 1, #dates do
## $(dates[i]:fmt("%A, %B %d, %Y"))
### Meal Plan
- Breakfast:
- Lunch:
- Dinner:

### Todo
- [ ] Task 1
- [ ] Task 2


> end]]

local dev_daily_template = [[
# $(entry_date:fmt("%A, %B %d, %Y"))
## Notes

]]

local music_weekly_template = [[
# $(entry_date:fmt("Week %W of %Y: ") .. dates[1]:fmt("%A, %B %d, %Y - ") .. dates[7]:fmt("%A, %B %d, %Y"))
> for i = 1, #dates do
## $(dates[i]:fmt("%A, %B %d, %Y"))
### Practice
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

local template_daily = function(entry_date, daily_template_str)
    local res, _ = substitute(daily_template_str, {
        _escape = ">",
        entry_date = entry_date,
    })
    return res
end

local template_weekly = function(entry_date, weekly_template_str)
    local dates = {}
    for i = 0, 6 do
        table.insert(dates, entry_date:copy():adddays(i))
    end
    local res, _ = substitute(weekly_template_str, {
        _escape = ">",
        entry_date = entry_date,
        dates = dates,
    })
    return res
end

config.frequencies.weekly.template = function(entry_date)
    return template_weekly(entry_date, default_weekly_template)
end

config.journals = {
    {
        path = "~/notes/personal/journal",
        frequencies = {
            daily = {
                template = function(entry_date)
                    return template_daily(entry_date, personal_daily_template)
                end,
            },
            weekly = {
                template = function(entry_date)
                    return template_weekly(entry_date, personal_weekly_template)
                end,
            },
        },
    },
    {
        path = "~/notes/dev/journal",
        frequencies = {
            daily = {
                template = function(entry_date)
                    return template_daily(entry_date, dev_daily_template)
                end,
            },
            "weekly",
        },
    },
    {
        path = "~/notes/music/journal",
        frequencies = {
            "daily",
            weekly = {
                template = function(entry_date)
                    return template_weekly(entry_date, music_weekly_template)
                end,
            },
        },
    },
    {
        path = "~/notes/writing/journal",
        frequencies = {
            "daily",
            "weekly",
        },
    },
}
