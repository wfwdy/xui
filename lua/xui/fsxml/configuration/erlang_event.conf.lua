--[[
/*
 * HTML5 GUI Framework for FreeSWITCH - XUI
 * Copyright (C) 2015-2017, Seven Du <dujinfang@x-y-t.cn>
 *
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is XUI - GUI for FreeSWITCH
 *
 * The Initial Developer of the Original Code is
 * Seven Du <dujinfang@x-y-t.cn>
 * Portions created by the Initial Developer are Copyright (C)
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * Seven Du <dujinfang@x-y-t.cn>
 *
 *
 */
]]

function get_erlang_event_params()
	params = ""
	local cond = {realm = 'erlang_event'}
	xdb.find_by_cond("erlang_event", cond, "id", function(row)
		params = params .. '<param name="' .. row.k .. '"' .. ' value="' .. row.v .. '"/>'
	end)
	return params
end

xXML_STRING=[[
<configuration name="erlang_event.conf" description="mod erlang_event config">
<settings>]] ..
        get_erlang_event_params() ..
[[</settings></configuration>
]]

freeswitch.consoleLog("NOTICE", "ROWS: " .. xXML_STRING)