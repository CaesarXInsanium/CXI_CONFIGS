// *****************************************************************************
// Copyright (c) 2014, 2015, 2016, 2017 Pay With Privacy, Inc. All rights reserved.
// Authors:
// Jason Kruse   (jason@privacy.com)
// David Nichols (david@privacy.com)
// Boling Jiang  (boling@privacy.com)
// Felippe Nardi (felippe@privacy.com)
// *****************************************************************************
function PaymentCard(b,c,d,e,f,g,h,k){_pan=b;_cvv=c;_expMonth=d;_expYear=e;_street=f||"";_city=g||"";_state=h||"";_zip=k||"";_mii=_pan.substr(0,1);return{getPAN:function(){return _pan},getCVV:function(){return _cvv},getMonth:function(){return parseInt(_expMonth)},getYear:function(){return parseInt(_expYear)},getStreet:function(){return _street},getCity:function(){return _city},getState:function(){return _state},getZip:function(){return _zip},network:{getRegex:function(){if("4"===_mii)return/visa/i;
if("5"===_mii)return/master ?card/i;throw Exception("Unsupported card type");},getString:function(b){if("4"===_mii)var a="visa";else if("5"===_mii)a="mastercard";else throw Exception("Unsupported card type");b&&(a=a.substr(0,1).toUpperCase()+a.substr(1));return a}}}};
