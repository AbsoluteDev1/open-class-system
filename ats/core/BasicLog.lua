BasicLog = {}

BasicLog.LogLevel = {
	DEBUG = 1,
	INFO = 2,
	WARN = 3,
	ERROR = 4,
	FATAL = 5
}

BasicLog.LogLevelNames = {
	[BasicLog.LogLevel.DEBUG] = "DEBUG",
	[BasicLog.LogLevel.INFO] = "INFO",
	[BasicLog.LogLevel.WARN] = "WARN",
	[BasicLog.LogLevel.ERROR] = "ERROR",
	[BasicLog.LogLevel.FATAL] = "FATAL"
}

function BasicLog.info(message)
	BasicLog.print(BasicLog.LogLevelNames[BasicLog.LogLevel.INFO],message)
end

function BasicLog.debug(message)
	BasicLog.print(BasicLog.LogLevelNames[BasicLog.LogLevel.DEBUG],message)
end

function BasicLog.print(level,message)
	print(("[ATS][%s] %s"):format(level,message));
end
