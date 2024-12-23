-- HEAD
description = [[
NSR Script to check for specific port is open on target host.  Useful for quick verification of open ports.
]]

author = "Jon G"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"discovery","safe"}

-- RULES
portrule = function(host, port)
	local port_to_check = { number = [port#], protocol = "[protocol_of_port]" }
	local port_state = nmap.get_port_state(host, port_to_check)

	return port_state ~= nil
		and port_state.state == "open"
end

-- Action
action = function(host, port)
	return "Port is Open!"
end
