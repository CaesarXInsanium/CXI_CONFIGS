// *****************************************************************************
// Copyright (c) 2014, 2015, 2016, 2017 Pay With Privacy, Inc. All rights reserved.
// Authors:
// Jason Kruse   (jason@privacy.com)
// David Nichols (david@privacy.com)
// Boling Jiang  (boling@privacy.com)
// Felippe Nardi (felippe@privacy.com)
// *****************************************************************************
var Message;"undefined"!==typeof exports&&(Message=require("Message").Message);var Entity;
(function(){Entity=function(e,k){this.name=e;var f=new Message(e,k),d=function(a,b){f.send(a,b||function(){})},c=function(a){"background"!=e&&d({invoke:"log",data:a},function(){})},g={log:function(a,b){c(a,b)}},h=function(a,b,f){if("background"==e)a.invoke&&g[a.invoke]?(b=b&&b.tab&&b.tab.id?b.tab.id:0,"log"!=a.invoke&&c("remote invocation of '"+a.invoke+"'"),g[a.invoke](a.data,f,b)):a.invoke?(c(g,!0),c("Cannot invoke: "+a.invoke)):c("Some other invocation");else if("content"==e){var d=CheckoutFactory();
d.findCheckoutForm()&&pwp.invoke("get","card",function(a){a=new PaymentCard(a.PAN,a.CVV,a.expMonth,a.expYear,"","","","");d.populateFields(a)})}return!0};f.addListener(h);c("initialized entity");return{getName:function(){return this.name},message:d,invoke:function(a,b,c){d({invoke:a,data:b},c)},log:c,register:function(a,b){g[a]=b},setContentScript:function(a,b){f.addPort(a,b)},listenerFunc:h}};"undefined"!==typeof exports&&(exports.Entity=Entity)})();
