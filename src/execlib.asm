include 'include/ez80.inc'
include 'include/ti84pceg.inc'
include 'include/tiformat.inc'
format ti executable 'EXECLIB'
include 'include/app.inc'

; ------------------------------------------------
; this table holds the list of functions to export
; to the basic library. Order matters.

	export DoNothing
	export RunIndicOff
	export EnableLowercase

; ------------------------------------------------
; create application
; returns nz if could not create the application
; i.e. already installed
	app_create
	
	ret	nz
	call	_ChkFindSym
	jp	_DelVarArc		; delete installer code

; ------------------------------------------------
; start of actual application code
	app_start 'EXECLIB', '(C) 2017 MateoConLechuga', '0.0.0.1', 3
	
	jp	_JForceCmdNoChar	; just exit when someone tries to launch

DoNothing:
	ret

RunIndicOff:
	jp	_RunIndicOff

EnableLowercase:
	set	lwrCaseActive,(iy + appLwrCaseFlag)
	ret

; ------------------------------------------------
; Anything placed after app_data is essentially
; written to ram on start. This can be at most 4kB
; in size.
	app_data
	
Dummybyte:
	db	0
