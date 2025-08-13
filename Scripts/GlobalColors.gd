extends Node

#(R, G, B, A)
const STARDEFAULTCOLOR := Color(1,1,1,1)
const BGDEFAULTCOLOR := Color(0,0,0.1,1)
const SHIPOUTLINEDEFAULTCOLOR := Color(1,1,1,1)
const SHIPFILLDEFAULTCOLOR := Color(0,0,0,1)
const SHIPSHOTDEFAULTCOLOR := Color(1,1,1,1)
const SMOKEDEFAULTINITIALCOLOR := Color(0,0,0,1)
const SMOKEDEFAULTENDCOLOR := Color(1,1,1,1)

var starcolor := STARDEFAULTCOLOR
var starchanged := false

var bgcolor := BGDEFAULTCOLOR
var bgchanged := false

var shipoutlinecolor := SHIPOUTLINEDEFAULTCOLOR
var shipoutlinechanged := false
var updateoutlinealpha := false
var shipfillcolor := SHIPFILLDEFAULTCOLOR
var shipfillchanged := false

var shipshotcolor := SHIPSHOTDEFAULTCOLOR
var shipshotchanged := false
var shipchargedshotchanged := false

var smokeinitialcolor := SMOKEDEFAULTINITIALCOLOR
var smokeendcolor := SMOKEDEFAULTENDCOLOR
var smokecolorchanged := false
