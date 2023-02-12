//-------------------
//	I2C commad sets
//-------------------

`define CMD_I2C_CLOCK				= 8'h10
`define CMD_I2C_BASIC_WRITE         = 8'h11
`define CMD_I2C_BASIC_READ          = 8'h12
`define CMD_I2C_READ_EBR            = 8'h13
`define CMD_I2C_FW_WRITE            = 8'h14
`define CMD_I2C_FW_READ             = 8'h15
`define CMD_I2C_MULTI_READ          = 8'h16
`define CMD_I2C_REPEAT_START_READ   = 8'h17

//-------------------
//	SPI commad sets
//-------------------

`define CMD_SPI_MODE				= 8'h50
`define CMD_SPI_CLOCK				= 8'h51
`define CMD_SPI_BASIC_WRITE         = 8'h52
`define CMD_SPI_BASIC_READ          = 8'h53
`define CMD_SPI_READ_EBR            = 8'h54
`define CMD_SPI_SET_CS				= 8'h55
`define CMD_SPI_FW_WRITE            = 8'h56
`define CMD_SPI_FW_READ             = 8'h57
`define CMD_SPI_MULTI_ADDR_READ		= 8'h58
`define CMD_SPI_ADC_ADS7961_READ	= 8'h59
// `define CMD_SPI_ADC_AD4111_READ		= 8'h5A
`define CMD_SPI_SET_SYS_CLOCK		= 8'h5B


//-------------------
//	FPR commad sets
//-------------------

`define CMD_FPR_SPI_MODE				= 8'h70
`define CMD_FPR_SPI_CLOCK				= 8'h71
`define CMD_FPR_SPI_BASIC_WRITE         = 8'h72
`define CMD_FPR_SPI_BASIC_READ          = 8'h73
`define CMD_FPR_SPI_READ_EBR            = 8'h74
`define CMD_FPR_SPI_SET_CS				= 8'h75
`define CMD_FPR_SPI_FW_WRITE            = 8'h76
`define CMD_FPR_SPI_FW_READ             = 8'h77
`define CMD_FPR_SPI_MULTI_ADDR_READ		= 8'h78


//-------------------
//	I3C commad sets
//-------------------

`define CMD_I3C_CLOCK				= 8'h30
`define CMD_I3C_FW_WRITE        	= 8'h31
`define CMD_I3C_FW_READ     	    = 8'h32
`define CMD_I3C_READ_EBR            = 8'h33
`define CMD_I3C_BCCCC_WRITE         = 8'h34
`define CMD_I3C_DIRCCC_WRITE        = 8'h35
`define CMD_I3C_DIRCCC_READ			= 8'h36	
`define CMD_I3C_DDR_STCMD_READ		= 8'h37	
`define CMD_I3C_DDR_WRITE			= 8'h38
`define CMD_I3C_DDR_READ			= 8'h39
// `define CMD_I3C_IBI				    = 8'h3A
`define CMD_I3C_DAA				    = 8'h3B
`define CMD_I3C_IBI_PARAMETER		= 8'h3C
`define CMD_I3C_BASIC_WRITE			= 8'h3D
`define CMD_I3C_BASIC_READ			= 8'h3E
`define CMD_I3C_TCS_WRITE			= 8'h40
`define CMD_I3C_TCS_READ			= 8'h41
`define CMD_I3C_TCS_FW_WRITE		= 8'h42	
`define CMD_I3C_TCS_DDR_FW_WRITE	= 8'h43	



