BasicLog = {}



BasicLog.LogLevel = {
	TRACE = 0,
	DEBUG = 1,
	INFO = 2,
	WARN = 3,
	ERROR = 4,
	FATAL = 5
}

BasicLog.LogLevelNames = {
	[BasicLog.LogLevel.TRACE] = "TRACE",
	[BasicLog.LogLevel.DEBUG] = "DEBUG",
	[BasicLog.LogLevel.INFO] = "INFO",
	[BasicLog.LogLevel.WARN] = "WARN",
	[BasicLog.LogLevel.ERROR] = "ERROR",
	[BasicLog.LogLevel.FATAL] = "FATAL"
}

BasicLog.CurrentLogLevel = BasicLog.LogLevel.DEBUG;

function BasicLog.trace(message,...)
	if BasicLog.CurrentLogLevel > BasicLog.LogLevel.TRACE then
		return;
	end
	local args = {...}
	message = string.format(message,unpack(args))
	BasicLog.print(BasicLog.LogLevelNames[BasicLog.LogLevel.TRACE],message)
end

function BasicLog.info(message,...)
	if BasicLog.CurrentLogLevel > BasicLog.LogLevel.INFO then
		return;
	end
	local args = {...}
	message = string.format(message,unpack(args))
	BasicLog.print(BasicLog.LogLevelNames[BasicLog.LogLevel.INFO],message)
end

function BasicLog.debug(message,...)
	if BasicLog.CurrentLogLevel > BasicLog.LogLevel.DEBUG then
		return;
	end
	local args = {...}
	message = string.format(message,unpack(args))
	BasicLog.print(BasicLog.LogLevelNames[BasicLog.LogLevel.DEBUG],message)
end

function BasicLog.warn(message,...)
	if BasicLog.CurrentLogLevel > BasicLog.LogLevel.WARN then
		return;
	end
	local args = {...}
	message = string.format(message,unpack(args))
	BasicLog.print(BasicLog.LogLevelNames[BasicLog.LogLevel.WARN],message)
end

function BasicLog.error(message,...)
	if BasicLog.CurrentLogLevel > BasicLog.LogLevel.ERROR then
		return;
	end
	local args = {...}
	message = string.format(message,unpack(args))
	BasicLog.print(BasicLog.LogLevelNames[BasicLog.LogLevel.ERROR],message)
end

function BasicLog.print(level,message)
	print(("[ATS][%s] %s^7"):format(level,message));
end
