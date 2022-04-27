// *****************************************************************************
// Copyright (c) 2014, 2015, 2016, 2017 Pay With Privacy, Inc. All rights reserved.
// Authors:
// Jason Kruse   (jason@privacy.com)
// David Nichols (david@privacy.com)
// Boling Jiang  (boling@privacy.com)
// Felippe Nardi (felippe@privacy.com)
// *****************************************************************************
var Message;(function(){Message=function(a){this.name=a;return{send:function(b,a){chrome.runtime.sendMessage(b,a)},addListener:function(a){chrome.runtime.onMessage.addListener(a)}}};"undefined"!==typeof exports&&(exports.Message=Message)})();
