--MySQL connection information to use in conjunction with luamysql
--This can be dropped in the eqemu server root directory and will be automatically referenced
--this information can be pulled from the eqemu_config.xml file in the eqemu server root

-- load driver
local driver = require("luasql_mysql");

--declare table
local luasql_ext = {};

--set database information
local database_name = "local_dev";
local user = "root";
local password = "eqemu";
local ip_addr = "localhost";
local port = "3306";

function luasql_ext.env(e)
	-- create environment object
	env = assert (driver.mysql());
	return env;
end

function luasql_ext.con(e)
	-- connect to data source
	con = assert (env:connect(database_name,user,password,ip_addr,port));
	return con;
end

function luasql_ext.rows(connection,statement)
	env = assert (driver.mysql());
	local con = connection or assert (env:connect(database_name,user,password,ip_addr,port));
	local cur = assert (con:execute(statement));
	con:close();
	env:close();	
	return function()
		return cur:fetch()
	end
end

return luasql_ext;
