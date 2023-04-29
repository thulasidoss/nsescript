description=[[script for open port scanning]]

author = "thulasi doss"

portrule = function(host, port)
  return port.protocol == "tcp" and port.state == "open"
end

action = function(host, port)
  local sock = nmap.new_socket()
  local result = sock:connect(host, port)
  sock:close()
  if result then
    return "the\t".. port.number .."\tport is open"
  else
    return "the\t".. port.number .."\tport is close"
  end
end
