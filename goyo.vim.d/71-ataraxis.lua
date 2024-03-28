--
-- True-Zen specific configuration to finally retire the olde Goyo plugin.
-- This also disables all other modes of the plugin for this version of
-- the editor.
--

require'true-zen'.setup {
    modes = { ataraxis = {
    } }
}
