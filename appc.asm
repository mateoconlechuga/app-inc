#include "app.inc"
#include "ti84pce.inc"

	.db	tExtTok,tAsm84CECmp
	.org	usermem
	
	app_create()
	ret

app_start("MyApp", "(c) 2017")

	call	_ClrScrn
	call	_HomeUp
	ld	hl,string
	call	_PutS
	call	_NewLine
	jp	_GetKey

app_data()
string:
	.db	"Hello World",0
app_end()

